import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'cry.dart';

part 'pokemon_cries.g.dart';

abstract class PokemonCries implements Built<PokemonCries, PokemonCriesBuilder> {

  factory PokemonCries([void Function(PokemonCriesBuilder) updates]) = _$PokemonCries;
  PokemonCries._();

  Cry? get cries;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(PokemonCries.serializer, this) as Map<String, dynamic>;
  }

  static PokemonCries fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(PokemonCries.serializer, json)!;
  }

  static Serializer<PokemonCries> get serializer => _$pokemonCriesSerializer;
}