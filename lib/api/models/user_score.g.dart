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
      'uid',
      serializers.serialize(object.uid, specifiedType: const FullType(String)),
      'createdDate',
      serializers.serialize(object.createdDate,
          specifiedType: const FullType(DateTime)),
    ];
    Object? value;
    value = object.updatedDate;
    if (value != null) {
      result
        ..add('updatedDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
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
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'createdDate':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
        case 'updatedDate':
          result.updatedDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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
  final String uid;
  @override
  final DateTime createdDate;
  @override
  final DateTime? updatedDate;

  factory _$UserScore([void Function(UserScoreBuilder)? updates]) =>
      (new UserScoreBuilder()..update(updates))._build();

  _$UserScore._(
      {required this.name,
      required this.alias,
      required this.score,
      required this.uid,
      required this.createdDate,
      this.updatedDate})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'UserScore', 'name');
    BuiltValueNullFieldError.checkNotNull(alias, r'UserScore', 'alias');
    BuiltValueNullFieldError.checkNotNull(score, r'UserScore', 'score');
    BuiltValueNullFieldError.checkNotNull(uid, r'UserScore', 'uid');
    BuiltValueNullFieldError.checkNotNull(
        createdDate, r'UserScore', 'createdDate');
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
        uid == other.uid &&
        createdDate == other.createdDate &&
        updatedDate == other.updatedDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, alias.hashCode);
    _$hash = $jc(_$hash, score.hashCode);
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, createdDate.hashCode);
    _$hash = $jc(_$hash, updatedDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserScore')
          ..add('name', name)
          ..add('alias', alias)
          ..add('score', score)
          ..add('uid', uid)
          ..add('createdDate', createdDate)
          ..add('updatedDate', updatedDate))
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

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdDate;
  DateTime? get createdDate => _$this._createdDate;
  set createdDate(DateTime? createdDate) => _$this._createdDate = createdDate;

  DateTime? _updatedDate;
  DateTime? get updatedDate => _$this._updatedDate;
  set updatedDate(DateTime? updatedDate) => _$this._updatedDate = updatedDate;

  UserScoreBuilder();

  UserScoreBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _alias = $v.alias;
      _score = $v.score;
      _uid = $v.uid;
      _createdDate = $v.createdDate;
      _updatedDate = $v.updatedDate;
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
            uid:
                BuiltValueNullFieldError.checkNotNull(uid, r'UserScore', 'uid'),
            createdDate: BuiltValueNullFieldError.checkNotNull(
                createdDate, r'UserScore', 'createdDate'),
            updatedDate: updatedDate);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
