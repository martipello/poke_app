import 'package:flutter/material.dart';

import '../dependency_injection_container.dart';
import '../extensions/build_context_extension.dart';
import '../in_app_purchases/view_models/in_app_purchase_view_model.dart';
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
  final _inAppPurchaseViewModel = getIt.get<InAppPurchaseViewModel>();

  AnimationController? _positionAnimationController;
  AnimationController? _rotationAnimationController;
  Animation<Offset>? _positionAnimation;
  Animation<double>? _rotationAnimation;

  void setPositionAnimation() {
    _positionAnimationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );
    if (_positionAnimationController != null) {
      _positionAnimation = Tween<Offset>(
        begin: const Offset(kAdWarningLabelMaxSize, 0.0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _positionAnimationController!,
          curve: Curves.linearToEaseOut,
        ),
      );
    }
  }

  void setRotationAnimation() {
    _rotationAnimationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );
    if (_rotationAnimationController != null) {
      _rotationAnimation = Tween<double>(
        begin: 4000,
        end: -4000,
      ).animate(
        CurvedAnimation(
          parent: _rotationAnimationController!,
          curve: Curves.linearToEaseOut,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    setPositionAnimation();
    setRotationAnimation();
    _runWithDelay(
      voidCallback1: _positionAnimationController?.forward,
      voidCallback2: _rotationAnimationController?.forward,
    );
    _positionAnimationController?.addListener(
      () {
        if (_positionAnimationController?.isCompleted == true) {
          _runWithDelay(
            voidCallback1: _positionAnimationController?.reverse,
            voidCallback2: _rotationAnimationController?.reverse,
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _positionAnimationController?.dispose();
    _rotationAnimationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: _openPokemonCountViewModel.openPokemonCountStream,
      builder: (context, snapshot) {
        final openPokemonCount = snapshot.data ?? 0;
        final positionAnimation = _positionAnimation;
        if (positionAnimation != null) {
          return Stack(
            children: [
              SlideTransition(
                position: positionAnimation,
                child: Container(
                  width: kAdWarningLabelMaxSize.toDouble(),
                  decoration: _adWarningBoxDecoration(),
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildAnimatedPokeball(4),
                      _mediumHorizontalMargin(),
                      if (!_inAppPurchaseViewModel.hasPurchasedPremium)
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
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _buildAnimatedPokeball(int turns) {
    final rotationAnimation = _rotationAnimation;
    if (rotationAnimation != null) {
      return RotationTransition(
        turns: rotationAnimation,
        child: Image.asset(
          'assets/images/pokeball.png',
          height: 24,
          width: 24,
          cacheWidth: 66,
          cacheHeight: 66,
        ),
      );
    } else {
      return const SizedBox();
    }
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
          color: context.colors.onSurface,
        ),
      ),
    );
  }

  BoxDecoration _adWarningBoxDecoration() {
    return BoxDecoration(
      color: context.colors.surface,
      border: Border.all(
        color: context.colors.surface,
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

  void _runWithDelay({
    VoidCallback? voidCallback1,
    VoidCallback? voidCallback2,
  }) {
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
    ).then(
      (value) {
        if (mounted) {
          voidCallback1?.call();
          voidCallback2?.call();
        }
      },
    );
  }
}
