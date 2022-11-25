import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../dependency_injection_container.dart';
import '../../theme/base_theme.dart';
import '../app_shell.dart';
import 'view_models/spash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin {
  final _splashViewModel = getIt.get<SplashViewModel>();

  final _duration = const Duration(milliseconds: 300);

  late final _circleRevealAnimationController = AnimationController(
    vsync: this,
    duration: _duration,
  );

  late final _circleRevealAnimation = CurvedAnimation(
    parent: _circleRevealAnimationController,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    _addSplashAnimationListener();
    super.initState();
  }

  void _addSplashAnimationListener() {
    _splashViewModel.animationChangeCallback.listen(
      (value) {
        if (value) {
          _circleRevealAnimationController.forward().then(
            (value) {
              Navigator.of(context).pushReplacementNamed(
                AppShell.routeName,
              );
            },
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _splashViewModel.dispose();
    _circleRevealAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildFullScreenRedWidget(),
        _buildSplashAnimation(),
        _buildCircularRevealAnimation(),
      ],
    );
  }

  Widget _buildCircularRevealAnimation() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: CircularRevealAnimation(
        animation: _circleRevealAnimation,
        centerAlignment: Alignment.bottomCenter,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colors(context).cardBackground,
          ),
        ),
      ),
    );
  }

  Widget _buildSplashAnimation() {
    return RiveAnimation.asset(
      _splashViewModel.animationDirectory,
      controllers: [_splashViewModel.controller],
      fit: BoxFit.fitHeight,
      placeHolder: _buildPlaceholder(),
    );
  }

  Widget _buildPlaceholder() {
    return _buildFullScreenRedWidget(
      child: Center(
        child: Image.asset(
          'assets/images/pokeball.png',
          height: 50,
          width: 50,
        ),
      ),
    );
  }

  Widget _buildFullScreenRedWidget({
    Widget? child,
  }) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.red,
      child: child,
    );
  }
}
