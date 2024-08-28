import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';

import '../../dependency_injection_container.dart';
import '../../extensions/build_context_extension.dart';
import '../app_shell.dart';
import '../pokemon_list/pokemon_list_view_decoration.dart';
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
              context.go(PokemonListViewDecoration.routeName);
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
            color: context.colors.surface,
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
      color: const Color(0xFFff0000),
      child: child,
    );
  }
}
