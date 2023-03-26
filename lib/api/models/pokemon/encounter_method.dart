// ignore_for_file: non_constant_identifier_names

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'pokemon_resource.dart';

part 'encounter_method.g.dart';

abstract class EncounterMethod implements Built<EncounterMethod, EncounterMethodBuilder> {
  factory EncounterMethod([void Function(EncounterMethodBuilder) updates]) = _$EncounterMethod;
  EncounterMethod._();

  BuiltList<PokemonResource> get pokemon_v2_encountermethodnames;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(EncounterMethod.serializer, this) as Map<String, dynamic>;
  }

  static EncounterMethod fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(EncounterMethod.serializer, json)!;
  }

  static Serializer<EncounterMethod> get serializer => _$encounterMethodSerializer;
}
