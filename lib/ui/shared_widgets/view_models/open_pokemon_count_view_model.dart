import 'package:rxdart/rxdart.dart';

class OpenPokemonCountViewModel {

  final openPokemonCountStream = BehaviorSubject<int>.seeded(0);

  void increment() {
    final openPokemonCount = openPokemonCountStream.value;
    openPokemonCountStream.add(openPokemonCount + 1);
  }

  void dispose(){
    openPokemonCountStream.close();
  }
}