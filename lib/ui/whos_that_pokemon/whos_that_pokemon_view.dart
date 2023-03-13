import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:rive/rive.dart';

import '../../api/models/api_response.dart';
import '../../api/models/pokemon/pokemon.dart';
import '../../dependency_injection_container.dart';
import '../../extensions/build_context_extension.dart';
import '../../extensions/string_extension.dart';
import '../../theme/base_theme.dart';
import '../../theme/poke_app_text.dart';
import '../../utils/console_output.dart';
import '../settings/settings.dart';
import '../shared_widgets/clipped_app_bar.dart';
import '../shared_widgets/pokemon_image.dart';
import '../shared_widgets/rounded_button.dart';
import '../shared_widgets/three_d_text.dart';
import 'view_models/whos_that_pokemon_view_model.dart';

class WhosThatPokemonView extends StatefulWidget {
  WhosThatPokemonView({Key? key}) : super(key: key);

  @override
  State<WhosThatPokemonView> createState() => _WhosThatPokemonViewState();
}

class _WhosThatPokemonViewState extends State<WhosThatPokemonView> {
  final whosThatPokemonViewModel = getIt.get<WhosThatPokemonViewModel>();

  @override
  void initState() {
    super.initState();
    whosThatPokemonViewModel.generateRandomPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: whosThatPokemonViewModel.isRevealedStream,
      builder: (context, isRevealedSnapshot) {
        final isRevealed = isRevealedSnapshot.data == true;
        return StreamBuilder<ApiResponse<Pokemon?>>(
          stream: whosThatPokemonViewModel.randomPokemonStream,
          builder: (context, snapshot) {
            final pokemon = snapshot.data?.data;
            return AnnotatedRegion(
              value: const SystemUiOverlayStyle(
                statusBarColor: Colors.red,
              ),
              child: Scaffold(
                body: _buildWhosThatPokemonViewBody(
                  pokemon,
                  isRevealed,
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildWhosThatPokemonViewBody(
    Pokemon? pokemon,
    bool isRevealed,
  ) {
    return Stack(
      children: [
        _buildRedSimmerBackground(),
        Positioned.fill(
          child: _buildWhosThatPokemonScrollView(
            pokemon,
            isRevealed,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildButtonBar(isRevealed),
        )
      ],
    );
  }

  Widget _buildWhosThatPokemonScrollView(
    Pokemon? pokemon,
    bool isRevealed,
  ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: context.statusBarHeight,
          ),
          ClippedAppBar(
            menuButton: _buildMenuButton(),
          ),
          _buildWhosThatPokemonImageWithBackground(
            pokemon,
            isRevealed,
          ),
          _buildWhosThatPokemonText(
            pokemon?.name,
            isRevealed,
          ),
        ],
      ),
    );
  }

  IconButton _buildMenuButton() {
    return IconButton(
      icon: Icon(
        Icons.more_vert_rounded,
        color: colors(context).cardBackground,
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(
          Settings.routeName,
        );
      },
    );
  }

  Widget _buildWhosThatPokemonImageWithBackground(
    Pokemon? pokemon,
    bool isRevealed,
  ) {
    log('tag').d('_buildPokemonImage');
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
    bool isRevealed,
  ) {
    final _pokemonName = pokemonName ?? context.strings.unknownPokemon;
    return _buildThreeDText(
      isRevealed ? 'It\'s ${_pokemonName.capitalize()}' : context.strings.whoDatPokemon,
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
        fontSize: 43,
        color: Colors.blue.shade900,
      ),
    );
  }

  Widget _buildButtonBar(bool isRevealed) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: _buildRegenerateButton(),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: _buildRevealButton(isRevealed),
          ),
        ],
      ),
    );
  }

  Widget _buildRevealButton(bool isRevealed) {
    return RoundedButton(
      fillColor: Colors.yellow,
      label: isRevealed ? 'Hide' : 'Reveal',
      onPressed: () {
        whosThatPokemonViewModel.setIsRevealed(
          isRevealed: !isRevealed,
        );
      },
    );
  }

  Widget _buildRegenerateButton() {
    return RoundedButton(
      label: 'Regenerate',
      fillColor: Colors.blue.shade700,
      onPressed: whosThatPokemonViewModel.generateRandomPokemon,
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
