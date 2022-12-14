// ignore_for_file: non_constant_identifier_names
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'pokemon_form_holder.dart';
import 'pokemon_resource.dart';

part 'pokemon_form_with_version_group.g.dart';

abstract class PokemonFormWithVersionGroup implements Built<PokemonFormWithVersionGroup, PokemonFormWithVersionGroupBuilder> {

  factory PokemonFormWithVersionGroup([void Function(PokemonFormWithVersionGroupBuilder) updates]) = _$PokemonFormWithVersionGroup;
  PokemonFormWithVersionGroup._();

  PokemonResource? get pokemon_v2_versiongroup;

  BuiltList<PokemonFormHolder> get pokemon_v2_pokemonformnames;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(PokemonFormWithVersionGroup.serializer, this) as Map<String, dynamic>;
  }

  static PokemonFormWithVersionGroup fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(PokemonFormWithVersionGroup.serializer, json)!;
  }

  static Serializer<PokemonFormWithVersionGroup> get serializer => _$pokemonFormWithVersionGroupSerializer;
}
