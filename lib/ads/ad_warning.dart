import 'package:flutter/material.dart';

import '../dependency_injection_container.dart';
import '../theme/base_theme.dart';
import '../theme/poke_app_text.dart';
import '../ui/shared_widgets/view_models/open_pokemon_count_view_model.dart';
import 'view_models/google_ads_view_model.dart';

const kAdWarningLabelMaxSize = 120.0;

class AdWarning extends StatefulWidget {
  @override
  State<AdWarning> createState() => _AdWarningState();
}

class _AdWarningState extends State<AdWarning> with TickerProviderStateMixin {
  final _openPokemonCountViewModel = getIt.get<OpenPokemonCountViewModel>();

  late final _positionAnimationController = AnimationController(
    vsync: this,
    duration: _animationDuration,
  );

  late final _positionAnimation = Tween<Offset>(
    begin: const Offset(kAdWarningLabelMaxSize, 0.0),
    end: Offset.zero,
  ).animate(
    CurvedAnimation(
      parent: _positionAnimationController,
      curve: Curves.linearToEaseOut,
    ),
  );

  late final _rotationAnimationController = AnimationController(
    vsync: this,
    duration: _animationDuration,
  );

  late final _rotationAnimation = Tween<double>(
    begin: 4000,
    end: -4000,
  ).animate(
    CurvedAnimation(
      parent: _rotationAnimationController,
      curve: Curves.linearToEaseOut,
    ),
  );

  @override
  void initState() {
    super.initState();
    _runWithDelay(
      _positionAnimationController.forward,
      voidCallback2: _rotationAnimationController.forward,
    );
    _positionAnimationController.addListener(
      () {
        if (_positionAnimationController.isCompleted) {
          _runWithDelay(
            _positionAnimationController.reverse,
            voidCallback2: _rotationAnimationController.reverse,
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _positionAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: _openPokemonCountViewModel.openPokemonCountStream,
      builder: (context, snapshot) {
        final openPokemonCount = snapshot.data ?? 0;
        return Stack(
          children: [
            SlideTransition(
              position: _positionAnimation,
              child: Container(
                width: kAdWarningLabelMaxSize.toDouble(),
                decoration: _adWarningBoxDecoration(),
                padding: const EdgeInsets.all(4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildAnimatedPokeball(4),
                    _mediumHorizontalMargin(),
                    _buildWarningLabel(
                      context,
                      openPokemonCount,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAnimatedPokeball(int turns) {
    return RotationTransition(
      turns: _rotationAnimation,
      child: Image.asset(
        'assets/images/pokeball.png',
        height: 24,
        width: 24,
      ),
    );
  }

  Widget _buildWarningLabel(
    BuildContext context,
    int openPokemonCount,
  ) {
    final adInCount = kInterstitialAdFrequency - (openPokemonCount % kInterstitialAdFrequency);
    return Flexible(
      child: Text(
        'Ad in : ${adInCount == kInterstitialAdFrequency ? 0 : adInCount}',
        overflow: TextOverflow.ellipsis,
        style: PokeAppText.subtitle4Style.copyWith(
          color: colors(context).cardBackground,
        ),
      ),
    );
  }

  BoxDecoration _adWarningBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Colors.white,
      ),
      borderRadius: const BorderRadius.horizontal(
        left: Radius.circular(
          360,
        ),
      ),
    );
  }

  Widget _mediumHorizontalMargin() {
    return const SizedBox(
      width: 16,
    );
  }

  Duration get _animationDuration => const Duration(
        milliseconds: 1500,
      );

  void _runWithDelay(
    VoidCallback voidCallback, {
    VoidCallback? voidCallback2,
  }) {
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
    ).then(
      (value) {
        voidCallback.call();
        voidCallback2?.call();
      },
    );
  }
}
