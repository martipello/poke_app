// ignore_for_file: non_constant_identifier_names

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'pokemon_ability.dart';

part 'pokemon_ability_holder.g.dart';

abstract class PokemonAbilityHolder implements Built<PokemonAbilityHolder, PokemonAbilityHolderBuilder> {
  factory PokemonAbilityHolder([void Function(PokemonAbilityHolderBuilder) updates]) = _$PokemonAbilityHolder;
  PokemonAbilityHolder._();

  bool? get is_hidden;

  PokemonAbility? get pokemon_v2_ability;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(PokemonAbilityHolder.serializer, this) as Map<String, dynamic>;
  }

  static PokemonAbilityHolder fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(PokemonAbilityHolder.serializer, json)!;
  }

  static Serializer<PokemonAbilityHolder> get serializer => _$pokemonAbilityHolderSerializer;
}
