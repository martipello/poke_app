import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:rive/rive.dart';

import '../../api/models/api_response.dart';
import '../../api/models/pokemon/pokemon.dart';
import '../../api/models/pokemon/pokemon_response.dart';
import '../../dependency_injection_container.dart';
import '../../extensions/build_context_extension.dart';
import '../../extensions/string_extension.dart';
import '../../theme/base_theme.dart';
import '../../theme/poke_app_text.dart';
import '../../utils/console_output.dart';
import '../pokemon_list/pokemon_tile.dart';
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
    return StreamBuilder<bool>(
      stream: whosThatPokemonViewModel.isRevealedStream,
      builder: (context, isRevealedSnapshot) {
        final isRevealed = isRevealedSnapshot.data == true;
        return Stack(
          children: [
            _buildRedSimmerBackground(),
            _buildWhosThatPokemonScrollView(
              isRevealed,
            ),
          ],
        );
      },
    );
  }

  Widget _buildWhosThatPokemonScrollView(
    bool isRevealed,
  ) {
    return StreamBuilder<Pokemon?>(
      stream: whosThatPokemonViewModel.selectedPokemonStream,
      builder: (context, snapshot) {
        final selectedPokemon = snapshot.data;
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
                isRevealed,
              ),
              const SizedBox(
                height: 16,
              ),
              if (isRevealed) _buildRetryButton(),
              _buildWhosThatPokemonOptions(
                isRevealed,
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildRetryButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
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

  Widget _buildWhosThatPokemonOptions(
    bool isRevealed,
  ) {
    return StreamBuilder<ApiResponse<PokemonResponse>>(
      stream: whosThatPokemonViewModel.pokemonOptionsStream,
      builder: (context, snapshot) {
        final pokemonOptions = snapshot.data?.data?.pokemon_v2_pokemon ?? BuiltList<Pokemon>.of([]);
        return Column(
          children: pokemonOptions
              .map(
                (pokemon) => _buildPokemonOption(
                  pokemon,
                  isRevealed,
                ),
              )
              .toList(),
        );
      },
    );
  }

  Widget _buildPokemonOption(
    Pokemon pokemon,
    bool isRevealed,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: PokemonTile(
        pokemon: pokemon,
        maskColor: isRevealed ? null : Colors.blue.shade700,
        showImage: false,
        showTypes: false,
        onTap: () {
          whosThatPokemonViewModel.setIsRevealed(
            isRevealed: !isRevealed,
          );
        },
      ),
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
