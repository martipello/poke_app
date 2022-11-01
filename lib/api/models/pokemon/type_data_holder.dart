// ignore_for_file: non_constant_identifier_names
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'type_data.dart';

part 'type_data_holder.g.dart';

abstract class TypeDataHolder implements Built<TypeDataHolder, TypeDataHolderBuilder> {

  factory TypeDataHolder([void Function(TypeDataHolderBuilder) updates]) = _$TypeDataHolder;
  TypeDataHolder._();

  TypeData? get pokemon_v2_type;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(TypeDataHolder.serializer, this) as Map<String, dynamic>;
  }

  static TypeDataHolder fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(TypeDataHolder.serializer, json)!;
  }

  static Serializer<TypeDataHolder> get serializer => _$typeDataHolderSerializer;
}