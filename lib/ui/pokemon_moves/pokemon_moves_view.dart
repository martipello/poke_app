import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../api/models/api_response.dart';
import '../../../api/models/pokemon/pokemon_move_holder.dart';
import '../../../api/models/pokemon/pokemon_request.dart';
import '../../../dependency_injection_container.dart';
import '../../../extensions/build_context_extension.dart';
import '../../../theme/base_theme.dart';
import '../../../theme/poke_app_text.dart';
import '../shared_widgets/error_widget.dart' as ew;
import '../shared_widgets/no_results.dart';
import '../shared_widgets/pokeball_loading_widget.dart';
import '../shared_widgets/rounded_button.dart';
import '../shared_widgets/sliver_refresh_indicator.dart';
import 'pokemon_move_tile.dart';
import 'view_models/pokemon_moves_view_model.dart';

class PokemonMovesView extends StatefulWidget {
  const PokemonMovesView({
    Key? key,
    required this.pokemonId,
  }) : super(key: key);

  final int pokemonId;

  @override
  State<PokemonMovesView> createState() => _PokemonMovesViewState();
}

class _PokemonMovesViewState extends State<PokemonMovesView> with AutomaticKeepAliveClientMixin<PokemonMovesView> {
  final _pokemonMovesViewModel = getIt.get<PokemonMovesViewModel>();
  final scrollController = ScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _pokemonMovesViewModel.updateQuery(
      PokemonRequest(
        (b) => b
          ..pokemonId = widget.pokemonId,
      ),
    );
  }

  @override
  void dispose() {
    _pokemonMovesViewModel.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _buildPokemonList();
  }

  Widget _buildPokemonList() {
    return SliverRefreshIndicator(
      onRefresh: () async {
        _pokemonMovesViewModel.refresh();
      },
      scrollController: scrollController,
      padding: EdgeInsets.zero,
      sliver: MultiSliver(
        children: [
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: PagedSliverList.separated(
              pagingController: _pokemonMovesViewModel.getPagingController(),
              builderDelegate: PagedChildBuilderDelegate<PokemonMoveHolder>(
                itemBuilder: (context, moveHolder, index) => _buildMoveTile(
                  moveHolder,
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
        ],
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
    PokemonMoveHolder move,
  ) {
    return PokemonMoveTile(
      pokemonMove: move,
    );
  }
}
