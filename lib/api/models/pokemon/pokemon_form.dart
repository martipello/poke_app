// ignore_for_file: non_constant_identifier_names

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'pokemon.dart';
import 'pokemon_ability_holder.dart';
import 'pokemon_resource.dart';

part 'pokemon_form.g.dart';

abstract class PokemonForm implements Built<PokemonForm, PokemonFormBuilder> {

  factory PokemonForm([void Function(PokemonFormBuilder) updates]) = _$PokemonForm;
  PokemonForm._();

  int? get id;

  String? get name;

  bool? get is_mega;

  bool? get is_default;

  bool? get is_battle_only;

  String? get form_name;

  int? get formOrder;

  int? get pokemon_id;

  int? get order;

  Pokemon? get pokemon_v2_pokemon;

  BuiltList<PokemonAbilityHolder> get pokemon_v2_pokemonabilities;

  BuiltList<PokemonResource> get pokemon_v2_pokemonformgenerations;

  BuiltList<PokemonResource> get pokemon_v2_pokemonformnames;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(PokemonForm.serializer, this) as Map<String, dynamic>;
  }

  static PokemonForm fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(PokemonForm.serializer, json)!;
  }

  static Serializer<PokemonForm> get serializer => _$pokemonFormSerializer;
}