import 'package:rxdart/rxdart.dart';

import '../../../../api/error_handler.dart';
import '../../../../api/graph_ql/pokemon_repository_graph_ql.dart';
import '../../../../api/models/api_response.dart';
import '../../../../api/models/pokemon/pokemon_request.dart';
import '../../../../api/models/pokemon/pokemon_response.dart';
import '../../../../services/language_service.dart';

class PokemonInfoViewModel {
  PokemonInfoViewModel(
    this.pokemonRepository,
    this.errorHandler,
    this.languageService,
  );

  final PokemonRepositoryGraphQl pokemonRepository;
  final LanguageService languageService;
  final ErrorHandler errorHandler;

  final pokemonInfoStream = BehaviorSubject<ApiResponse<PokemonResponse>>();

  void getPokemonInfo(int pokemonId) async {
    try {
      pokemonInfoStream.add(ApiResponse.loading(null));
      final language = await languageService.getLanguage();
      final pokemonInfoResponse = await pokemonRepository.getPokemonInfo(
        _buildPokemonRequest(pokemonId, language.id),
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

  PokemonRequest _buildPokemonRequest(
      int pokemonId,
      int languageId,
      ) {
    return PokemonRequest(
          (b) => b
        ..languageId = languageId
        ..pokemonId = pokemonId,
    );
  }

  void dispose() {
    pokemonInfoStream.close();
  }
}
