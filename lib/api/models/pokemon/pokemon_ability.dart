// ignore_for_file: non_constant_identifier_names

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'pokemon_resource.dart';

part 'pokemon_ability.g.dart';

abstract class PokemonAbility implements Built<PokemonAbility, PokemonAbilityBuilder> {

  factory PokemonAbility([void Function(PokemonAbilityBuilder) updates]) = _$PokemonAbility;
  PokemonAbility._();

  int? get id;

  int? get generation_id;

  bool? get is_main_series;

  String? get name;

  BuiltList<PokemonResource> get pokemon_v2_abilityflavortexts;

  BuiltList<PokemonResource> get pokemon_v2_abilityeffecttexts;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(PokemonAbility.serializer, this) as Map<String, dynamic>;
  }

  static PokemonAbility fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(PokemonAbility.serializer, json)!;
  }

  static Serializer<PokemonAbility> get serializer => _$pokemonAbilitySerializer;
}