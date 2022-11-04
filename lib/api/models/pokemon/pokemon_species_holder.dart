import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'pokemon_species.dart';

part 'pokemon_species_holder.g.dart';

abstract class PokemonSpeciesHolder implements Built<PokemonSpeciesHolder, PokemonSpeciesHolderBuilder> {

  factory PokemonSpeciesHolder([void Function(PokemonSpeciesHolderBuilder) updates]) = _$PokemonSpeciesHolder;
  PokemonSpeciesHolder._();

  int? get generation_id;

  BuiltList<PokemonSpecies> get pokemon_v2_pokemonspeciesnames;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(PokemonSpeciesHolder.serializer, this) as Map<String, dynamic>;
  }

  static PokemonSpeciesHolder fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(PokemonSpeciesHolder.serializer, json)!;
  }

  static Serializer<PokemonSpeciesHolder> get serializer => _$pokemonSpeciesHolderSerializer;
}