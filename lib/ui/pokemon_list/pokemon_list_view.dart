import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../api/models/api_response.dart';
import '../../api/models/pokemon/pokemon.dart';
import '../../api/models/pokemon/pokemon_request.dart';
import '../../dependency_injection_container.dart';
import '../../extensions/build_context_extension.dart';
import '../../theme/base_theme.dart';
import '../../theme/poke_app_text.dart';
import '../pokemon_filter/filter_view_holder.dart';
import '../shared_widgets/error_widget.dart' as ew;
import '../shared_widgets/loading_widget.dart';
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
  final _filterViewModel = getIt.get<FilterViewModel>();

  final _textController = TextEditingController();

  String previousSearch = '';

  @override
  void initState() {
    super.initState();
    _addTextListener();
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
            _pokemonViewModel.updateQuery(
              PokemonRequest(
                (b) => b..pokemonTypes.replace(selectedTypes),
              ),
            );
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
      (search) {
        _pokemonViewModel.updateQuery(
          PokemonRequest(
            (b) => b..search = search,
          ),
        );
      },
    );
  }

  void _addTextListener() {
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //TODO if is searching or filters open close search or close filters.

        return true;
      },
      child: Scaffold(
        body: NestedScrollView(
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
          body: Stack(
            children: [
              _buildPokemonList(),
              Align(
                alignment: Alignment.bottomCenter,
                child: _buildFilter(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPokemonList() {
    return SliverRefreshIndicator(
      onRefresh: _pokemonViewModel.refresh,
      padding: EdgeInsets.zero,
      sliver: MultiSliver(
        children: [
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: PagedSliverList.separated(
              pagingController: _pokemonViewModel.getPagingController(),
              builderDelegate: PagedChildBuilderDelegate<Pokemon>(
                itemBuilder: (context, pokemon, index) => _buildPokemonTile(
                  pokemon: pokemon,
                ),
                firstPageErrorIndicatorBuilder: (context) => _buildErrorWidget(),
                noItemsFoundIndicatorBuilder: (context) => _emptyListIndicator(),
                newPageErrorIndicatorBuilder: (context) =>
                    _errorListItemWidget(onTryAgain: _pokemonViewModel.retryLastRequest),
                firstPageProgressIndicatorBuilder: (context) => const Center(
                  child: PokeballLoadingWidget(
                    size: Size(80, 80),
                  ),
                ),
                newPageProgressIndicatorBuilder: (context) => _loadingListItemWidget(),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 4,
              ),
            ),
          ),
        ],
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
  }) {
    return PokemonTile(
      pokemon: pokemon,
    );
  }
}
