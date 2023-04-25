import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rxdart/rxdart.dart';

import '../../ads/native_ad.dart';
import '../../ads/view_models/google_ads_view_model.dart';
import '../../api/models/api_response.dart';
import '../../api/models/news/article.dart';
import '../../api/models/pokemon/stat.dart';
import '../../dependency_injection_container.dart';
import '../../extensions/build_context_extension.dart';
import '../../theme/base_theme.dart';
import '../../theme/poke_app_text.dart';
import '../pokemon_filter/filter_view_holder.dart';
import '../pokemon_list/pokemon_tile.dart';
import '../pokemon_list/search_app_bar.dart';
import '../pokemon_list/view_models/filter_view_model.dart';
import '../shared_widgets/error_widget.dart' as ew;
import '../shared_widgets/no_results.dart';
import '../shared_widgets/pokeball_loading_widget.dart';
import '../shared_widgets/rounded_button.dart';
import '../shared_widgets/sliver_refresh_indicator.dart';
import '../shared_widgets/view_constraint.dart';
import 'views_models/pokemon_news_list_view_model.dart';
import 'widgets/article_tile.dart';

class PokemonNewsListView extends StatefulWidget {
  PokemonNewsListView({Key? key}) : super(key: key);

  @override
  State<PokemonNewsListView> createState() => _PokemonNewsListViewState();
}

class _PokemonNewsListViewState extends State<PokemonNewsListView> {
  final _pokemonNewsListViewModel = getIt.get<PokemonNewsListViewModel>();
  final _googleAdsViewModel = getIt.get<GoogleAdsViewModel>();

  final _textController = TextEditingController();

  String previousSearch = '';

  @override
  void initState() {
    super.initState();
    _pokemonNewsListViewModel.getHighlightedNews();
    _addSearchTextListener();
    _addSearchListener();
  }

  void _addSearchListener() {
    _pokemonNewsListViewModel.searchText
        .debounce(
          (_) => TimerStream(
            true,
            const Duration(milliseconds: 700),
          ),
        )
        .listen(
          _pokemonNewsListViewModel.setSearch,
        );
  }

  void _addSearchTextListener() {
    _textController.addListener(
      () {
        if (_textController.text != previousSearch) {
          previousSearch = _textController.text;
          _pokemonNewsListViewModel.searchText.add(_textController.text);
        }
      },
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _pokemonNewsListViewModel.dispose();
    _googleAdsViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //TODO if filters open close filters.

        return true;
      },
      child: Scaffold(
        body: Stack(
          children: [
            NestedScrollView(
              headerSliverBuilder: (nestedScrollViewContext, innerBoxScrolled) {
                return [
                  StreamBuilder<String?>(
                    stream: _pokemonNewsListViewModel.searchText,
                    builder: (context, snapshot) {
                      return _buildHeaderBar();
                    },
                  ),
                ];
              },
              body: _buildPokemonList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPokemonList() {
    return SliverRefreshIndicator(
      onRefresh: () async {
        //TODO this refresh doesn't get the current search and just retries whatever the last search was even if the text has changed
        _pokemonNewsListViewModel.refresh();
      },
      padding: EdgeInsets.zero,
      sliver: SliverPadding(
        padding: const EdgeInsets.all(8),
        sliver: PagedSliverList(
          pagingController: _pokemonNewsListViewModel.getPagingController(),
          builderDelegate: PagedChildBuilderDelegate<Article>(
            itemBuilder: (context, article, index) => _buildArticleTile(
              article: article,
              showAd: _googleAdsViewModel.showAdAtIndex(index) && index != 0,
            ),
            firstPageErrorIndicatorBuilder: (context) => _buildErrorWidget(),
            noItemsFoundIndicatorBuilder: (context) => _emptyListIndicator(),
            newPageErrorIndicatorBuilder: (context) =>
                _errorListItemWidget(onTryAgain: _pokemonNewsListViewModel.retryLastRequest),
            firstPageProgressIndicatorBuilder: (context) => const Center(
              child: PokeballLoadingWidget(
                size: Size(
                  kPokemonTileImageHeight,
                  kPokemonTileImageHeight,
                ),
              ),
            ),
            newPageProgressIndicatorBuilder: (context) => _loadingListItemWidget(),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderBar() {
    return SearchAppBar(
      searchTextController: _textController,
      filterViewModel: null,
      heroWidget: _buildHighlightArticle(),
    );
  }

  Widget _buildHighlightArticle() {
    return StreamBuilder<ApiResponse<Article?>>(
      stream: _pokemonNewsListViewModel.highlightedArticle,
      builder: (context, snapshot) {
        final isLoading = snapshot.data?.status == Status.LOADING;
        final hasError = snapshot.data?.status == Status.ERROR;
        final article = snapshot.data?.data;
        if(article != null) {
          _buildArticleTile(article: article);
        }
        return SizedBox();
      },
    );
  }

  Widget _buildErrorWidget() {
    final error = _pokemonNewsListViewModel.getPagingController().error as ApiResponse;
    return ViewConstraint(
      constraints: const BoxConstraints(
        maxWidth: 280,
      ),
      child: ew.ErrorWidget(
        showImage: true,
        error: error,
        onTryAgain: () => _pokemonNewsListViewModel.getPagingController().refresh(),
      ),
    );
  }

  Widget _errorListItemWidget({
    required VoidCallback onTryAgain,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.strings.error_getting_page,
            style: PokeAppText.body4Style.copyWith(
              color: colors(context).textOnForeground,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          RoundedButton(
            label: context.strings.retry,
            textStyle: PokeAppText.body4Style.copyWith(
              color: colors(context).textOnForeground,
            ),
            outlineColor: colors(context).warning,
            isFilled: true,
            fillColor: colors(context).cardBackground,
            onPressed: onTryAgain,
          ),
        ],
      ),
    );
  }

  Widget _loadingListItemWidget() {
    return const SizedBox(
      height: 108,
      child: Center(
        child: PokeballLoadingWidget(
          size: Size(
            42,
            42,
          ),
        ),
      ),
    );
  }

  Widget _emptyListIndicator() {
    return const NoResults();
  }

  Widget _buildArticleTile({
    required Article article,
    bool showAd = false,
  }) {
    return ViewConstraint(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showAd) NativeAd(),
          ArticleTile(
            article: article,
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
