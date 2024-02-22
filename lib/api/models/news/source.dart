import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';

part 'source.g.dart';

abstract class Source implements Built<Source, SourceBuilder> {

  factory Source([void Function(SourceBuilder) updates]) = _$Source;
  Source._();

  String? get Id;

  String? get Name;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Source.serializer, this) as Map<String, dynamic>;
  }

  static Source fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Source.serializer, json)!;
  }

  static Serializer<Source> get serializer => _$sourceSerializer;
}