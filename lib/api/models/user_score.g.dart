// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_score.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserScore> _$userScoreSerializer = new _$UserScoreSerializer();

class _$UserScoreSerializer implements StructuredSerializer<UserScore> {
  @override
  final Iterable<Type> types = const [UserScore, _$UserScore];
  @override
  final String wireName = 'UserScore';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserScore object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'alias',
      serializers.serialize(object.alias,
          specifiedType: const FullType(String)),
      'score',
      serializers.serialize(object.score, specifiedType: const FullType(int)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  UserScore deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserScoreBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'alias':
          result.alias = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'score':
          result.score = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$UserScore extends UserScore {
  @override
  final String name;
  @override
  final String alias;
  @override
  final int score;
  @override
  final int id;

  factory _$UserScore([void Function(UserScoreBuilder)? updates]) =>
      (new UserScoreBuilder()..update(updates))._build();

  _$UserScore._(
      {required this.name,
      required this.alias,
      required this.score,
      required this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'UserScore', 'name');
    BuiltValueNullFieldError.checkNotNull(alias, r'UserScore', 'alias');
    BuiltValueNullFieldError.checkNotNull(score, r'UserScore', 'score');
    BuiltValueNullFieldError.checkNotNull(id, r'UserScore', 'id');
  }

  @override
  UserScore rebuild(void Function(UserScoreBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserScoreBuilder toBuilder() => new UserScoreBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserScore &&
        name == other.name &&
        alias == other.alias &&
        score == other.score &&
        id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, alias.hashCode);
    _$hash = $jc(_$hash, score.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserScore')
          ..add('name', name)
          ..add('alias', alias)
          ..add('score', score)
          ..add('id', id))
        .toString();
  }
}

class UserScoreBuilder implements Builder<UserScore, UserScoreBuilder> {
  _$UserScore? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _alias;
  String? get alias => _$this._alias;
  set alias(String? alias) => _$this._alias = alias;

  int? _score;
  int? get score => _$this._score;
  set score(int? score) => _$this._score = score;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  UserScoreBuilder();

  UserScoreBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _alias = $v.alias;
      _score = $v.score;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserScore other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserScore;
  }

  @override
  void update(void Function(UserScoreBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserScore build() => _build();

  _$UserScore _build() {
    final _$result = _$v ??
        new _$UserScore._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'UserScore', 'name'),
            alias: BuiltValueNullFieldError.checkNotNull(
                alias, r'UserScore', 'alias'),
            score: BuiltValueNullFieldError.checkNotNull(
                score, r'UserScore', 'score'),
            id: BuiltValueNullFieldError.checkNotNull(id, r'UserScore', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
