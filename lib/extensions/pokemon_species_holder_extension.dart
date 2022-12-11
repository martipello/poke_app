import '../api/models/pokemon/pokemon_species_holder.dart';
import 'iterable_extension.dart';
import 'string_extension.dart';

extension PokemonSpeciesHolderExtension on PokemonSpeciesHolder? {
  /*
    final form = abilityHolder.versionDisplayName();
    final eggGroup = abilityHolder.mainSeries();
   */

  String shape() {
    return this?.pokemon_v2_pokemonshape?.pokemon_v2_shapenames.firstOrNull()?.name.capitalize() ?? '';
  }

  String habitat() {
    return this?.pokemon_v2_pokemonhabitat?.pokemon_v2_habitatnames.firstOrNull()?.name.capitalize() ?? '';
  }

  String color() {
    return this?.pokemon_v2_pokemoncolor?.name.capitalize() ?? '';
  }

  int baseHappiness() {
    return this?.base_happiness?.toInt() ?? 0;
  }

  int captureRate() {
    return this?.capture_rate?.toInt() ?? 0;
  }

  int genderRate() {
    return this?.gender_rate?.toInt() ?? 0;
  }

  int hatchCounter() {
    return this?.hatch_counter?.toInt() ?? 0;
  }

  String isLegendary() {
    return this?.is_legendary == true ? 'Yes' : 'No';
  }

  String isMythical() {
    return this?.is_mythical == true ? 'Yes' : 'No';
  }

  String isBaby() {
    return this?.is_baby == true ? 'Yes' : 'No';
  }
}
