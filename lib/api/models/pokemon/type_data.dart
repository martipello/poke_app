// ignore_for_file: non_constant_identifier_names
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'pokemon_resource.dart';
import 'type_efficacies.dart';

part 'type_data.g.dart';

abstract class TypeData implements Built<TypeData, TypeDataBuilder> {

  factory TypeData([void Function(TypeDataBuilder) updates]) = _$TypeData;
  TypeData._();

  int? get id;

  String? get name;

  PokemonResource? get pokemon_v2_movedamageclass;

  BuiltList<TypeEfficacies> get pokemonV2TypeefficaciesByTargetTypeId;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(TypeData.serializer, this) as Map<String, dynamic>;
  }

  static TypeData fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(TypeData.serializer, json)!;
  }

  static Serializer<TypeData> get serializer => _$typeDataSerializer;
}