import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../api/models/api_response.dart';
import '../../../api/models/error_response.dart';
import '../../../api/models/pokemon/pokemon.dart';
import '../../../api/models/pokemon/pokemon_response.dart';
import '../../../dependency_injection_container.dart';
import '../../../extensions/iterable_extension.dart';
import '../../shared_widgets/error_widget.dart' as ew;
import '../../shared_widgets/pokeball_loading_widget.dart';
import '../../shared_widgets/sliver_refresh_indicator.dart';
import 'pokemon_stats_widget.dart';
import 'pokemon_weakness_resistance_widget.dart';
import 'view_models/pokemon_stats_weakness_resistance_view_model.dart';

class PokemonStatsView extends StatefulWidget {
  PokemonStatsView({
    Key? key,
    required this.pokemonId,
  }) : super(key: key);

  final int pokemonId;

  @override
  State<PokemonStatsView> createState() => _PokemonStatsViewState();
}

class _PokemonStatsViewState extends State<PokemonStatsView> with AutomaticKeepAliveClientMixin<PokemonStatsView> {
  final _pokemonInfoViewModel = getIt.get<PokemonStatsWeaknessResistanceViewModel>();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _pokemonInfoViewModel.getPokemonStats(
      widget.pokemonId,
    );
  }

  @override
  void dispose() {
    _pokemonInfoViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder<ApiResponse<PokemonResponse>>(
      stream: _pokemonInfoViewModel.pokemonStatsWeaknessAndResistanceStream,
      builder: (context, snapshot) {
        return SliverRefreshIndicator(
          onRefresh: () {
            _pokemonInfoViewModel.getPokemonStats(widget.pokemonId);
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
    return _buildPokemonInfo(_pokemonInfo);
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
        onTryAgain: () => _pokemonInfoViewModel.getPokemonStats(
          widget.pokemonId,
        ),
      ),
    );
  }

  Widget _buildPokemonInfo(Pokemon _pokemon) {
    return MultiSliver(
      children: [
        _buildPokedexStats(
          _pokemon,
        ),
        _buildPokemonWeaknessResistance(
          _pokemon,
        ),
      ],
    );
  }

  Widget _buildPokedexStats(Pokemon _pokemon) {
    return SliverToBoxAdapter(
      child: PokemonStatsWidget(
        pokemon: _pokemon,
      ),
    );
  }

  Widget _buildPokemonWeaknessResistance(Pokemon _pokemon) {
    return SliverToBoxAdapter(
      child: PokemonWeaknessResistanceWidget(
        pokemon: _pokemon,
      ),
    );
  }
}
