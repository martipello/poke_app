import 'package:rive/rive.dart';

class PokeballLoadingViewModel {

  String get animationDirectory => 'assets/animations/pokemon_loading.riv';

  final controller = SimpleAnimation(
    'Timeline 1',
    autoplay: true,
  );

  void dispose() {
    controller.dispose();
  }
}
