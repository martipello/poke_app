// ignore_for_file: non_constant_identifier_names

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'encounter.dart';
import 'encounter_method.dart';

part 'encounter_slot.g.dart';

abstract class EncounterSlot implements Built<EncounterSlot, EncounterSlotBuilder> {
  factory EncounterSlot([void Function(EncounterSlotBuilder) updates]) = _$EncounterSlot;
  EncounterSlot._();

  int? get id;

  int? get rarity;

  Encounter? get pokemon_v2_locationarea;

  EncounterMethod? get pokemon_v2_encountermethod;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(EncounterSlot.serializer, this) as Map<String, dynamic>;
  }

  static EncounterSlot fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(EncounterSlot.serializer, json)!;
  }

  static Serializer<EncounterSlot> get serializer => _$encounterSlotSerializer;
}
