import 'package:built_collection/built_collection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart' as rive;
import 'package:tuple/tuple.dart';

import '../../ads/view_models/google_ads_view_model.dart';
import '../../api/models/api_response.dart';
import '../../api/models/pokemon/pokemon.dart';
import '../../api/models/pokemon/pokemon_response.dart';
import '../../dependency_injection_container.dart';
import '../../extensions/build_context_extension.dart';
import '../../extensions/string_extension.dart';
import '../../flavors.dart';
import '../../theme/poke_app_text.dart';
import '../leaderboard/leaderboard_page.dart';
import '../pokemon_filter/filter_button.dart';
import '../pokemon_list/pokemon_tile.dart';
import '../shared_widgets/error_widget.dart' as ew;
import '../shared_widgets/poke_dialog.dart';
import '../shared_widgets/pokeball_loading_widget.dart';
import '../shared_widgets/pokemon_image.dart';
import '../shared_widgets/rounded_button.dart';
import '../shared_widgets/three_d_text.dart';
import '../shared_widgets/view_constraint.dart';
import 'auto_retry.dart';
import 'red_shimmer_background.dart';
import 'score_widget.dart';
import 'view_models/score_view_model.dart';
import 'view_models/whos_that_pokemon_view_model.dart';

class WhosThatPokemonView extends StatefulWidget {
  const WhosThatPokemonView({Key? key}) : super(key: key);

  @override
  State<WhosThatPokemonView> createState() => _WhosThatPokemonViewState();
}

const kWhosThatPokemonRoute = '/whosThatPokemon';

