import 'flavors.dart';
import 'poke_app_wrapper.dart';

void main() {
  F.appFlavor = Flavor.dev;
  PokeAppWrapper.init();
}
