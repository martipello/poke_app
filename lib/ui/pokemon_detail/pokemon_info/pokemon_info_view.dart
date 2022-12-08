import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../api/models/api_response.dart';
import '../../../api/models/error_response.dart';
import '../../../api/models/pokemon/pokemon.dart';
import '../../../api/models/pokemon/pokemon_response.dart';
import '../../../dependency_injection_container.dart';
import '../../../extensions/build_context_extension.dart';
import '../../../extensions/iterable_extension.dart';
import '../../shared_widgets/error_widget.dart' as ew;
import '../../shared_widgets/pokeball_loading_widget.dart';
import '../../shared_widgets/sliver_refresh_indicator.dart';
import 'pokedex_info_widget.dart';
import 'pokemon_ability_widget.dart';
import 'pokemon_forms_widget.dart';
import 'pokemon_species_widget.dart';
import 'view_models/pokemon_info_view_model.dart';

//TODO this handles many widgets but needs to know if all are empty,
//TODO add a callback for each child to call if there layout is empty.
//TODO if all callbacks have been called show empty layout
class PokemonInfoView extends StatefulWidget {
  PokemonInfoView({
    Key? key,
    required this.pokemonId,
  }) : super(key: key);

  final int pokemonId;

  @override
  State<PokemonInfoView> createState() => _PokemonInfoViewState();
}

class _PokemonInfoViewState extends State<PokemonInfoView> with AutomaticKeepAliveClientMixin<PokemonInfoView> {
  final _pokemonInfoViewModel = getIt.get<PokemonInfoViewModel>();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _pokemonInfoViewModel.getPokemonInfo(
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
      stream: _pokemonInfoViewModel.pokemonInfoStream,
      builder: (context, snapshot) {
        return SliverRefreshIndicator(
          onRefresh: () {
            _pokemonInfoViewModel.getPokemonInfo(widget.pokemonId);
          },
          sliver: _buildLayoutForState(snapshot),
        );
      },
    );
  }

  Widget _buildLayoutForState(
    AsyncSnapshot<ApiResponse<PokemonResponse>> snapshot,
  ) {
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
        errorMessage: context.strings.errorMessage,
        showImage: true,
        error: ApiResponse.error(
          error?.message ?? '',
          error: error,
        ),
        onTryAgain: () => _pokemonInfoViewModel.getPokemonInfo(
          widget.pokemonId,
        ),
      ),
    );
  }

  Widget _buildPokemonInfo(Pokemon _pokemonInfo) {
    return MultiSliver(
      children: [
        _buildPokedexInfo(_pokemonInfo),
        _buildPokemonSpecies(_pokemonInfo),
        _buildPokemonAbilities(_pokemonInfo),
        _buildPokemonForms(_pokemonInfo),
      ],
    );
  }

  Widget _buildPokedexInfo(Pokemon _pokemon) {
    return SliverToBoxAdapter(
      child: PokedexInfoWidget(
        pokemon: _pokemon,
      ),
    );
  }

  Widget _buildPokemonSpecies(Pokemon _pokemon) {
    return SliverToBoxAdapter(
      child: PokemonSpeciesWidget(
        pokemon: _pokemon,
      ),
    );
  }

  Widget _buildPokemonAbilities(Pokemon _pokemon) {
    return PokemonAbilityWidget(
      pokemon: _pokemon,
    );
  }

  Widget _buildPokemonForms(Pokemon _pokemon) {
    return PokemonFormsWidget(
      pokemon: _pokemon,
    );
  }
}
