import 'package:rxdart/rxdart.dart';

import '../../../../api/error_handler.dart';
import '../../../../api/graph_ql/pokemon_repository_graph_ql.dart';
import '../../../../api/models/api_response.dart';
import '../../../../api/models/pokemon/pokemon_request.dart';
import '../../../../api/models/pokemon/pokemon_response.dart';
import '../../../../services/language_service.dart';

class PokemonStatsWeaknessResistanceViewModel {
  PokemonStatsWeaknessResistanceViewModel(
    this.pokemonRepository,
    this.errorHandler,
    this.languageService,
  );

  final PokemonRepositoryGraphQl pokemonRepository;
  final LanguageService languageService;
  final ErrorHandler errorHandler;

  final pokemonStatsWeaknessAndResistanceStream = BehaviorSubject<ApiResponse<PokemonResponse>>();
  final pokemonStatsDelay = BehaviorSubject<int>();

  void getPokemonStats(int pokemonId) async {
    try {
      pokemonStatsWeaknessAndResistanceStream.add(ApiResponse.loading(null));
      final language = await languageService.getLanguage();
      final pokemonInfoResponse = await pokemonRepository.getPokemonStatsWeaknessAndResistance(
        _buildPokemonRequest(pokemonId, language.id),
      );

      final pokemon = PokemonResponse.fromJson(pokemonInfoResponse.data!);

      pokemonStatsWeaknessAndResistanceStream.add(
        ApiResponse.completed(pokemon),
      );
    } catch (error) {
      final errorResponse = errorHandler.handleError<PokemonResponse>(
        error,
      );
      pokemonStatsWeaknessAndResistanceStream.add(errorResponse);
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

  void setDelay(int delay){
    pokemonStatsDelay.add(delay);
  }

  void dispose() {
    pokemonStatsWeaknessAndResistanceStream.close();
  }
}
