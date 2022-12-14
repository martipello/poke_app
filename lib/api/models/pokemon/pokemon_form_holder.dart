// ignore_for_file: non_constant_identifier_names
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'pokemon_form.dart';

part 'pokemon_form_holder.g.dart';

abstract class PokemonFormHolder implements Built<PokemonFormHolder, PokemonFormHolderBuilder> {
  factory PokemonFormHolder([void Function(PokemonFormHolderBuilder) updates]) = _$PokemonFormHolder;

  PokemonFormHolder._();

  PokemonForm? get pokemon_v2_pokemonform;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(PokemonFormHolder.serializer, this) as Map<String, dynamic>;
  }

  static PokemonFormHolder fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(PokemonFormHolder.serializer, json)!;
  }

  static Serializer<PokemonFormHolder> get serializer => _$pokemonFormHolderSerializer;
}
