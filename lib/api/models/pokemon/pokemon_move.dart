// ignore_for_file: non_constant_identifier_names
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'machine.dart';
import 'move_metum.dart';
import 'pokemon_resource.dart';
import 'type_data.dart';

part 'pokemon_move.g.dart';

abstract class PokemonMove implements Built<PokemonMove, PokemonMoveBuilder> {
  factory PokemonMove([void Function(PokemonMoveBuilder) updates]) = _$PokemonMove;

  PokemonMove._();

  int? get id;

  int? get accuracy;

  int? get move_effect_chance;

  String? get name;

  int? get priority;

  int? get pp;

  int? get power;

  int? get super_contest_effect_id;

  int? get type_id;

  PokemonResource? get pokemon_v2_generation;

  BuiltList<PokemonResource> get pokemon_v2_moveflavortexts;

  TypeData? get pokemon_v2_type;

  BuiltList<Machine> get machines;

  MoveMetum? get pokemon_v2_movemetum;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(PokemonMove.serializer, this) as Map<String, dynamic>;
  }

  static PokemonMove fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(PokemonMove.serializer, json)!;
  }

  static Serializer<PokemonMove> get serializer => _$pokemonMoveSerializer;
}
