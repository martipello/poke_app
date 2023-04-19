import 'package:flutter/animation.dart';
import 'package:rive/rive.dart';

class SplashAnimationController extends OneShotAnimation {
  SplashAnimationController(
    super.animationName, {
    this.onAnimationEnd,
    this.autoPlay = false,
  });

  final VoidCallback? onAnimationEnd;
  final bool autoPlay;

  @override
  bool get autoplay => autoPlay;

  @override
  void onActiveChanged() {
    if (!isActive) {
      onAnimationEnd?.call();
    }
  }
}
