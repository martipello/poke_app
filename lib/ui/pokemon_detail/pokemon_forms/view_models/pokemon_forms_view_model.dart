import 'package:rxdart/rxdart.dart';

import '../../../../api/error_handler.dart';
import '../../../../api/graph_ql/pokemon_repository_graph_ql.dart';
import '../../../../api/models/api_response.dart';
import '../../../../api/models/pokemon/pokemon_request.dart';
import '../../../../api/models/pokemon/pokemon_response.dart';
import '../../../../services/language_service.dart';

class PokemonFormsViewModel {
  PokemonFormsViewModel(
    this.pokemonRepository,
    this.errorHandler,
    this.languageService,
  );

  final PokemonRepositoryGraphQl pokemonRepository;
  final LanguageService languageService;
  final ErrorHandler errorHandler;

  final pokemonFormStream = BehaviorSubject<ApiResponse<PokemonResponse>>();

  void getPokemonForms(int pokemonId) async {
    try {
      pokemonFormStream.add(ApiResponse.loading(null));
      final language = await languageService.getLanguage();
      final _pokemonResponse = await pokemonRepository.getPokemonForms(
        _buildPokemonRequest(pokemonId, language.id),
      );

      final pokemonResponse = PokemonResponse.fromJson(
        _pokemonResponse.data!,
      );

      pokemonFormStream.add(
        ApiResponse.completed(pokemonResponse),
      );
    } catch (error) {
      final errorResponse = errorHandler.handleError<PokemonResponse>(
        error,
      );
      pokemonFormStream.add(errorResponse);
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
    pokemonFormStream.close();
  }
}
