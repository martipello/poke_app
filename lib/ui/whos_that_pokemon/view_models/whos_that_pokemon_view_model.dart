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

  final pokemonOptionsStream = BehaviorSubject<ApiResponse<PokemonResponse>>();
  final selectedPokemonStream = BehaviorSubject<Pokemon?>();
  final isRevealedStream = BehaviorSubject<bool>.seeded(false);

  SimpleAnimation? _controller;

  Future<void> generateRandomPokemon() async {
    pokemonOptionsStream.add(ApiResponse.loading(null));
    try {
      setIsRevealed(isRevealed: false);
      const limit = 30;
      const pokemonTotal = 1015 - limit;
      final offset = math.Random().nextInt(pokemonTotal);
      final language = await languageService.getLanguage();
      final response = await pokemonRepositoryGraphQl.getPokemon(
        PokemonRequest(
          (b) => b
            ..limit = limit
            ..skip = offset
            ..languageId = language.id
            ..pagination = false,
        ),
      );
      final pokemonResponse = PokemonResponse.fromJson(response.data!);
      print(pokemonResponse);
      final pokemon = pokemonResponse.pokemon_v2_pokemon.randomNonRepeating(3);
      print(pokemon);
      pokemonOptionsStream.add(
        ApiResponse.completed(
          pokemonResponse.rebuild(
                (p0) => p0..pokemon_v2_pokemon.replace(pokemon),
          ),
        ),
      );
      selectedPokemonStream.add(pokemon.randomNonRepeating(1).firstOrNull());
    } catch (e) {
      final errorResponse = errorHandler.handleError<PokemonResponse>(
        e,
      );
      pokemonOptionsStream.add(errorResponse);
    }
  }

  void setIsRevealed({required bool isRevealed}) {
    isRevealedStream.add(isRevealed);
  }

  void dispose() {
    _controller?.dispose();
    pokemonOptionsStream.close();
    selectedPokemonStream.close();
  }

  String get animationDirectory => 'assets/animations/whos_that_pokemon.riv';
}
