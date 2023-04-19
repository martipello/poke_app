import 'package:rxdart/rxdart.dart';

import '../../../utils/splash_animation_controller.dart';

class SplashViewModel {
  final animationChangeCallback = BehaviorSubject<bool>.seeded(false);

  SplashAnimationController get controller =>
      _controller ??= SplashAnimationController('Timeline 1', autoPlay: true, onAnimationEnd: () {
        animationChangeCallback.add(true);
      });

  SplashAnimationController? _controller;

  void dispose() {
    _controller?.dispose();
  }

  String get animationDirectory => 'assets/animations/splash_screen.riv';
}
