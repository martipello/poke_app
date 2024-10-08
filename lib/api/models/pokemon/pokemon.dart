// ignore_for_file: non_constant_identifier_names
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'encounter.dart';
import 'pokemon_ability_holder.dart';
import 'pokemon_cries.dart';
import 'pokemon_form_with_version_group.dart';
import 'pokemon_move_holder.dart';
import 'pokemon_species_holder.dart';
import 'pokemon_stat.dart';
import 'type_data_holder.dart';

part 'pokemon.g.dart';

abstract class Pokemon implements Built<Pokemon, PokemonBuilder> {
  factory Pokemon([void Function(PokemonBuilder) updates]) = _$Pokemon;

  Pokemon._();

  int? get id;

  String? get name;

  double? get height;

  double? get weight;

  double? get pokemon_species_id;

  double? get base_experience;

  BuiltList<PokemonCries> get pokemon_v2_pokemoncries;//Uint8List.fromList(File(cries.first).readAsBytesSync())

  BuiltList<TypeDataHolder> get pokemon_v2_pokemontypes;

  BuiltList<PokemonAbilityHolder> get pokemon_v2_pokemonabilities;

  PokemonSpeciesHolder? get pokemon_v2_pokemonspecy;

  BuiltList<PokemonFormWithVersionGroup> get pokemon_v2_pokemonforms;

  BuiltList<PokemonStat> get pokemon_v2_pokemonstats;

  BuiltList<PokemonMoveHolder> get pokemon_v2_pokemonmoves;

  BuiltList<Encounter> get pokemon_v2_encounters;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Pokemon.serializer, this) as Map<String, dynamic>;
  }

  static Pokemon fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Pokemon.serializer, json)!;
  }

  static Serializer<Pokemon> get serializer => _$pokemonSerializer;
}
