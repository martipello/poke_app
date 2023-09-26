import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'article.dart';

part 'news_response.g.dart';

abstract class NewsResponse implements Built<NewsResponse, NewsResponseBuilder> {

  factory NewsResponse([void Function(NewsResponseBuilder) updates]) = _$NewsResponse;
  NewsResponse._();
  // If the request was successful or not. Options: ok, error. In the case of error a code and message property will be populated.
  String? get status;

  int get totalResults;

  BuiltList<Article> get articles;

  String? get code;

  String? get message;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(NewsResponse.serializer, this) as Map<String, dynamic>;
  }

  static NewsResponse fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(NewsResponse.serializer, json)!;
  }

  static Serializer<NewsResponse> get serializer => _$newsResponseSerializer;
}