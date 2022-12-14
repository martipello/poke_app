import 'dart:math' as math;

import 'package:built_collection/built_collection.dart';

import '../../../api/models/pokemon/encounter.dart';
import '../../../api/models/pokemon/pokemon_resource.dart';
import '../../../extensions/iterable_extension.dart';

class PokemonEncounterViewModel {
  Future<Map<PokemonResource, Encounter>> groupEncountersByVersion(BuiltList<Encounter> encounters) async {
    return encounters
        .where(
          (p0) => p0.pokemon_v2_version != null,
        )
        .groupBy(
          (e) => e.pokemon_v2_version!,
        )
        .map<PokemonResource, Encounter>(
      (pokemonResource, encounters) {
        return MapEntry(
          pokemonResource,
          //Handle issue: myList.reduce() function wont be called on lists of 1
          encounters.length == 1
              ? _reduceEncounterFunction(
                  encounters.first,
                  encounters.first,
                )
              : encounters.reduce(
                  _reduceEncounterFunction,
                ),
        );
      },
    );
  }

  Encounter _reduceEncounterFunction(
    Encounter value,
    Encounter element,
  ) {
    final valueLocation = value.pokemon_v2_locationarea;
    final elementLocation = element.pokemon_v2_locationarea;
    final valueEncounterSlot = value.pokemon_v2_encounterslot;
    final elementEncounterSlot = element.pokemon_v2_encounterslot;
    final valueEncounterSlotAndLocation = value.encounterSlotAndLocations.toMap();
    final elementEncounterSlotAndLocation = element.encounterSlotAndLocations.toMap();

    valueEncounterSlotAndLocation.addEntries(
      [
        if (valueLocation != null && valueEncounterSlot != null)
          MapEntry(
            valueLocation,
            valueEncounterSlot,
          ),
        if (elementLocation != null && elementEncounterSlot != null)
          MapEntry(
            elementLocation,
            elementEncounterSlot,
          ),
      ],
    );
    valueEncounterSlotAndLocation.addAll(
      elementEncounterSlotAndLocation,
    );

    return Encounter(
      (eb) => eb
        ..id = value.id
        ..max_level = math.max(value.max_level ?? 0, element.max_level ?? 0)
        ..min_level = math.min(value.min_level ?? 0, element.min_level ?? 0)
        ..pokemon_v2_version = element.pokemon_v2_version?.toBuilder()
        ..encounterSlotAndLocations.replace(
          valueEncounterSlotAndLocation,
        ),
    );
  }
}
