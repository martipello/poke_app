import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';

part 'type_data.g.dart';

abstract class TypeData implements Built<TypeData, TypeDataBuilder> {

  factory TypeData([void Function(TypeDataBuilder) updates]) = _$TypeData;
  TypeData._();

  int? get id;

  String? get name;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(TypeData.serializer, this) as Map<String, dynamic>;
  }

  static TypeData fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(TypeData.serializer, json)!;
  }

  static Serializer<TypeData> get serializer => _$typeDataSerializer;
}