import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'pokemon_type.dart';

part 'pokemon.g.dart';

abstract class Pokemon implements Built<Pokemon, PokemonBuilder> {


  factory Pokemon([void Function(PokemonBuilder) updates]) = _$Pokemon;
  Pokemon._();

  int get id;

  String get name;

  BuiltList<PokemonType> get pokemon_v2_pokemontypes;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Pokemon.serializer, this) as Map<String, dynamic>;
  }

  static Pokemon fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Pokemon.serializer, json)!;
  }

  static Serializer<Pokemon> get serializer => _$pokemonSerializer;
}