import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'source.dart';

part 'article.g.dart';

abstract class Article implements Built<Article, ArticleBuilder> {
  factory Article([void Function(ArticleBuilder) updates]) = _$Article;

  Article._();

  String? get title;

  String? get author;

  String? get description;

  Source? get source;

  DateTime? get publishedAt;

  String? get url;

  String? get urlToImage;

  // The unformatted content of the article, where available. This is truncated to 200 chars.
  String? get content;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Article.serializer, this) as Map<String, dynamic>;
  }

  static Article fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Article.serializer, json)!;
  }

  static Serializer<Article> get serializer => _$articleSerializer;
}
