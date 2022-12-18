import 'package:flutter/material.dart';

import '../../../api/models/api_response.dart';
import '../../../api/models/error_response.dart';
import '../../../api/models/pokemon/evolution_chain_holder.dart';
import '../../../api/models/pokemon/evolution_holder.dart';
import '../../../dependency_injection_container.dart';
import '../../../extensions/evolution_extension.dart';
import '../../../extensions/iterable_extension.dart';
import '../shared_widgets/error_widget.dart' as ew;
import '../shared_widgets/no_results.dart';
import '../shared_widgets/pokeball_loading_widget.dart';
import '../shared_widgets/sliver_refresh_indicator.dart';
import '../shared_widgets/view_constraint.dart';
import 'pokemon_evolution_widget.dart';
import 'view_models/pokemon_evolution_view_model.dart';

class PokemonEvolutionView extends StatefulWidget {
  PokemonEvolutionView({
    Key? key,
    required this.pokemonId,
  }) : super(key: key);

  final int pokemonId;

  @override
  State<PokemonEvolutionView> createState() => _PokemonEvolutionViewState();
}

class _PokemonEvolutionViewState extends State<PokemonEvolutionView>
    with AutomaticKeepAliveClientMixin<PokemonEvolutionView> {
  final _pokemonEvolutionViewModel = getIt.get<PokemonEvolutionViewModel>();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _pokemonEvolutionViewModel.getPokemonEvolutions(
      widget.pokemonId,
    );
  }

  @override
  void dispose() {
    _pokemonEvolutionViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder<ApiResponse<EvolutionChainHolder>>(
      stream: _pokemonEvolutionViewModel.pokemonEvolutionStream,
      builder: (context, snapshot) {
        return ViewConstraint(
          child: SliverRefreshIndicator(
            onRefresh: () {
              _pokemonEvolutionViewModel.getPokemonEvolutions(
                widget.pokemonId,
              );
            },
            sliver: _buildLayoutForState(snapshot),
          ),
        );
      },
    );
  }

  Widget _buildLayoutForState(
    AsyncSnapshot<ApiResponse<EvolutionChainHolder>> snapshot,
  ) {
    final _evolutionHolder = snapshot.data?.data?.pokemon_v2_evolutionchain.firstOrNull();
    final evolutions = _evolutionHolder.getEvolutions();
    final _hasError = snapshot.data?.status == Status.ERROR || _evolutionHolder == null;
    final _isLoading = snapshot.data?.status == Status.LOADING;
    if (_isLoading) return _buildLoadingWidget();
    if (_hasError) return _buildErrorWidget(snapshot.data?.error);
    if (evolutions.isEmpty) return _buildNoResultsWidget();
    return _buildPokemonEvolutions(_evolutionHolder);
  }

  Widget _buildLoadingWidget() {
    return const SliverFillRemaining(
      child: Center(
        child: PokeballLoadingWidget(
          size: Size(80, 80),
        ),
      ),
    );
  }

  Widget _buildNoResultsWidget() {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: NoResults(),
      ),
    );
  }

  Widget _buildErrorWidget(ErrorResponse? error) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: ew.ErrorWidget(
        errorMessage: 'Something went wrong...',
        showImage: true,
        error: ApiResponse.error(
          error?.message ?? '',
          error: error,
        ),
        onTryAgain: () => _pokemonEvolutionViewModel.getPokemonEvolutions(
          widget.pokemonId,
        ),
      ),
    );
  }

  Widget _buildPokemonEvolutions(
    EvolutionHolder evolutionHolder,
  ) {
    return PokemonEvolutionWidget(
      evolutionHolder: evolutionHolder,
    );
  }
}
