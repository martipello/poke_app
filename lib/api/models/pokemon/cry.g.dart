// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cry.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Cry> _$crySerializer = new _$CrySerializer();

class _$CrySerializer implements StructuredSerializer<Cry> {
  @override
  final Iterable<Type> types = const [Cry, _$Cry];
  @override
  final String wireName = 'Cry';

  @override
  Iterable<Object?> serialize(Serializers serializers, Cry object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.latest;
    if (value != null) {
      result
        ..add('latest')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.legacy;
    if (value != null) {
      result
        ..add('legacy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Cry deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'latest':
          result.latest = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'legacy':
          result.legacy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Cry extends Cry {
  @override
  final String? latest;
  @override
  final String? legacy;

  factory _$Cry([void Function(CryBuilder)? updates]) =>
      (new CryBuilder()..update(updates))._build();

  _$Cry._({this.latest, this.legacy}) : super._();

  @override
  Cry rebuild(void Function(CryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CryBuilder toBuilder() => new CryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Cry && latest == other.latest && legacy == other.legacy;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, latest.hashCode);
    _$hash = $jc(_$hash, legacy.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Cry')
          ..add('latest', latest)
          ..add('legacy', legacy))
        .toString();
  }
}

class CryBuilder implements Builder<Cry, CryBuilder> {
  _$Cry? _$v;

  String? _latest;
  String? get latest => _$this._latest;
  set latest(String? latest) => _$this._latest = latest;

  String? _legacy;
  String? get legacy => _$this._legacy;
  set legacy(String? legacy) => _$this._legacy = legacy;

  CryBuilder();

  CryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _latest = $v.latest;
      _legacy = $v.legacy;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Cry other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Cry;
  }

  @override
  void update(void Function(CryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Cry build() => _build();

  _$Cry _build() {
    final _$result = _$v ?? new _$Cry._(latest: latest, legacy: legacy);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
