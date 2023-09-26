import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rxdart/rxdart.dart';

import '../../../api/models/api_response.dart';
import '../../../api/models/pokemon/pokemon_move_holder.dart';
import '../../../api/models/pokemon/pokemon_request.dart';
import '../../../dependency_injection_container.dart';
import '../../../extensions/build_context_extension.dart';
import '../../../theme/base_theme.dart';
import '../../../theme/poke_app_text.dart';
import '../../ads/native_ad.dart';
import '../../ads/view_models/google_ads_view_model.dart';
import '../pokemon_list/view_models/filter_view_model.dart';
import '../shared_widgets/error_widget.dart' as ew;
import '../shared_widgets/no_results.dart';
import '../shared_widgets/pokeball_loading_widget.dart';
import '../shared_widgets/rounded_button.dart';
import '../shared_widgets/sliver_refresh_indicator.dart';
import '../shared_widgets/view_constraint.dart';
import 'pokemon_move_tile.dart';
import 'search_widget.dart';
import 'view_models/pokemon_moves_view_model.dart';

class PokemonMovesView extends StatefulWidget {
  const PokemonMovesView({
    Key? key,
    required this.pokemonId,
    required this.filterViewModel,
  }) : super(key: key);

  final int pokemonId;
  final FilterViewModel filterViewModel;

  @override
  State<PokemonMovesView> createState() => _PokemonMovesViewState();
}

class _PokemonMovesViewState extends State<PokemonMovesView> with AutomaticKeepAliveClientMixin<PokemonMovesView> {
  final _pokemonMovesViewModel = getIt.get<PokemonMovesViewModel>();
  final _googleAdsViewModel = getIt.get<GoogleAdsViewModel>();
  final scrollController = ScrollController();
  final _searchTextController = TextEditingController();
  String previousSearch = '';

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _pokemonMovesViewModel.updateQuery(
      PokemonRequest(
        (b) => b..pokemonId = widget.pokemonId,
      ),
    );
    _addSearchTextListener();
    _addSearchListener();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _addSelectedFilterListener();
        _addSelectedDamageTypeFilterListener();
      },
    );
  }

  void _addSelectedFilterListener() {
    const duration = Duration(milliseconds: 200);
    widget.filterViewModel.selectedFiltersStream.listen(
      (selectedTypes) {
        Future.delayed(duration).then(
          (value) {
            _pokemonMovesViewModel.setSelectedTypes(selectedTypes);
            if (widget.filterViewModel.scrollController.hasClients) {
              widget.filterViewModel.scrollController.animateTo(
                widget.filterViewModel.scrollController.position.maxScrollExtent,
                duration: duration,
                curve: Curves.fastOutSlowIn,
              );
            }
          },
        );
      },
    );
  }

  void _addSelectedDamageTypeFilterListener() {
    const duration = Duration(milliseconds: 200);
    widget.filterViewModel.selectedFiltersStream.listen(
      (selectedDamageTypes) {
        Future.delayed(duration).then(
          (value) {
            _pokemonMovesViewModel.setSelectedDamageTypes(selectedDamageTypes);
            if (widget.filterViewModel.scrollController.hasClients) {
              widget.filterViewModel.scrollController.animateTo(
                widget.filterViewModel.scrollController.position.maxScrollExtent,
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
    _pokemonMovesViewModel.searchText
        .debounce(
          (_) => TimerStream(
            true,
            const Duration(milliseconds: 700),
          ),
        )
        .listen(
          _pokemonMovesViewModel.setSearch,
        );
  }

  void _addSearchTextListener() {
    _searchTextController.addListener(
      () {
        if (_searchTextController.text != previousSearch) {
          previousSearch = _searchTextController.text;
          _pokemonMovesViewModel.searchText.add(_searchTextController.text);
        }
      },
    );
  }

  @override
  void dispose() {
    _pokemonMovesViewModel.dispose();
    _searchTextController.dispose();
    scrollController.dispose();
    _googleAdsViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _buildPokemonList();
  }

  Widget _buildPokemonList() {
    return Stack(
      children: [
        ViewConstraint(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildSearchAndSelectedFilterHolder(
                true,
              ),
              Expanded(
                child: SliverRefreshIndicator(
                  onRefresh: () async {
                    _pokemonMovesViewModel.refresh();
                  },
                  scrollController: scrollController,
                  padding: EdgeInsets.zero,
                  sliver: SliverPadding(
                    padding: const EdgeInsets.all(8),
                    sliver: PagedSliverList.separated(
                      pagingController: _pokemonMovesViewModel.getPagingController(),
                      builderDelegate: PagedChildBuilderDelegate<PokemonMoveHolder>(
                        itemBuilder: (context, moveHolder, index) => _buildMoveTile(
                          moveHolder,
                          showAd: _googleAdsViewModel.showAdAtIndex(index) && index != 0,
                        ),
                        firstPageErrorIndicatorBuilder: (context) => _buildErrorWidget(),
                        noItemsFoundIndicatorBuilder: (context) => _emptyListIndicator(),
                        newPageErrorIndicatorBuilder: (context) =>
                            _errorListItemWidget(onTryAgain: _pokemonMovesViewModel.retryLastRequest),
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
                ),
              ),
            ],
          ),
        ),
        _buildSearchAndSelectedFilterHolder(
          false,
        ),
      ],
    );
  }

  Widget _buildSearchAndSelectedFilterHolder(
    //We cant measure this and pass the size so instead we build a "dummy" to maintain the space above the list
    bool isDummy,
  ) {
    return Theme(
      data: ThemeData(
        cardColor: colors(context).cardBackground,
      ),
      child: Card(
        color: colors(context).cardBackground,
        shape: const ContinuousRectangleBorder(),
        margin: EdgeInsets.zero,
        elevation: isDummy ? 0 : 4,
        child: SearchWidget(
          searchTextController: _searchTextController,
          filterViewModel: widget.filterViewModel,
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    final error = _pokemonMovesViewModel.getPagingController().error as ApiResponse;
    return ew.ErrorWidget(
      showImage: true,
      error: error,
      onTryAgain: () => _pokemonMovesViewModel.getPagingController().refresh(),
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

  Widget _buildMoveTile(
    PokemonMoveHolder move, {
    bool showAd = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showAd) NativeAd(),
        PokemonMoveTile(
          pokemonMove: move,
        ),
      ],
    );
  }
}
