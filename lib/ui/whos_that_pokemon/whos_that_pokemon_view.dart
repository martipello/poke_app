import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:rive/rive.dart';

import '../../api/models/pokemon/pokemon.dart';
import '../../dependency_injection_container.dart';
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
              child: Stack(
                children: [
                  _buildWhosThatPokemonBackgroundAnimation(),
                  _buildPokemonImage(),
                ],
              ),
            ),
          ),
        ],
      ),
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

  Widget _buildPokemonImage() {
    return PokemonImage(
      pokemon: Pokemon(
            (b) => b..id = 1,
      ),
      color: Colors.transparent,
    );
  }
}
