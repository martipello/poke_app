import '../api/models/pokemon/pokemon_move.dart';
import 'iterable_extension.dart';
import 'pokemon_resource_extension.dart';
import 'string_extension.dart';

extension MoveLearnMethodExtension on PokemonMove? {
  String? flavorText() {
    return this?.pokemon_v2_moveflavortexts.lastOrNull()?.flavorText().capitalize();
  }
}
