import 'dart:math' as math;

import 'package:rive/rive.dart';
import 'package:rxdart/rxdart.dart';

import '../../../api/error_handler.dart';
import '../../../api/graph_ql/pokemon_repository_graph_ql.dart';
import '../../../api/models/api_response.dart';
import '../../../api/models/pokemon/pokemon.dart';
import '../../../api/models/pokemon/pokemon_request.dart';
import '../../../api/models/pokemon/pokemon_response.dart';
import '../../../extensions/iterable_extension.dart';
import '../../../services/language_service.dart';

class WhosThatPokemonViewModel {
  WhosThatPokemonViewModel(
    this.pokemonRepositoryGraphQl,
    this.errorHandler,
    this.languageService,
  );

  final PokemonRepositoryGraphQl pokemonRepositoryGraphQl;
  final ErrorHandler errorHandler;
  final LanguageService languageService;

  SimpleAnimation get controller => SimpleAnimation(
        'Timeline 1',
        autoplay: true,
      );

  final randomPokemonStream = BehaviorSubject<ApiResponse<Pokemon?>>();
  final isRevealedStream = BehaviorSubject<bool>.seeded(false);

  SimpleAnimation? _controller;

  Future<void> generateRandomPokemon() async {
    randomPokemonStream.add(ApiResponse.loading(null));
    try {
      setIsRevealed(isRevealed: false);
      final random = math.Random().nextInt(1015);
      final language = await languageService.getLanguage();
      final response = await pokemonRepositoryGraphQl.getPokemon(
        PokemonRequest(
          (b) => b
            ..search = '$random'
            ..limit = 1
            ..skip = 0
            ..languageId = language.id
            ..pagination = false,
        ),
      );
      final pokemonResponse = PokemonResponse.fromJson(response.data!);
      final pokemon = pokemonResponse.pokemon_v2_pokemon.firstOrNull();
      randomPokemonStream.add(ApiResponse.completed(pokemon));
    } catch (e) {
      final errorResponse = errorHandler.handleError<Pokemon>(
        e,
      );
      randomPokemonStream.add(errorResponse);
    }
  }

  void setIsRevealed({required bool isRevealed}) {
    isRevealedStream.add(isRevealed);
  }

  void dispose() {
    _controller?.dispose();
    randomPokemonStream.close();
  }

  String get animationDirectory => 'assets/animations/whos_that_pokemon.riv';
}
