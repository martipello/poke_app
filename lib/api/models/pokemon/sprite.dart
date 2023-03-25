// ignore_for_file: non_constant_identifier_names
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';

part 'sprite.g.dart';

abstract class Sprite implements Built<Sprite, SpriteBuilder> {
  factory Sprite([void Function(SpriteBuilder) updates]) = _$Sprite;
  Sprite._();

  String? get front_default;

  String? get front_shiny;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Sprite.serializer, this) as Map<String, dynamic>;
  }

  static Sprite fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Sprite.serializer, json)!;
  }

  static Serializer<Sprite> get serializer => _$spriteSerializer;
}
