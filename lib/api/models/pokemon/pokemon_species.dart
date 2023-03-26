import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';

part 'pokemon_species.g.dart';

abstract class PokemonSpecies implements Built<PokemonSpecies, PokemonSpeciesBuilder> {
  factory PokemonSpecies([void Function(PokemonSpeciesBuilder) updates]) = _$PokemonSpecies;
  PokemonSpecies._();

  String? get genus;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(PokemonSpecies.serializer, this) as Map<String, dynamic>;
  }

  static PokemonSpecies fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(PokemonSpecies.serializer, json)!;
  }

  static Serializer<PokemonSpecies> get serializer => _$pokemonSpeciesSerializer;
}
