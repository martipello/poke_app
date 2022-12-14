import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';

part 'sprite_response.g.dart';

abstract class SpriteResponse implements Built<SpriteResponse, SpriteResponseBuilder> {

  factory SpriteResponse([void Function(SpriteResponseBuilder) updates]) = _$SpriteResponse;

  SpriteResponse._();

  String? get sprites;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(SpriteResponse.serializer, this) as Map<String, dynamic>;
  }

  static SpriteResponse fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(SpriteResponse.serializer, json)!;
  }

  static Serializer<SpriteResponse> get serializer => _$spriteResponseSerializer;
}