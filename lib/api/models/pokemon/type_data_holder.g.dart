// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_data_holder.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TypeDataHolder> _$typeDataHolderSerializer = new _$TypeDataHolderSerializer();

class _$TypeDataHolderSerializer implements StructuredSerializer<TypeDataHolder> {
  @override
  final Iterable<Type> types = const [TypeDataHolder, _$TypeDataHolder];
  @override
  final String wireName = 'TypeDataHolder';

  @override
  Iterable<Object?> serialize(Serializers serializers, TypeDataHolder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.pokemon_v2_type;
    if (value != null) {
      result
        ..add('pokemon_v2_type')
        ..add(serializers.serialize(value, specifiedType: const FullType(TypeData)));
    }
    return result;
  }

  @override
  TypeDataHolder deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TypeDataHolderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'pokemon_v2_type':
          result.pokemon_v2_type
              .replace(serializers.deserialize(value, specifiedType: const FullType(TypeData))! as TypeData);
          break;
      }
    }

    return result.build();
  }
}

class _$TypeDataHolder extends TypeDataHolder {
  @override
  final TypeData? pokemon_v2_type;

  factory _$TypeDataHolder([void Function(TypeDataHolderBuilder)? updates]) =>
      (new TypeDataHolderBuilder()..update(updates))._build();

  _$TypeDataHolder._({this.pokemon_v2_type}) : super._();

  @override
  TypeDataHolder rebuild(void Function(TypeDataHolderBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  TypeDataHolderBuilder toBuilder() => new TypeDataHolderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TypeDataHolder && pokemon_v2_type == other.pokemon_v2_type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, pokemon_v2_type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TypeDataHolder')..add('pokemon_v2_type', pokemon_v2_type)).toString();
  }
}

class TypeDataHolderBuilder implements Builder<TypeDataHolder, TypeDataHolderBuilder> {
  _$TypeDataHolder? _$v;

  TypeDataBuilder? _pokemon_v2_type;
  TypeDataBuilder get pokemon_v2_type => _$this._pokemon_v2_type ??= new TypeDataBuilder();
  set pokemon_v2_type(TypeDataBuilder? pokemon_v2_type) => _$this._pokemon_v2_type = pokemon_v2_type;

  TypeDataHolderBuilder();

  TypeDataHolderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pokemon_v2_type = $v.pokemon_v2_type?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TypeDataHolder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TypeDataHolder;
  }

  @override
  void update(void Function(TypeDataHolderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TypeDataHolder build() => _build();

  _$TypeDataHolder _build() {
    _$TypeDataHolder _$result;
    try {
      _$result = _$v ?? new _$TypeDataHolder._(pokemon_v2_type: _pokemon_v2_type?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon_v2_type';
        _pokemon_v2_type?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(r'TypeDataHolder', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
