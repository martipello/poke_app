import 'package:rive/rive.dart';

class WhosThatPokemonViewModel {

  SimpleAnimation get controller => SimpleAnimation(
    'Timeline 1',
    autoplay: true,
  );

  SimpleAnimation? _controller;

  void dispose() {
    _controller?.dispose();
  }

  String get animationDirectory => 'assets/animations/whos_that_pokemon.riv';

}
