// ignore_for_file: non_constant_identifier_names
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'pokemon_resource.dart';

part 'move_metum.g.dart';

abstract class MoveMetum implements Built<MoveMetum, MoveMetumBuilder> {
  factory MoveMetum([void Function(MoveMetumBuilder) updates]) = _$MoveMetum;

  MoveMetum._();

  int? get crit_rate;

  int? get ailment_chance;

  int? get flinch_chance;

  int? get drain;

  int? get max_hits;

  int? get max_turns;

  int? get min_hits;

  int? get min_turns;

  int? get stat_chance;

  PokemonResource? get pokemon_v2_movemetaailment;

  PokemonResource? get pokemon_v2_movemetacategory;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(MoveMetum.serializer, this) as Map<String, dynamic>;
  }

  static MoveMetum fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(MoveMetum.serializer, json)!;
  }

  static Serializer<MoveMetum> get serializer => _$moveMetumSerializer;
}
