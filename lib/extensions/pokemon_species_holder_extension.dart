import '../api/models/pokemon/pokemon_species_holder.dart';
import 'iterable_extension.dart';
import 'pokemon_resource_extension.dart';

extension PokemonSpeciesHolderExtension on PokemonSpeciesHolder? {
  /*
    final form = abilityHolder.versionDisplayName();
    final eggGroup = abilityHolder.mainSeries();
   */

  String shape() {
    return this?.pokemon_v2_pokemonshape?.pokemon_v2_pokemonshapenames.firstOrNull()?.normalizeName() ?? '';
  }

  String habitat() {
    return this?.pokemon_v2_pokemonhabitat?.pokemon_v2_pokemonhabitatnames.firstOrNull()?.normalizeName() ?? '';
  }

  String color() {
    return this?.pokemon_v2_pokemoncolor?.normalizeName() ?? '';
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

  String steps() {
    final hatchCounter = this?.hatch_counter?.toInt() ?? 0;
    if(hatchCounter == 0) {
      return '';
    }
    final genFourSteps = hatchCounter * 255;
    // final genTwoThreeSevenSteps = hatchCounter * 256;
    final genFiveSixSteps = hatchCounter * 257;
    return 'From $genFourSteps To $genFiveSixSteps';
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
