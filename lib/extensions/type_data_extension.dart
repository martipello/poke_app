import '../api/models/pokemon/pokemon_type.dart';
import '../api/models/pokemon/type_data.dart';

extension TypeDataExtension on TypeData {
  PokemonType pokemonType() {
    switch (id) {
      case 1:
        return PokemonType.normal;
      case 2:
        return PokemonType.fighting;
      case 3:
        return PokemonType.flying;
      case 4:
        return PokemonType.poison;
      case 5:
        return PokemonType.ground;
      case 6:
        return PokemonType.rock;
      case 7:
        return PokemonType.bug;
      case 8:
        return PokemonType.ghost;
      case 9:
        return PokemonType.steel;
      case 10:
        return PokemonType.fire;
      case 11:
        return PokemonType.water;
      case 12:
        return PokemonType.grass;
      case 13:
        return PokemonType.electric;
      case 14:
        return PokemonType.psychic;
      case 15:
        return PokemonType.ice;
      case 16:
        return PokemonType.dragon;
      case 17:
        return PokemonType.dark;
      case 18:
        return PokemonType.fairy;
      case 10002:
        return PokemonType.shadow;
      default:
        return PokemonType.unknown;
    }
  }
}
