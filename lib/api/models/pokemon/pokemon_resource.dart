// ignore_for_file: non_constant_identifier_names

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'move_learn_method.dart';
import 'pokemon_ability.dart';

part 'pokemon_resource.g.dart';

abstract class PokemonResource implements Built<PokemonResource, PokemonResourceBuilder> {
  factory PokemonResource([void Function(PokemonResourceBuilder) updates]) = _$PokemonResource;
  PokemonResource._();

  String? get name;

  String? get pokemon_name;

  String? get description;

  int? get id;

  String? get flavor_text;

  int? get version_id;

  int? get pokemon_species_id;

  String? get short_effect;

  PokemonResource? get pokemon_v2_version;

  PokemonResource? get pokemon_v2_region;

  PokemonResource? get pokemon_v2_versiongroup;

  PokemonResource? get pokemon_v2_egggroup;

  PokemonResource? get pokemon_v2_movedamageclass;

  MoveLearnMethod? get pokemon_v2_movelearnmethod;

  BuiltList<PokemonResource> get pokemon_v2_movedamageclassdescriptions;

  BuiltList<PokemonResource> get pokemon_v2_evolutiontriggernames;

  BuiltList<PokemonResource> get pokemon_v2_pokemonshapenames;

  BuiltList<PokemonResource> get pokemon_v2_pokemonhabitatnames;

  BuiltList<PokemonResource> get pokemon_v2_locationnames;

  PokemonAbility? get pokemon_v2_ability;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(PokemonResource.serializer, this) as Map<String, dynamic>;
  }

  static PokemonResource fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(PokemonResource.serializer, json)!;
  }

  static Serializer<PokemonResource> get serializer => _$pokemonResourceSerializer;
}
