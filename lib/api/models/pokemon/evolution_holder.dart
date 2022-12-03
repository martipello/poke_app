// ignore_for_file: non_constant_identifier_names
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'pokemon_species_holder.dart';

part 'evolution_holder.g.dart';

abstract class EvolutionHolder implements Built<EvolutionHolder, EvolutionHolderBuilder> {

  factory EvolutionHolder([void Function(EvolutionHolderBuilder) updates]) = _$EvolutionHolder;
  EvolutionHolder._();

  int? get id;

  BuiltList<PokemonSpeciesHolder> get pokemon_v2_pokemonspecies;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(EvolutionHolder.serializer, this) as Map<String, dynamic>;
  }

  static EvolutionHolder fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(EvolutionHolder.serializer, json)!;
  }

  static Serializer<EvolutionHolder> get serializer => _$evolutionHolderSerializer;
}