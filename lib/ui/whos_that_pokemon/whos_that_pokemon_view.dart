import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:rive/rive.dart';
import 'package:tuple/tuple.dart';

import '../../api/models/api_response.dart';
import '../../api/models/pokemon/pokemon.dart';
import '../../api/models/pokemon/pokemon_response.dart';
import '../../dependency_injection_container.dart';
import '../../extensions/build_context_extension.dart';
import '../../extensions/string_extension.dart';
import '../../theme/base_theme.dart';
import '../../theme/poke_app_text.dart';
import '../pokemon_list/pokemon_tile.dart';
import '../shared_widgets/pokeball_loading_widget.dart';
import '../shared_widgets/pokemon_image.dart';
import '../shared_widgets/rounded_button.dart';
import '../shared_widgets/three_d_text.dart';
import 'red_shimmer_background.dart';
import 'score_widget.dart';
import 'view_models/score_view_model.dart';
import 'view_models/whos_that_pokemon_view_model.dart';

class WhosThatPokemonView extends StatefulWidget {
  WhosThatPokemonView({Key? key}) : super(key: key);

  @override
  State<WhosThatPokemonView> createState() => _WhosThatPokemonViewState();
}

class _WhosThatPokemonViewState extends State<WhosThatPokemonView> {
  final whosThatPokemonViewModel = getIt.get<WhosThatPokemonViewModel>();
  final scoreViewModel = getIt.get<ScoreViewModel>();

