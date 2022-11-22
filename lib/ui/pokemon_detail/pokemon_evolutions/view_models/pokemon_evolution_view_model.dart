import 'package:rxdart/rxdart.dart';

import '../../../../api/error_handler.dart';
import '../../../../api/graph_ql/pokemon_repository_graph_ql.dart';
import '../../../../api/models/api_response.dart';
import '../../../../api/models/pokemon/pokemon_request.dart';
import '../../../../api/models/pokemon/pokemon_response.dart';

class PokemonEvolutionViewModel {
  PokemonEvolutionViewModel(
    this.pokemonRepository,
    this.errorHandler,
  );

  final PokemonRepositoryGraphQl pokemonRepository;
  final ErrorHandler errorHandler;

  final pokemonEvolutionStream = BehaviorSubject<ApiResponse<PokemonResponse>>();

  void getPokemonEvolutions(int pokemonId) async {
    try {
      pokemonEvolutionStream.add(ApiResponse.loading(null));
      final pokemonInfoResponse = await pokemonRepository.getPokemonEvolutions(
        _buildPokemonRequest(pokemonId),
      );

      final pokemon = PokemonResponse.fromJson(pokemonInfoResponse.data!);

      pokemonEvolutionStream.add(
        ApiResponse.completed(pokemon),
      );

    } catch (error) {
      final errorResponse = errorHandler.handleError<PokemonResponse>(
        error,
      );
      pokemonEvolutionStream.add(errorResponse);
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
    pokemonEvolutionStream.close();
  }
}
