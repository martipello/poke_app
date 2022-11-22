import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../api/models/api_response.dart';
import '../../../api/models/error_response.dart';
import '../../../api/models/pokemon/pokemon_move_holder.dart';
import '../../../api/models/pokemon/pokemon_response.dart';
import '../../../dependency_injection_container.dart';
import '../../../extensions/build_context_extension.dart';
import '../../../extensions/iterable_extension.dart';
import '../../../theme/poke_app_text.dart';
import '../../shared_widgets/error_widget.dart' as ew;
import '../../shared_widgets/poke_divider.dart';
import '../../shared_widgets/pokeball_loading_widget.dart';
import '../../shared_widgets/sliver_refresh_indicator.dart';
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

class _PokemonMovesViewState extends State<PokemonMovesView> {
  final _pokemonMovesViewModel = getIt.get<PokemonMovesViewModel>();

  @override
  void initState() {
    super.initState();
    _pokemonMovesViewModel.getPokemonMoves(
      widget.pokemonId,
    );
  }

  @override
  void dispose() {
    _pokemonMovesViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ApiResponse<PokemonResponse>>(
      stream: _pokemonMovesViewModel.pokemonMovesStream,
      builder: (context, snapshot) {
        return SliverRefreshIndicator(
          onRefresh: () {
            _pokemonMovesViewModel.getPokemonMoves(widget.pokemonId);
          },
          sliver: _buildLayoutForState(snapshot),
        );
      },
    );
  }

  Widget _buildLayoutForState(
    AsyncSnapshot<ApiResponse<PokemonResponse>> snapshot,
  ) {
    final _pokemonMoves = snapshot.data?.data?.pokemon_v2_pokemon.firstOrNull()?.pokemon_v2_pokemonmoves.toList() ?? [];
    final _hasError = snapshot.data?.status == Status.ERROR;
    final _isLoading = snapshot.data?.status == Status.LOADING;
    if (_isLoading) return _buildLoadingWidget();
    if (!_isLoading && _hasError) return _buildErrorWidget(snapshot.data?.error);
    return _buildPokemonMoves(_pokemonMoves);
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
        onTryAgain: () => _pokemonMovesViewModel.getPokemonMoves(
          widget.pokemonId,
        ),
      ),
    );
  }

  Widget _buildPokemonMoves(
    List<PokemonMoveHolder> moves,
  ) {
    return MultiSliver(
      children: [
        SliverToBoxAdapter(
          child: _buildTitle(context),
        ),
        _buildMoveList(moves),
        SliverToBoxAdapter(
          child: _buildDivider(),
        ),
      ],
    );
  }

  Widget _buildTitle(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Text(
        context.strings.moves,
        style: PokeAppText.subtitle3Style,
      ),
    );
  }

  Widget _buildMoveList(
    List<PokemonMoveHolder> moves,
  ) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: moves.length,
        (context, index) {
          final move = moves[index];
          return _buildMoveTile(move);
        },
      ),
    );
  }

  Widget _buildMoveTile(PokemonMoveHolder move) {
    return PokemonMoveTile(move: move);
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 8,
      ),
      child: PokeDivider(),
    );
  }
}
