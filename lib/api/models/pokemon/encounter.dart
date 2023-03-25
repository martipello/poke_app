// ignore_for_file: non_constant_identifier_names
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'encounter_slot.dart';
import 'pokemon_resource.dart';

part 'encounter.g.dart';

abstract class Encounter implements Built<Encounter, EncounterBuilder> {
  factory Encounter([void Function(EncounterBuilder) updates]) = _$Encounter;
  Encounter._();

  int? get id;

  int? get min_level;

  int? get max_level;

  PokemonResource? get pokemon_v2_version;

  PokemonResource? get pokemon_v2_locationarea;

  PokemonResource? get pokemon_v2_location;

  EncounterSlot? get pokemon_v2_encounterslot;

  BuiltMap<PokemonResource, EncounterSlot> get encounterSlotAndLocations;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Encounter.serializer, this) as Map<String, dynamic>;
  }

  static Encounter fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Encounter.serializer, json)!;
  }

  static Serializer<Encounter> get serializer => _$encounterSerializer;
}
