import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';

part 'pokemon_type.g.dart';

abstract class PokemonType implements Built<PokemonType, PokemonTypeBuilder> {


  factory PokemonType([void Function(PokemonTypeBuilder) updates]) = _$PokemonType;
  PokemonType._();

  int get type_id;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(PokemonType.serializer, this) as Map<String, dynamic>;
  }

  static PokemonType fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(PokemonType.serializer, json)!;
  }

  static Serializer<PokemonType> get serializer => _$pokemonTypeSerializer;
}