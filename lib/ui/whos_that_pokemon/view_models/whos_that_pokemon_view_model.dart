import 'dart:math' as math;

import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:rxdart/rxdart.dart';
import 'package:soundpool/soundpool.dart';
import 'package:tuple/tuple.dart';

import '../../../api/error_handler.dart';
import '../../../api/graph_ql/pokemon_repository_graph_ql.dart';
import '../../../api/models/api_response.dart';
import '../../../api/models/pokemon/pokemon.dart';
import '../../../api/models/pokemon/pokemon_request.dart';
import '../../../api/models/pokemon/pokemon_response.dart';
import '../../../extensions/iterable_extension.dart';
import '../../../services/language_service.dart';

enum RevealResult {
  correct,
  incorrect,
  none,
}

class WhosThatPokemonViewModel {
  WhosThatPokemonViewModel(
    this.pokemonRepositoryGraphQl,
    this.errorHandler,
    this.languageService,
  ) {
    _initSoundpool();
  }

  final PokemonRepositoryGraphQl pokemonRepositoryGraphQl;
  final ErrorHandler errorHandler;
  final LanguageService languageService;

  SimpleAnimation get controller => SimpleAnimation(
        'Timeline 1',
        autoplay: true,
      );

  final pokemonOptionsStream = BehaviorSubject<ApiResponse<PokemonResponse>>();
  final concealedPokemonStream = BehaviorSubject<Pokemon?>();
  final revealResultStream = BehaviorSubject<Tuple2<RevealResult, bool>>();

  SimpleAnimation? _controller;
  Soundpool? _soundpool;
  int? _openingSoundId;
  int? _closingSoundId;
  final double _rate = 1.0;

  Future<void> generateRandomPokemon() async {
    pokemonOptionsStream.add(ApiResponse.loading(null));
    try {
      setRevealResult(0);
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
      final pokemon = pokemonResponse.pokemon_v2_pokemon.randomNonRepeating(3);
      if (_openingSoundId != null) {
        _playSound(_openingSoundId!);
      }
      pokemonOptionsStream.add(
        ApiResponse.completed(
          pokemonResponse.rebuild(
            (p0) => p0..pokemon_v2_pokemon.replace(pokemon),
          ),
        ),
      );
      concealedPokemonStream.add(pokemon.randomNonRepeating(1).firstOrNull());
    } catch (e) {
      final errorResponse = errorHandler.handleError<PokemonResponse>(
        e,
      );
      pokemonOptionsStream.add(errorResponse);
    }
  }

  void setRevealResult(int pokemonId) {
    final concealedPokemon = concealedPokemonStream.valueOrNull;
    if (pokemonId == 0) {
      revealResultStream.add(const Tuple2(RevealResult.none, false));
    } else {
      if (pokemonId == concealedPokemon?.id) {
        revealResultStream.add(const Tuple2(RevealResult.correct, true));
      } else {
        revealResultStream.add(const Tuple2(RevealResult.incorrect, true));
      }
      if (_closingSoundId != null) {
        _playSound(_closingSoundId!);
      }
    }
  }

  void _initSoundpool() {
    _soundpool?.dispose();
    _soundpool = Soundpool.fromOptions(
      options: const SoundpoolOptions(),
    );
    _loadSounds(_soundpool!);
  }

  Future<void> _loadSounds(Soundpool soundpool) async {
    _openingSoundId = await _loadOpeningSound(soundpool);
    _closingSoundId = await _loadClosingSound(soundpool);
  }

  Future<int> _loadOpeningSound(Soundpool soundpool) async {
    var asset = await rootBundle.load('assets/audio/whos_that_pokemon.mp3');
    return await soundpool.load(asset);
  }

  Future<int> _loadClosingSound(Soundpool soundpool) async {
    var asset = await rootBundle.load('assets/audio/whos_that_pokemon_closing.mp3');
    return await soundpool.load(asset);
  }

  Future<void> _playSound(int soundId) async {
    final soundpool = _soundpool;
    if (soundpool != null) {
      soundpool.play(
        soundId,
        rate: _rate,
      );
    }
  }

  void dispose() {
    _controller?.dispose();
    pokemonOptionsStream.close();
    concealedPokemonStream.close();
    _soundpool?.dispose();
  }

  String get animationDirectory => 'assets/animations/whos_that_pokemon.riv';
}
