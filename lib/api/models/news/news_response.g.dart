// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NewsResponse> _$newsResponseSerializer =
    new _$NewsResponseSerializer();

class _$NewsResponseSerializer implements StructuredSerializer<NewsResponse> {
  @override
  final Iterable<Type> types = const [NewsResponse, _$NewsResponse];
  @override
  final String wireName = 'NewsResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, NewsResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'totalResults',
      serializers.serialize(object.totalResults,
          specifiedType: const FullType(int)),
      'articles',
      serializers.serialize(object.articles,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Article)])),
    ];
    Object? value;
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NewsResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NewsResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'totalResults':
          result.totalResults = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'articles':
          result.articles.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Article)]))!
              as BuiltList<Object?>);
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$NewsResponse extends NewsResponse {
  @override
  final String? status;
  @override
  final int totalResults;
  @override
  final BuiltList<Article> articles;
  @override
  final String? code;
  @override
  final String? message;

  factory _$NewsResponse([void Function(NewsResponseBuilder)? updates]) =>
      (new NewsResponseBuilder()..update(updates))._build();

  _$NewsResponse._(
      {this.status,
      required this.totalResults,
      required this.articles,
      this.code,
      this.message})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        totalResults, r'NewsResponse', 'totalResults');
    BuiltValueNullFieldError.checkNotNull(
        articles, r'NewsResponse', 'articles');
  }

  @override
  NewsResponse rebuild(void Function(NewsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NewsResponseBuilder toBuilder() => new NewsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsResponse &&
        status == other.status &&
        totalResults == other.totalResults &&
        articles == other.articles &&
        code == other.code &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, totalResults.hashCode);
    _$hash = $jc(_$hash, articles.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NewsResponse')
          ..add('status', status)
          ..add('totalResults', totalResults)
          ..add('articles', articles)
          ..add('code', code)
          ..add('message', message))
        .toString();
  }
}

class NewsResponseBuilder
    implements Builder<NewsResponse, NewsResponseBuilder> {
  _$NewsResponse? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  int? _totalResults;
  int? get totalResults => _$this._totalResults;
  set totalResults(int? totalResults) => _$this._totalResults = totalResults;

  ListBuilder<Article>? _articles;
  ListBuilder<Article> get articles =>
      _$this._articles ??= new ListBuilder<Article>();
  set articles(ListBuilder<Article>? articles) => _$this._articles = articles;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  NewsResponseBuilder();

  NewsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _totalResults = $v.totalResults;
      _articles = $v.articles.toBuilder();
      _code = $v.code;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NewsResponse;
  }

  @override
  void update(void Function(NewsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NewsResponse build() => _build();

  _$NewsResponse _build() {
    _$NewsResponse _$result;
    try {
      _$result = _$v ??
          new _$NewsResponse._(
              status: status,
              totalResults: BuiltValueNullFieldError.checkNotNull(
                  totalResults, r'NewsResponse', 'totalResults'),
              articles: articles.build(),
              code: code,
              message: message);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'articles';
        articles.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'NewsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
