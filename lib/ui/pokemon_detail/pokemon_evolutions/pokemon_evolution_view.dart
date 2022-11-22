import 'package:flutter/material.dart';

import '../../../api/models/api_response.dart';
import '../../../api/models/error_response.dart';
import '../../../api/models/pokemon/pokemon.dart';
import '../../../api/models/pokemon/pokemon_response.dart';
import '../../../dependency_injection_container.dart';
import '../../../extensions/iterable_extension.dart';
import '../../shared_widgets/error_widget.dart' as ew;
import '../../shared_widgets/pokeball_loading_widget.dart';
import '../../shared_widgets/sliver_refresh_indicator.dart';
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
    return StreamBuilder<ApiResponse<PokemonResponse>>(
      stream: _pokemonEvolutionViewModel.pokemonEvolutionStream,
      builder: (context, snapshot) {
        return SliverRefreshIndicator(
          onRefresh: () {
            _pokemonEvolutionViewModel.getPokemonEvolutions(widget.pokemonId);
          },
          sliver: _buildLayoutForState(snapshot),
        );
      },
    );
  }

  Widget _buildLayoutForState(
    AsyncSnapshot<ApiResponse<PokemonResponse>> snapshot,
  ) {
    //TODO this could inadvertently show error state
    final _pokemonInfo = snapshot.data?.data?.pokemon_v2_pokemon.firstOrNull();
    final _hasError = snapshot.data?.status == Status.ERROR || _pokemonInfo == null;
    final _isLoading = snapshot.data?.status == Status.LOADING;
    if (_isLoading) return _buildLoadingWidget();
    if (_hasError) return _buildErrorWidget(snapshot.data?.error);
    return _buildPokemonEvolutions(_pokemonInfo);
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

  Widget _buildPokemonEvolutions(Pokemon _pokemon) {
    return PokemonEvolutionWidget(
      pokemon: _pokemon,
    );
  }
}
