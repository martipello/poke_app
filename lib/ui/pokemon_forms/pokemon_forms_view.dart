import 'package:flutter/material.dart';

import '../../../api/models/api_response.dart';
import '../../../api/models/error_response.dart';
import '../../../api/models/pokemon/pokemon.dart';
import '../../../api/models/pokemon/pokemon_response.dart';
import '../../../dependency_injection_container.dart';
import '../../../extensions/iterable_extension.dart';
import '../../../extensions/pokemon_extension.dart';
import '../shared_widgets/error_widget.dart' as ew;
import '../shared_widgets/no_results.dart';
import '../shared_widgets/pokeball_loading_widget.dart';
import '../shared_widgets/sliver_refresh_indicator.dart';
import '../shared_widgets/view_constraint.dart';
import 'pokemon_forms_widget.dart';
import 'view_models/pokemon_forms_view_model.dart';

class PokemonFormsView extends StatefulWidget {
  PokemonFormsView({
    Key? key,
    required this.pokemonId,
  }) : super(key: key);

  final int pokemonId;

  @override
  State<PokemonFormsView> createState() => _PokemonFormsViewState();
}

class _PokemonFormsViewState extends State<PokemonFormsView> with AutomaticKeepAliveClientMixin<PokemonFormsView> {
  final _pokemonFormsViewModel = getIt.get<PokemonFormsViewModel>();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _pokemonFormsViewModel.getPokemonForms(
      widget.pokemonId,
    );
  }

  @override
  void dispose() {
    _pokemonFormsViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder<ApiResponse<PokemonResponse>>(
      stream: _pokemonFormsViewModel.pokemonFormStream,
      builder: (context, snapshot) {
        return ViewConstraint(
          child: SliverRefreshIndicator(
            onRefresh: () {
              _pokemonFormsViewModel.getPokemonForms(
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
    AsyncSnapshot<ApiResponse<PokemonResponse>> snapshot,
  ) {
    final pokemon = snapshot.data?.data?.pokemon_v2_pokemon.firstOrNull();
    final _isLoading = snapshot.data?.status == Status.LOADING;
    final _hasError = snapshot.data?.status == Status.ERROR || pokemon == null;
    if (_isLoading) return _buildLoadingWidget();
    if (_hasError) return _buildErrorWidget(snapshot.data?.error);
    if (pokemon.getFormHolders().isEmpty) return _buildNoResultsWidget();
    return _buildPokemonForms(pokemon);
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
        onTryAgain: () => _pokemonFormsViewModel.getPokemonForms(
          widget.pokemonId,
        ),
      ),
    );
  }

  Widget _buildPokemonForms(
    Pokemon pokemon,
  ) {
    return PokemonFormsWidget(
      pokemon: pokemon,
    );
  }
}
