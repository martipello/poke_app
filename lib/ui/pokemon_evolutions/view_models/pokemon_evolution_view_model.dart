import 'package:rxdart/rxdart.dart';

import '../../../../api/error_handler.dart';
import '../../../../api/graph_ql/pokemon_repository_graph_ql.dart';
import '../../../../api/models/api_response.dart';
import '../../../../api/models/pokemon/evolution_chain_holder.dart';
import '../../../../api/models/pokemon/pokemon_request.dart';
import '../../../../services/language_service.dart';

class PokemonEvolutionViewModel {
  PokemonEvolutionViewModel(
    this.pokemonRepository,
    this.errorHandler,
    this.languageService,
  );

  final PokemonRepositoryGraphQl pokemonRepository;
  final LanguageService languageService;
  final ErrorHandler errorHandler;

  final pokemonEvolutionStream = BehaviorSubject<ApiResponse<EvolutionChainHolder>>();

  void getPokemonEvolutions(int pokemonId) async {
    try {
      pokemonEvolutionStream.add(ApiResponse.loading(null));
      final language = await languageService.getLanguage();
      final pokemonEvolutionResponse = await pokemonRepository.getPokemonEvolutions(
        _buildPokemonRequest(pokemonId, language.id),
      );

      final evolutionResponse = EvolutionChainHolder.fromJson(
        pokemonEvolutionResponse.data!,
      );

      pokemonEvolutionStream.add(
        ApiResponse.completed(evolutionResponse),
      );
    } catch (error) {
      final errorResponse = errorHandler.handleError<EvolutionChainHolder>(
        error,
      );
      pokemonEvolutionStream.add(errorResponse);
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
    pokemonEvolutionStream.close();
  }
}
