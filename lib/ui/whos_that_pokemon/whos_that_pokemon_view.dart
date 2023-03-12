import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:rive/rive.dart';

import '../../api/models/pokemon/pokemon.dart';
import '../../dependency_injection_container.dart';
import '../../extensions/build_context_extension.dart';
import '../../theme/poke_app_text.dart';
import '../shared_widgets/pokemon_image.dart';
import 'view_models/whos_that_pokemon_view_model.dart';

class WhosThatPokemonView extends StatelessWidget {
  WhosThatPokemonView({Key? key}) : super(key: key);

  final whosThatPokemonViewModel = getIt.get<WhosThatPokemonViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildRedSimmerBackground(),
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    height: 370,
                    width: 370,
                    child: Stack(
                      children: [
                        _buildWhosThatPokemonBackgroundAnimation(),
                        Center(
                          child: _buildPokemonImage(Colors.blue[900]),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              bottom: 8.0,
                            ),
                            child: _buildPokemonImage(Colors.blue.shade700),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      height: 155,
                      width: 220,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: _buildPokemonTexts(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPokemonTexts(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 1,
          left: 1,
          child: _buildPokemonTextBackground(context),
        ),
        Positioned(
          bottom: 2,
          left: 2,
          child: _buildPokemonTextBackground(context),
        ),
        Positioned(
          bottom: 3,
          left: 3,
          child: _buildPokemonTextBackground(context),
        ),
        Positioned(
          bottom: 4,
          left: 4,
          child: _buildPokemonTextBackground(context),
        ),
        Positioned(
          bottom: 5,
          left: 5,
          child: _buildPokemonTextBackground(context),
        ),
        Positioned(
          bottom: 6,
          left: 6,
          child: _buildPokemonTextBackground(context),
        ),
        Positioned(
          bottom: 7,
          left: 7,
          child: _buildPokemonTextBackground(context),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          child: _buildPokemonTextBackground(context),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          child: _buildPokemonTextWithBorder(context),
        )
      ],
    );
  }

  Widget _buildPokemonTextWithBorder(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        BorderedText(
          strokeWidth: 6.0,
          strokeColor: Colors.blue.shade700,
          child: Text(
            '?',
            textAlign: TextAlign.end,
            style: PokeAppText.pokeFontMegaTitle2.copyWith(
              color: Colors.yellow,
            ),
          ),
        ),
        BorderedText(
          strokeWidth: 6.0,
          strokeColor: Colors.blue.shade700,
          child: Text(
            context.strings.pokemon,
            textAlign: TextAlign.end,
            style: PokeAppText.pokeFontTitle1.copyWith(
              color: Colors.yellow,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPokemonTextBackground(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '?',
          textAlign: TextAlign.end,
          style: PokeAppText.pokeFontMegaTitle2.copyWith(
            color: Colors.blue.shade900,
          ),
        ),
        Text(
          context.strings.pokemon,
          textAlign: TextAlign.end,
          style: PokeAppText.pokeFontTitle1.copyWith(
            fontSize: 49,
            color: Colors.blue.shade900,
          ),
        ),
      ],
    );
  }

  RiveAnimation _buildWhosThatPokemonBackgroundAnimation() {
    return RiveAnimation.asset(
      whosThatPokemonViewModel.animationDirectory,
      controllers: [whosThatPokemonViewModel.controller],
      fit: BoxFit.fitHeight,
    );
  }

  Widget _buildRedSimmerBackground() {
    return Positioned.fill(
      child: Container(
        color: Colors.red,
        height: double.infinity,
      )
          .animate(
            onPlay: (controller) => controller.repeat(),
          )
          .shimmer(
            angle: 2,
            duration: 800.ms,
            color: Colors.white.withOpacity(0.2),
            size: 0.2,
          )
          .animate(
            onPlay: (controller) => controller.repeat(),
          )
          .shimmer(
            angle: 2,
            duration: 1600.ms,
            color: Colors.white.withOpacity(0.2),
            size: 0.4,
          )
          .animate(
            onPlay: (controller) => controller.repeat(),
          )
          .shimmer(
            angle: 2,
            duration: 2400.ms,
            color: Colors.yellow.withOpacity(0.2),
            size: 0.6,
          )
          .animate(
            onPlay: (controller) => controller.repeat(),
          )
          .shimmer(
            angle: 2,
            duration: 3200.ms,
            color: Colors.yellow.withOpacity(0.2),
            size: 0.8,
          ),
    );
  }

  Widget _buildPokemonImage(Color? maskColor) {
    return PokemonImage(
      maskColor: maskColor,
      pokemon: Pokemon(
        (b) => b..id = 1,
      ),
      color: Colors.transparent,
    );
  }
}
