import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';

part 'stat.g.dart';

abstract class Stat implements Built<Stat, StatBuilder> {

  factory Stat([void Function(StatBuilder) updates]) = _$Stat;
  Stat._();

  String? get name;

  int? get move_damage_class_id;

  bool? get is_battle_only;

  int? get game_index;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Stat.serializer, this) as Map<String, dynamic>;
  }

  static Stat fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Stat.serializer, json)!;
  }

  static Serializer<Stat> get serializer => _$statSerializer;
}