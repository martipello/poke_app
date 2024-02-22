// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_cries.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PokemonCries> _$pokemonCriesSerializer =
    new _$PokemonCriesSerializer();

class _$PokemonCriesSerializer implements StructuredSerializer<PokemonCries> {
  @override
  final Iterable<Type> types = const [PokemonCries, _$PokemonCries];
  @override
  final String wireName = 'PokemonCries';

  @override
  Iterable<Object?> serialize(Serializers serializers, PokemonCries object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.cries;
    if (value != null) {
      result
        ..add('cries')
        ..add(serializers.serialize(value, specifiedType: const FullType(Cry)));
    }
    return result;
  }

  @override
  PokemonCries deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonCriesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'cries':
          result.cries.replace(serializers.deserialize(value,
              specifiedType: const FullType(Cry))! as Cry);
          break;
      }
    }

    return result.build();
  }
}

class _$PokemonCries extends PokemonCries {
  @override
  final Cry? cries;

  factory _$PokemonCries([void Function(PokemonCriesBuilder)? updates]) =>
      (new PokemonCriesBuilder()..update(updates))._build();

  _$PokemonCries._({this.cries}) : super._();

  @override
  PokemonCries rebuild(void Function(PokemonCriesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonCriesBuilder toBuilder() => new PokemonCriesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonCries && cries == other.cries;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cries.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PokemonCries')..add('cries', cries))
        .toString();
  }
}

class PokemonCriesBuilder
    implements Builder<PokemonCries, PokemonCriesBuilder> {
  _$PokemonCries? _$v;

  CryBuilder? _cries;
  CryBuilder get cries => _$this._cries ??= new CryBuilder();
  set cries(CryBuilder? cries) => _$this._cries = cries;

  PokemonCriesBuilder();

  PokemonCriesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cries = $v.cries?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PokemonCries other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PokemonCries;
  }

  @override
  void update(void Function(PokemonCriesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PokemonCries build() => _build();

  _$PokemonCries _build() {
    _$PokemonCries _$result;
    try {
      _$result = _$v ?? new _$PokemonCries._(cries: _cries?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cries';
        _cries?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PokemonCries', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
