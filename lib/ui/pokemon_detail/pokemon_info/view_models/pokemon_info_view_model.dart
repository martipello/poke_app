import 'package:rxdart/rxdart.dart';

import '../../../../api/error_handler.dart';
import '../../../../api/graph_ql/pokemon_repository_graph_ql.dart';
import '../../../../api/models/api_response.dart';
import '../../../../api/models/pokemon/pokemon_request.dart';
import '../../../../api/models/pokemon/pokemon_response.dart';

class PokemonInfoViewModel {
  PokemonInfoViewModel(
    this.pokemonRepository,
    this.errorHandler,
  );

  final PokemonRepositoryGraphQl pokemonRepository;
  final ErrorHandler errorHandler;

  final pokemonInfoStream = BehaviorSubject<ApiResponse<PokemonResponse>>();

  void getPokemonInfo(int pokemonId) async {
    try {
      pokemonInfoStream.add(ApiResponse.loading(null));
      final pokemonInfoResponse = await pokemonRepository.getPokemonInfo(
        _buildPokemonRequest(pokemonId),
      );

      final pokemon = PokemonResponse.fromJson(pokemonInfoResponse.data!);

      pokemonInfoStream.add(
        ApiResponse.completed(pokemon),
      );

    } catch (error) {
      final errorResponse = errorHandler.handleError<PokemonResponse>(
        error,
      );
      pokemonInfoStream.add(errorResponse);
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
    pokemonInfoStream.close();
  }
}
