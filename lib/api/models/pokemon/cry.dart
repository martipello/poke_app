import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';

part 'cry.g.dart';

abstract class Cry implements Built<Cry, CryBuilder> {

  factory Cry([void Function(CryBuilder) updates]) = _$Cry;
  Cry._();

  String? get latest;

  String? get legacy;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Cry.serializer, this) as Map<String, dynamic>;
  }

  static Cry fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Cry.serializer, json)!;
  }

  static Serializer<Cry> get serializer => _$crySerializer;
}