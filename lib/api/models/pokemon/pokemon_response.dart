import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'pokemon.dart';

part 'pokemon_response.g.dart';

abstract class PokemonResponse implements Built<PokemonResponse, PokemonResponseBuilder> {


  factory PokemonResponse([void Function(PokemonResponseBuilder) updates]) = _$PokemonResponse;

  PokemonResponse._();

  BuiltList<Pokemon> get pokemon_v2_pokemon;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(PokemonResponse.serializer, this) as Map<String, dynamic>;
  }

  static PokemonResponse fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(PokemonResponse.serializer, json)!;
  }

  static Serializer<PokemonResponse> get serializer => _$pokemonResponseSerializer;
}