import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../api/models/api_response.dart';
import '../../api/models/pokemon/pokemon.dart';
import '../../api/models/pokemon/pokemon_request.dart';
import '../../api/models/pokemon/pokemon_type.dart';
import '../../dependency_injection_container.dart';
import '../shared_widgets/error_widget.dart' as ew;
import '../shared_widgets/loading_widget.dart';
import '../shared_widgets/no_results.dart';
import '../shared_widgets/rounded_button.dart';
import '../shared_widgets/sliver_refresh_indicator.dart';
import 'pokemon_tile.dart';
import 'search_app_bar.dart';
import 'view_models/pokemon_list_view_model.dart';

class PokemonListView extends StatefulWidget {
  PokemonListView({Key? key}) : super(key: key);

  @override
  State<PokemonListView> createState() => _PokemonListViewState();
}

class _PokemonListViewState extends State<PokemonListView> {
  final _pokemonViewModel = getIt.get<PokemonListViewModel>();
  final _textController = TextEditingController();
  final _duration = const Duration(milliseconds: 300);
  String previousSearch = '';

  @override
  void initState() {
    super.initState();
    _addTextListener();
    _addSearchListener();
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: _pokemonViewModel.showFloatingActionButton,
      builder: (context, showFloatingActionButtonSnapshot) {
        final showFloatingActionButton = showFloatingActionButtonSnapshot.data == true;
        return NotificationListener<ScrollNotification>(
          onNotification: _handleScrollNotification,
          child: Scaffold(
            body: NestedScrollView(
              headerSliverBuilder: (nestedScrollViewContext, innerBoxScrolled) {
                return [
                  StreamBuilder<String?>(
                    stream: _pokemonViewModel.searchText,
                    builder: (context, snapshot) {
                      return StreamBuilder<List<PokemonType>>(
                          stream: _pokemonViewModel.selectedFilters,
                          builder: (context, filtersSnapshot) {
                            final selectedFilters = filtersSnapshot.data ?? [];
                            return _buildHeaderBar(
                              nestedScrollViewContext,
                              selectedFilters,
                            );
                          });
                    },
                  ),
                ];
              },
              body: SliverRefreshIndicator(
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
                            child: LoadingWidget(),
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
              ),
            ),
            //TODO animate into bottom sheet
            floatingActionButton: AnimatedSlide(
              duration: _duration,
              offset: showFloatingActionButton ? Offset.zero : const Offset(0, 2),
              child: AnimatedOpacity(
                duration: _duration,
                opacity: showFloatingActionButton ? 1 : 0,
                child: _buildFilterFloatingActionButton(),
              ),
            ),
          ),
        );
      },
    );
  }

  bool _handleScrollNotification(
    ScrollNotification notification,
  ) {
    if (notification is UserScrollNotification) {
      switch (notification.direction) {
        case ScrollDirection.forward:
          if (notification.metrics.maxScrollExtent != notification.metrics.minScrollExtent) {
            _pokemonViewModel.showFloatingActionButton.add(true);
          }
          break;
        case ScrollDirection.reverse:
          if (notification.metrics.maxScrollExtent != notification.metrics.minScrollExtent) {
            _pokemonViewModel.showFloatingActionButton.add(false);
          }
          break;
        case ScrollDirection.idle:
          break;
      }
    }
    return true;
  }

  Widget _buildFilterFloatingActionButton() {
    return FloatingActionButton(
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      backgroundColor: Colors.red,
      heroTag: 'FilterButton',
      onPressed: null,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/pokeball_filter.png',
          ),
          Material(
            type: MaterialType.transparency,
            child: InkWell(
              splashColor: Colors.red.withOpacity(
                0.5,
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderBar(
    BuildContext nestedScrollViewContext,
    List<PokemonType> selectedFilters,
  ) {
    return SearchAppBar(
      nestedScrollViewContext: nestedScrollViewContext,
      searchTextController: _textController,
      filters: selectedFilters,
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Error getting new page...'),
        RoundedButton(
          label: 'Retry',
          onPressed: onTryAgain,
        ),
      ],
    );
  }

  Widget _loadingListItemWidget() {
    return const SizedBox(
      height: 36,
      child: Center(
        child: LoadingWidget(),
      ),
    );
  }

  Widget _emptyListIndicator() {
    return const NoResults();
  }

  Widget _buildPokemonTile({required Pokemon pokemon}) {
    return PokemonTile(
      pokemon: pokemon,
    );
  }
}
