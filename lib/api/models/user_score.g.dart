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
      'correctScore',
      serializers.serialize(object.correctScore,
          specifiedType: const FullType(int)),
      'incorrectScore',
      serializers.serialize(object.incorrectScore,
          specifiedType: const FullType(int)),
      'skippedScore',
      serializers.serialize(object.skippedScore,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.alias;
    if (value != null) {
      result
        ..add('alias')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdDate;
    if (value != null) {
      result
        ..add('createdDate')
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
              specifiedType: const FullType(String)) as String?;
          break;
        case 'alias':
          result.alias = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'correctScore':
          result.correctScore = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'incorrectScore':
          result.incorrectScore = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'skippedScore':
          result.skippedScore = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'createdDate':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
      }
    }

    return result.build();
  }
}

class _$UserScore extends UserScore {
  @override
  final String? name;
  @override
  final String? alias;
  @override
  final int correctScore;
  @override
  final int incorrectScore;
  @override
  final int skippedScore;
  @override
  final String? uid;
  @override
  final DateTime? createdDate;

  factory _$UserScore([void Function(UserScoreBuilder)? updates]) =>
      (new UserScoreBuilder()..update(updates))._build();

  _$UserScore._(
      {this.name,
      this.alias,
      required this.correctScore,
      required this.incorrectScore,
      required this.skippedScore,
      this.uid,
      this.createdDate})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        correctScore, r'UserScore', 'correctScore');
    BuiltValueNullFieldError.checkNotNull(
        incorrectScore, r'UserScore', 'incorrectScore');
    BuiltValueNullFieldError.checkNotNull(
        skippedScore, r'UserScore', 'skippedScore');
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
        correctScore == other.correctScore &&
        incorrectScore == other.incorrectScore &&
        skippedScore == other.skippedScore &&
        uid == other.uid &&
        createdDate == other.createdDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, alias.hashCode);
    _$hash = $jc(_$hash, correctScore.hashCode);
    _$hash = $jc(_$hash, incorrectScore.hashCode);
    _$hash = $jc(_$hash, skippedScore.hashCode);
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, createdDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserScore')
          ..add('name', name)
          ..add('alias', alias)
          ..add('correctScore', correctScore)
          ..add('incorrectScore', incorrectScore)
          ..add('skippedScore', skippedScore)
          ..add('uid', uid)
          ..add('createdDate', createdDate))
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

  int? _correctScore;
  int? get correctScore => _$this._correctScore;
  set correctScore(int? correctScore) => _$this._correctScore = correctScore;

  int? _incorrectScore;
  int? get incorrectScore => _$this._incorrectScore;
  set incorrectScore(int? incorrectScore) =>
      _$this._incorrectScore = incorrectScore;

  int? _skippedScore;
  int? get skippedScore => _$this._skippedScore;
  set skippedScore(int? skippedScore) => _$this._skippedScore = skippedScore;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdDate;
  DateTime? get createdDate => _$this._createdDate;
  set createdDate(DateTime? createdDate) => _$this._createdDate = createdDate;

  UserScoreBuilder();

  UserScoreBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _alias = $v.alias;
      _correctScore = $v.correctScore;
      _incorrectScore = $v.incorrectScore;
      _skippedScore = $v.skippedScore;
      _uid = $v.uid;
      _createdDate = $v.createdDate;
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
            name: name,
            alias: alias,
            correctScore: BuiltValueNullFieldError.checkNotNull(
                correctScore, r'UserScore', 'correctScore'),
            incorrectScore: BuiltValueNullFieldError.checkNotNull(
                incorrectScore, r'UserScore', 'incorrectScore'),
            skippedScore: BuiltValueNullFieldError.checkNotNull(
                skippedScore, r'UserScore', 'skippedScore'),
            uid: uid,
            createdDate: createdDate);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
