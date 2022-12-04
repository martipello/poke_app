// ignore_for_file: non_constant_identifier_names
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'move_learn_method.dart';
import 'pokemon_move.dart';

part 'pokemon_move_holder.g.dart';

abstract class PokemonMoveHolder implements Built<PokemonMoveHolder, PokemonMoveHolderBuilder> {

  factory PokemonMoveHolder([void Function(PokemonMoveHolderBuilder) updates]) = _$PokemonMoveHolder;
  PokemonMoveHolder._();

  int? get id;

  int? get level;

  PokemonMove? get pokemon_v2_move;

  MoveLearnMethod? get pokemon_v2_movelearnmethod;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(PokemonMoveHolder.serializer, this) as Map<String, dynamic>;
  }

  static PokemonMoveHolder fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(PokemonMoveHolder.serializer, json)!;
  }

  static Serializer<PokemonMoveHolder> get serializer => _$pokemonMoveHolderSerializer;
}