class _WhosThatPokemonViewState extends State<WhosThatPokemonView> {
  final whosThatPokemonViewModel = getIt.get<WhosThatPokemonViewModel>();
  final scoreViewModel = getIt.get<ScoreViewModel>();
  final _googleAdsViewModel = getIt.get<GoogleAdsViewModel>();
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scoreViewModel.init();
    whosThatPokemonViewModel.generateRandomPokemon();
    whosThatPokemonViewModel.revealResultStream.listen(
      (value) {
        if (value.item1 == RevealResult.correct) {
          scoreViewModel.addWin();
        } else if (value.item1 == RevealResult.incorrect) {
          scoreViewModel.addLoss();
        }
      },
    );
    scoreViewModel.winsAndLossesStream.listen(
      (event) {
        final openedCount = event.item1 + event.item2;
        if (openedCount == 1 || openedCount % kInterstitialAdFrequency == 0 && F.appFlavor != Flavor.paid && !kIsWeb) {
          //We do this as without it first ad always fails
          _googleAdsViewModel.createInterstitialAd();
          if (openedCount % kInterstitialAdFrequency == 0) {
            _googleAdsViewModel.showInterstitialAd();
          }
        }
      },
    );
  }

  @override
  void dispose() {
    whosThatPokemonViewModel.dispose();
    scoreViewModel.dispose();
    _googleAdsViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.red,
      ),
      child: Scaffold(
        backgroundColor: Colors.red,
        body: _buildWhosThatPokemonViewBody(),
        floatingActionButton: FilterButtonWidget(
          onTap: () {
            context.push(LeaderboardPage.routeName);
          },
          imageUri: 'assets/images/red_white_background.png',
          child: const Center(
            child: Icon(
              Icons.leaderboard,
              color: Colors.black,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWhosThatPokemonViewBody() {
    return Stack(
      children: [
        _buildRedSimmerBackground(),
        _buildWhosThatPokemonState(),
      ],
    );
  }

  Widget _buildWhosThatPokemonState() {
    return StreamBuilder<Tuple2<RevealResult, bool>>(
      stream: whosThatPokemonViewModel.revealResultStream,
      builder: (context, isRevealedSnapshot) {
        final revealResult = isRevealedSnapshot.data?.item1 ?? RevealResult.none;
        final isRevealed = isRevealedSnapshot.data?.item2 == true;
        return StreamBuilder<ApiResponse<({PokemonResponse pokemonResponse, Pokemon? concealedPokemon})>>(
          stream: whosThatPokemonViewModel.pokemonOptionsStream,
          builder: (context, pokemonOptionsSnapshot) {
            final pokemonOptionsSnapshotData = pokemonOptionsSnapshot.data;
            final pokemonOptions =
                pokemonOptionsSnapshotData?.data?.pokemonResponse.pokemon_v2_pokemon ?? BuiltList<Pokemon>.of([]);
            final selectedPokemon = pokemonOptionsSnapshotData?.data?.concealedPokemon;
            if (pokemonOptionsSnapshot.data?.status == Status.ERROR) {
              return Center(
                child: ew.ErrorWidget(
                  error: pokemonOptionsSnapshot.data as ApiResponse,
                  onTryAgain: whosThatPokemonViewModel.generateRandomPokemon,
                ),
              );
            }
            if (pokemonOptionsSnapshot.data?.status == Status.LOADING ||
                pokemonOptionsSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: PokeballLoadingWidget(),
              );
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
    return StreamBuilder<bool>(
      stream: whosThatPokemonViewModel.autoRetry,
      builder: (context, snapshot) {
        final isAutoRetry = snapshot.data ?? false;
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          controller: scrollController,
          child: ViewConstraint(
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
                _buildWhosThatPokemonOptions(
                  pokemonOptions,
                  selectedPokemon,
                  isRevealed,
                ),
                if (!isAutoRetry) _buildRetryButton(),
                _buildResetButton(),
                AutoRetry(
                  isAutoRetry: isAutoRetry,
                  onChanged: whosThatPokemonViewModel.setAutoRetry,
                ),
                const SizedBox(height: 96)
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildRetryButton() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 4,
        right: 4,
        bottom: 12,
        top: 12,
      ),
      child: RoundedButton(
        fillColor: Colors.yellow,
        label: context.strings.retry.capitalize(),
        textStyle: PokeAppText.pokeFontBody1.copyWith(
          color: Colors.blue.shade700,
        ),
        outlineColor: Colors.blue.shade700,
        onPressed: () {
          scrollToTop();
          whosThatPokemonViewModel.generateRandomPokemon();
        },
      ),
    );
  }

  Widget _buildResetButton() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 32.0,
        left: 4,
        right: 4,
      ),
      child: RoundedButton(
        label: context.strings.reset.capitalize(),
        textStyle: PokeAppText.pokeFontBody1.copyWith(
          color: Colors.blue.shade700,
        ),
        fillColor: Colors.yellow,
        outlineColor: Colors.blue.shade700,
        onPressed: () async {
          final confirmReset = await _buildResetPokeDialog().show(context);
          if (confirmReset == true) {
            scrollToTop();
            setState(scoreViewModel.resetScores);
          }
        },
      ),
    );
  }

  PokeDialog _buildResetPokeDialog() {
    return PokeDialog(
      title: context.strings.reset,
      content: Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
        ),
        child: Text(
          context.strings.confirmReset,
          style: PokeAppText.body4Style,
        ),
      ),
      dialogActions: [
        DialogAction(
          actionText: context.strings.reset.capitalize(),
          actionVoidCallback: () {
            Navigator.of(context).pop(true);
          },
        ),
        DialogAction(
          actionText: context.strings.cancel.capitalize(),
          actionVoidCallback: () {
            Navigator.of(context).pop(false);
          },
        )
      ],
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
              isRevealed ? null : Colors.blue.shade900,
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
          Positioned(
            right: 0,
            top: 16,
            child: ScoreWidget(
              scoreViewModel: scoreViewModel,
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
            context.strings.correct,
          ),
        if (revealResult == RevealResult.incorrect)
          _buildThreeDText(
            context.strings.tooBad,
          ),
        _buildThreeDText(
          isRevealed ? '${context.strings.its} ${_pokemonName.capitalize()}' : context.strings.whoDatPokemon,
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
              scrollToTop();
              whosThatPokemonViewModel.setRevealResult(
                pokemon.id!,
              );
            },
    );
  }

  Widget _buildWhosThatPokemonImageBackground() {
    return rive.RiveAnimation.asset(
      antialiasing: false,
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
        drawOuterCircle: false,
        pokemon: pokemon,
        size: Size(imageHeight, imageHeight),
        imageProvider: CachedNetworkImageProvider(createImageUrl(pokemon.id ?? 0)),
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
          color: context.colors.onSurface,
        );
  }

  void scrollToTop() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn,
      );
    }
  }
}
