import 'package:rxdart/rxdart.dart';

import '../../../../api/error_handler.dart';
import '../../../../api/graph_ql/pokemon_repository_graph_ql.dart';
import '../../../../api/models/api_response.dart';
import '../../../../api/models/pokemon/pokemon_request.dart';
import '../../../../api/models/pokemon/pokemon_response.dart';

class PokemonMovesViewModel {
  PokemonMovesViewModel(
    this.pokemonRepository,
    this.errorHandler,
  );

  final PokemonRepositoryGraphQl pokemonRepository;
  final ErrorHandler errorHandler;

  final pokemonMovesStream = BehaviorSubject<ApiResponse<PokemonResponse>>();

  void getPokemonMoves(int pokemonId) async {
    try {
      pokemonMovesStream.add(ApiResponse.loading(null));
      final pokemonInfoResponse = await pokemonRepository.getPokemonMoves(
        _buildPokemonRequest(pokemonId),
      );

      final pokemon = PokemonResponse.fromJson(pokemonInfoResponse.data!);

      pokemonMovesStream.add(
        ApiResponse.completed(pokemon),
      );

    } catch (error) {
      final errorResponse = errorHandler.handleError<PokemonResponse>(
        error,
      );
      pokemonMovesStream.add(errorResponse);
    }
  }

  PokemonRequest _buildPokemonRequest(int pokemonId) {
    return PokemonRequest(
        (b) => b
          ..languageId = 9
          ..pokemonId = pokemonId,
      );
  }

  void dispose(){
    pokemonMovesStream.close();
  }
}
