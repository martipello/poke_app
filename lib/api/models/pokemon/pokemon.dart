// ignore_for_file: non_constant_identifier_names
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:poke_app/api/models/pokemon/pokemon_species_holder.dart';

import '../../serializers/serializers.dart';
import 'sprite_response.dart';
import 'type_data_holder.dart';

part 'pokemon.g.dart';

abstract class Pokemon implements Built<Pokemon, PokemonBuilder> {


  factory Pokemon([void Function(PokemonBuilder) updates]) = _$Pokemon;
  Pokemon._();

  int? get id;

  String? get name;

  double? get height;

  double? get weight;

  BuiltList<SpriteResponse> get pokemon_v2_pokemonsprites;

  BuiltList<TypeDataHolder> get pokemon_v2_pokemontypes;

  PokemonSpeciesHolder? get pokemon_v2_pokemonspecy;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Pokemon.serializer, this) as Map<String, dynamic>;
  }

  static Pokemon fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Pokemon.serializer, json)!;
  }

  static Serializer<Pokemon> get serializer => _$pokemonSerializer;
}