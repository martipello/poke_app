// ignore_for_file: non_constant_identifier_names
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'pokemon_resource.dart';

part 'move_damage_class.g.dart';

abstract class MoveDamageClass implements Built<MoveDamageClass, MoveDamageClassBuilder> {

  factory MoveDamageClass([void Function(MoveDamageClassBuilder) updates]) = _$MoveDamageClass;
  MoveDamageClass._();

  BuiltList<PokemonResource>? get pokemon_v2_movedamageclassdescriptions;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(MoveDamageClass.serializer, this) as Map<String, dynamic>;
  }

  static MoveDamageClass fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(MoveDamageClass.serializer, json)!;
  }

  static Serializer<MoveDamageClass> get serializer => _$moveDamageClassSerializer;
}