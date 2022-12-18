import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rxdart/rxdart.dart';

import '../../ads/list_banner_ad.dart';
import '../../ads/view_models/google_ads_view_model.dart';
import '../../api/models/api_response.dart';
import '../../api/models/pokemon/pokemon.dart';
import '../../dependency_injection_container.dart';
import '../../extensions/build_context_extension.dart';
import '../../theme/base_theme.dart';
import '../../theme/poke_app_text.dart';
import '../pokemon_filter/filter_view_holder.dart';
import '../shared_widgets/error_widget.dart' as ew;
import '../shared_widgets/no_results.dart';
import '../shared_widgets/pokeball_loading_widget.dart';
import '../shared_widgets/rounded_button.dart';
import '../shared_widgets/sliver_refresh_indicator.dart';
import 'pokemon_tile.dart';
import 'search_app_bar.dart';
import 'view_models/filter_view_model.dart';
import 'view_models/pokemon_list_view_model.dart';

class PokemonListView extends StatefulWidget {
  PokemonListView({Key? key}) : super(key: key);

  @override
  State<PokemonListView> createState() => _PokemonListViewState();
}

class _PokemonListViewState extends State<PokemonListView> {
  final _pokemonViewModel = getIt.get<PokemonListViewModel>();
  final _googleAdsViewModel = getIt.get<GoogleAdsViewModel>();
  final _filterViewModel = getIt.get<FilterViewModel>();

  final _textController = TextEditingController();

  String previousSearch = '';

  @override
  void initState() {
    super.initState();
    _addSearchTextListener();
    _addSearchListener();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _addSelectedFilterListener();
      },
    );
  }

  void _addSelectedFilterListener() {
    const duration = Duration(milliseconds: 200);
    _filterViewModel.selectedFiltersStream.listen(
      (selectedTypes) {
        Future.delayed(duration).then(
          (value) {
            _pokemonViewModel.setSelectedTypes(selectedTypes);
            if (_filterViewModel.scrollController.hasClients) {
              _filterViewModel.scrollController.animateTo(
                _filterViewModel.scrollController.position.maxScrollExtent,
                duration: duration,
                curve: Curves.fastOutSlowIn,
              );
            }
          },
        );
      },
    );
  }

  void _addSearchListener() {
    _pokemonViewModel.searchText
        .debounce(
          (_) => TimerStream(
            true,
            const Duration(milliseconds: 700),
          ),
        )
        .listen(
          _pokemonViewModel.setSearch,
        );
  }

  void _addSearchTextListener() {
    _textController.addListener(
      () {
        if (_textController.text != previousSearch) {
          previousSearch = _textController.text;
          _pokemonViewModel.searchText.add(_textController.text);
        }
      },
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _pokemonViewModel.dispose();
    _filterViewModel.dispose();
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
                    stream: _pokemonViewModel.searchText,
                    builder: (context, snapshot) {
                      return _buildHeaderBar();
                    },
                  ),
                ];
              },
              body: _buildPokemonList(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: _buildFilter(),
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
        _pokemonViewModel.refresh();
      },
      padding: EdgeInsets.zero,
      sliver: SliverPadding(
        padding: const EdgeInsets.all(8),
        sliver: PagedSliverList(
          pagingController: _pokemonViewModel.getPagingController(),
          builderDelegate: PagedChildBuilderDelegate<Pokemon>(
            itemBuilder: (context, pokemon, index) => _buildPokemonTile(
              pokemon: pokemon,
              showAd: _googleAdsViewModel.showAdAtIndex(index) && index != 0,
            ),
            firstPageErrorIndicatorBuilder: (context) => _buildErrorWidget(),
            noItemsFoundIndicatorBuilder: (context) => _emptyListIndicator(),
            newPageErrorIndicatorBuilder: (context) =>
                _errorListItemWidget(onTryAgain: _pokemonViewModel.retryLastRequest),
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

  Widget _buildFilter() {
    return FilterViewHolder(
      filterViewModel: _filterViewModel,
    );
  }

  Widget _buildHeaderBar() {
    return SearchAppBar(
      searchTextController: _textController,
      filterViewModel: _filterViewModel,
    );
  }

  Widget _buildErrorWidget() {
    final error = _pokemonViewModel.getPagingController().error as ApiResponse;
    return ew.ErrorWidget(
      showImage: true,
      error: error,
      onTryAgain: () => _pokemonViewModel.getPagingController().refresh(),
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

  Widget _buildPokemonTile({
    required Pokemon pokemon,
    bool showAd = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showAd) ListBannerAd(),
        PokemonTile(
          pokemon: pokemon,
        ),
      ],
    );
  }
}