  @override
  void initState() {
    super.initState();
    whosThatPokemonViewModel.generateRandomPokemon();
    whosThatPokemonViewModel.revealResultStream.listen(
      (value) {
        if (value.item1 == RevealResult.correct) {
          scoreViewModel.addWin();
        } else if (value.item2 == RevealResult.incorrect) {
          scoreViewModel.addLoss();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.red,
      ),
      child: Scaffold(
        body: _buildWhosThatPokemonViewBody(),
      ),
    );
  }

  Widget _buildWhosThatPokemonViewBody() {
    return StreamBuilder<Tuple2<RevealResult, bool>>(
      stream: whosThatPokemonViewModel.revealResultStream,
      builder: (context, isRevealedSnapshot) {
        final revealResult = isRevealedSnapshot.data?.item1 ?? RevealResult.none;
        final isRevealed = isRevealedSnapshot.data?.item2 == true;
        return SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              _buildRedSimmerBackground(),
              _buildWhosThatPokemonState(
                revealResult,
                isRevealed,
              ),
              Positioned(
                right: 0,
                top: 32,
                child: ScoreWidget(
                  scoreViewModel: scoreViewModel,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildWhosThatPokemonState(
    RevealResult revealResult,
    bool isRevealed,
  ) {
    return StreamBuilder<ApiResponse<PokemonResponse>>(
      stream: whosThatPokemonViewModel.pokemonOptionsStream,
      builder: (context, pokemonOptionsSnapshot) {
        return StreamBuilder<Pokemon?>(
          stream: whosThatPokemonViewModel.concealedPokemonStream,
          builder: (context, snapshot) {
            final pokemonOptions = pokemonOptionsSnapshot.data?.data?.pokemon_v2_pokemon ?? BuiltList<Pokemon>.of([]);
            final selectedPokemon = snapshot.data;
            if (pokemonOptionsSnapshot.data?.status == Status.LOADING) {
              return const PokeballLoadingWidget();
            }
            return _buildWhosThatPokemonScrollView(
              pokemonOptions,
              selectedPokemon,
              revealResult,
              isRevealed,
            );
          },
        );
      },
    );
  }

  Widget _buildWhosThatPokemonScrollView(
    BuiltList<Pokemon> pokemonOptions,
    Pokemon? selectedPokemon,
    RevealResult revealResult,
    bool isRevealed,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 32,
          ),
          _buildWhosThatPokemonImageWithBackground(
            selectedPokemon,
            isRevealed,
          ),
          _buildWhosThatPokemonText(
            selectedPokemon?.name,
            revealResult,
            isRevealed,
          ),
          const SizedBox(
            height: 16,
          ),
          if (isRevealed) _buildRetryButton(),
          _buildWhosThatPokemonOptions(
            pokemonOptions,
            selectedPokemon,
            isRevealed,
          ),
        ],
      ),
    );
  }

  Widget _buildRetryButton() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 32.0,
        left: 4,
        right: 4,
      ),
      child: RoundedButton(
        label: 'Retry',
        onPressed: whosThatPokemonViewModel.generateRandomPokemon,
      ),
    );
  }

  Widget _buildWhosThatPokemonImageWithBackground(
    Pokemon? pokemon,
    bool isRevealed,
  ) {
    return SizedBox(
      height: context.shortestSide,
      width: context.shortestSide,
      child: Stack(
        children: [
          _buildWhosThatPokemonImageBackground(),
          Center(
            child: _buildPokemonImage(
              pokemon,
              isRevealed ? null : Colors.blue[900],
            ),
          ),
          if (!isRevealed)
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  bottom: 8.0,
                ),
                child: _buildPokemonImage(
                  pokemon,
                  Colors.blue.shade700,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildWhosThatPokemonText(
    String? pokemonName,
    RevealResult revealResult,
    bool isRevealed,
  ) {
    final _pokemonName = pokemonName ?? context.strings.unknownPokemon;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (revealResult == RevealResult.correct)
          _buildThreeDText(
            'Correct',
          ),
        if (revealResult == RevealResult.incorrect)
          _buildThreeDText(
            'Incorrect',
          ),
        _buildThreeDText(
          isRevealed ? 'It\'s ${_pokemonName.capitalize()}' : context.strings.whoDatPokemon,
        ),
      ],
    );
  }

  Widget _buildThreeDText(String text) {
    return ThreeDText(
      text: text,
      textAlign: TextAlign.center,
      strokeColor: Colors.blue.shade700,
      style: PokeAppText.pokeFontTitle1.copyWith(
        color: Colors.yellow,
      ),
      backgroundStyle: PokeAppText.pokeFontTitle1.copyWith(
        color: Colors.blue.shade900,
      ),
    );
  }

  Widget _buildWhosThatPokemonOptions(
    BuiltList<Pokemon> pokemonOptions,
    Pokemon? selectedPokemon,
    bool isRevealed,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: pokemonOptions
          .map(
            (pokemon) => _buildPokemonOption(
              selectedPokemon,
              pokemon,
              isRevealed,
            ),
          )
          .toList(),
    );
  }

  Widget _buildPokemonOption(
    Pokemon? concealedPokemon,
    Pokemon pokemon,
    bool isRevealed,
  ) {
    final isConcealedPokemon = concealedPokemon?.id == pokemon.id;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: _buildPokemonOptionTile(
        pokemon,
        isConcealedPokemon,
        isRevealed,
      ),
    );
  }

  Widget _buildPokemonOptionTile(
    Pokemon pokemon,
    bool isConcealedPokemon,
    bool isRevealed,
  ) {
    final borderColor = isRevealed && isConcealedPokemon ? Colors.green.shade300 : Colors.red.shade700;
    return PokemonTile(
      pokemon: pokemon,
      maskColor: isRevealed ? null : Colors.blue.shade700,
      showImage: isRevealed,
      borderColor: isRevealed ? borderColor : null,
      showTypes: false,
      onTap: isRevealed
          ? null
          : () {
              whosThatPokemonViewModel.setRevealResult(
                pokemon.id!,
                isRevealed: true,
              );
            },
    );
  }

  RiveAnimation _buildWhosThatPokemonImageBackground() {
    return RiveAnimation.asset(
      whosThatPokemonViewModel.animationDirectory,
      controllers: [whosThatPokemonViewModel.controller],
      fit: BoxFit.fitHeight,
    );
  }

  Widget _buildRedSimmerBackground() {
    return const Positioned.fill(
      child: RedShimmerBackground(),
    );
  }

  Widget _buildPokemonImage(
    Pokemon? pokemon,
    Color? maskColor,
  ) {
    if (pokemon != null) {
      final imageHeight = context.shortestSide / 1.8;
      return PokemonImage(
        maskColor: maskColor,
        includeHero: false,
        pokemon: pokemon,
        size: Size(imageHeight, imageHeight),
        color: Colors.transparent,
        forceSpriteImage: true,
      );
    }
    return _buildLoadingImage();
  }

  Widget _buildLoadingImage() {
    return Image.asset(
      'assets/images/pokeball_outline.png',
      gaplessPlayback: true,
    )
        .animate(
          onPlay: (controller) => controller.repeat(),
        )
        .shimmer(
          duration: 1200.ms,
          color: colors(context).textOnForeground,
        );
  }
}
