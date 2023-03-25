// ignore_for_file: non_constant_identifier_names

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'evolution.dart';
import 'pokemon.dart';
import 'pokemon_resource.dart';
import 'pokemon_species.dart';

part 'pokemon_species_holder.g.dart';

abstract class PokemonSpeciesHolder implements Built<PokemonSpeciesHolder, PokemonSpeciesHolderBuilder> {
  factory PokemonSpeciesHolder([void Function(PokemonSpeciesHolderBuilder) updates]) = _$PokemonSpeciesHolder;
  PokemonSpeciesHolder._();

  int? get id;

  String? get name;

  double? get base_happiness;

  int? get capture_rate;

  int? get evolution_chain_id;

  int? get evolves_from_species_id;

  bool? get forms_switchable;

  int? get generation_id;

  bool? get is_baby;

  bool? get is_legendary;

  bool? get is_mythical;

  BuiltList<Evolution> get pokemon_v2_pokemonevolutions;

  BuiltList<PokemonSpecies> get pokemon_v2_pokemonspeciesnames;

  BuiltList<Pokemon> get pokemon_v2_pokemons;

  double? get hatch_counter;

  PokemonResource? get pokemon_v2_pokemonshape;

  PokemonResource? get pokemon_v2_pokemonhabitat;

  double? get gender_rate;

  BuiltList<PokemonResource> get pokemon_v2_pokemonegggroups;

  BuiltList<PokemonResource> get pokemon_v2_pokemonspeciesflavortexts;

  PokemonResource? get pokemon_v2_pokemoncolor;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(PokemonSpeciesHolder.serializer, this) as Map<String, dynamic>;
  }

  static PokemonSpeciesHolder fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(PokemonSpeciesHolder.serializer, json)!;
  }

  static Serializer<PokemonSpeciesHolder> get serializer => _$pokemonSpeciesHolderSerializer;
}
