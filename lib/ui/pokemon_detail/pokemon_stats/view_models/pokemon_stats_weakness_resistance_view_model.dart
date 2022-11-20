import 'package:rxdart/rxdart.dart';

import '../../../../api/error_handler.dart';
import '../../../../api/graph_ql/pokemon_repository_graph_ql.dart';
import '../../../../api/models/api_response.dart';
import '../../../../api/models/pokemon/pokemon_request.dart';
import '../../../../api/models/pokemon/pokemon_response.dart';

class PokemonStatsWeaknessResistanceViewModel {
  PokemonStatsWeaknessResistanceViewModel(
    this.pokemonRepository,
    this.errorHandler,
  );

  final PokemonRepositoryGraphQl pokemonRepository;
  final ErrorHandler errorHandler;

  final pokemonStatsWeaknessAndResistanceStream = BehaviorSubject<ApiResponse<PokemonResponse>>();

  void getPokemonStats(int pokemonId) async {
    try {
      pokemonStatsWeaknessAndResistanceStream.add(ApiResponse.loading(null));
      final pokemonInfoResponse = await pokemonRepository.getPokemonStatsWeaknessAndResistance(
        _buildPokemonRequest(pokemonId),
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

  PokemonRequest _buildPokemonRequest(int pokemonId) {
    return PokemonRequest(
        (b) => b
          ..languageId = 9
          ..pokemonId = pokemonId,
      );
  }

  void dispose(){
    pokemonStatsWeaknessAndResistanceStream.close();
  }
}
