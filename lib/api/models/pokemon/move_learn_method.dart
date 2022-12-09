// ignore_for_file: non_constant_identifier_names
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'pokemon_resource.dart';

part 'move_learn_method.g.dart';

abstract class MoveLearnMethod implements Built<MoveLearnMethod, MoveLearnMethodBuilder> {

  factory MoveLearnMethod([void Function(MoveLearnMethodBuilder) updates]) = _$MoveLearnMethod;
  MoveLearnMethod._();

  String? get name;

  BuiltList<PokemonResource> get pokemon_v2_versiongroupmovelearnmethods;

  BuiltList<PokemonResource> get pokemon_v2_movelearnmethoddescriptions;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(MoveLearnMethod.serializer, this) as Map<String, dynamic>;
  }

  static MoveLearnMethod fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(MoveLearnMethod.serializer, json)!;
  }

  static Serializer<MoveLearnMethod> get serializer => _$moveLearnMethodSerializer;
}