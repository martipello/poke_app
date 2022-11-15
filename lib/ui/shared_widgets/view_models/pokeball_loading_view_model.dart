import 'package:rive/rive.dart';

class PokeballLoadingViewModel {
  final controller = SimpleAnimation(
    'Timeline 1',
    autoplay: true,
  );

  void dispose() {
    controller.dispose();
  }
}
