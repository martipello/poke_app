// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_efficacies.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TypeEfficacies> _$typeEfficaciesSerializer =
    new _$TypeEfficaciesSerializer();

class _$TypeEfficaciesSerializer
    implements StructuredSerializer<TypeEfficacies> {
  @override
  final Iterable<Type> types = const [TypeEfficacies, _$TypeEfficacies];
  @override
  final String wireName = 'TypeEfficacies';

  @override
  Iterable<Object?> serialize(Serializers serializers, TypeEfficacies object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.damage_factor;
    if (value != null) {
      result
        ..add('damage_factor')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.damage_type_id;
    if (value != null) {
      result
        ..add('damage_type_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.target_type_id;
    if (value != null) {
      result
        ..add('target_type_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pokemonV2TypeByTargetTypeId;
    if (value != null) {
      result
        ..add('pokemonV2TypeByTargetTypeId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonResource)));
    }
    value = object.pokemon_v2_type;
    if (value != null) {
      result
        ..add('pokemon_v2_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonResource)));
    }
    return result;
  }

  @override
  TypeEfficacies deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TypeEfficaciesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'damage_factor':
          result.damage_factor = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'damage_type_id':
          result.damage_type_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'target_type_id':
          result.target_type_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'pokemonV2TypeByTargetTypeId':
          result.pokemonV2TypeByTargetTypeId.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(PokemonResource))!
              as PokemonResource);
          break;
        case 'pokemon_v2_type':
          result.pokemon_v2_type.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PokemonResource))!
              as PokemonResource);
          break;
      }
    }

    return result.build();
  }
}

class _$TypeEfficacies extends TypeEfficacies {
  @override
  final double? damage_factor;
  @override
  final int? damage_type_id;
  @override
  final int? target_type_id;
  @override
  final PokemonResource? pokemonV2TypeByTargetTypeId;
  @override
  final PokemonResource? pokemon_v2_type;

  factory _$TypeEfficacies([void Function(TypeEfficaciesBuilder)? updates]) =>
      (new TypeEfficaciesBuilder()..update(updates))._build();

  _$TypeEfficacies._(
      {this.damage_factor,
      this.damage_type_id,
      this.target_type_id,
      this.pokemonV2TypeByTargetTypeId,
      this.pokemon_v2_type})
      : super._();

  @override
  TypeEfficacies rebuild(void Function(TypeEfficaciesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TypeEfficaciesBuilder toBuilder() =>
      new TypeEfficaciesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TypeEfficacies &&
        damage_factor == other.damage_factor &&
        damage_type_id == other.damage_type_id &&
        target_type_id == other.target_type_id &&
        pokemonV2TypeByTargetTypeId == other.pokemonV2TypeByTargetTypeId &&
        pokemon_v2_type == other.pokemon_v2_type;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, damage_factor.hashCode), damage_type_id.hashCode),
                target_type_id.hashCode),
            pokemonV2TypeByTargetTypeId.hashCode),
        pokemon_v2_type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TypeEfficacies')
          ..add('damage_factor', damage_factor)
          ..add('damage_type_id', damage_type_id)
          ..add('target_type_id', target_type_id)
          ..add('pokemonV2TypeByTargetTypeId', pokemonV2TypeByTargetTypeId)
          ..add('pokemon_v2_type', pokemon_v2_type))
        .toString();
  }
}

class TypeEfficaciesBuilder
    implements Builder<TypeEfficacies, TypeEfficaciesBuilder> {
  _$TypeEfficacies? _$v;

  double? _damage_factor;
  double? get damage_factor => _$this._damage_factor;
  set damage_factor(double? damage_factor) =>
      _$this._damage_factor = damage_factor;

  int? _damage_type_id;
  int? get damage_type_id => _$this._damage_type_id;
  set damage_type_id(int? damage_type_id) =>
      _$this._damage_type_id = damage_type_id;

  int? _target_type_id;
  int? get target_type_id => _$this._target_type_id;
  set target_type_id(int? target_type_id) =>
      _$this._target_type_id = target_type_id;

  PokemonResourceBuilder? _pokemonV2TypeByTargetTypeId;
  PokemonResourceBuilder get pokemonV2TypeByTargetTypeId =>
      _$this._pokemonV2TypeByTargetTypeId ??= new PokemonResourceBuilder();
  set pokemonV2TypeByTargetTypeId(
          PokemonResourceBuilder? pokemonV2TypeByTargetTypeId) =>
      _$this._pokemonV2TypeByTargetTypeId = pokemonV2TypeByTargetTypeId;

  PokemonResourceBuilder? _pokemon_v2_type;
  PokemonResourceBuilder get pokemon_v2_type =>
      _$this._pokemon_v2_type ??= new PokemonResourceBuilder();
  set pokemon_v2_type(PokemonResourceBuilder? pokemon_v2_type) =>
      _$this._pokemon_v2_type = pokemon_v2_type;

  TypeEfficaciesBuilder();

  TypeEfficaciesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _damage_factor = $v.damage_factor;
      _damage_type_id = $v.damage_type_id;
      _target_type_id = $v.target_type_id;
      _pokemonV2TypeByTargetTypeId =
          $v.pokemonV2TypeByTargetTypeId?.toBuilder();
      _pokemon_v2_type = $v.pokemon_v2_type?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TypeEfficacies other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TypeEfficacies;
  }

  @override
  void update(void Function(TypeEfficaciesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TypeEfficacies build() => _build();

  _$TypeEfficacies _build() {
    _$TypeEfficacies _$result;
    try {
      _$result = _$v ??
          new _$TypeEfficacies._(
              damage_factor: damage_factor,
              damage_type_id: damage_type_id,
              target_type_id: target_type_id,
              pokemonV2TypeByTargetTypeId:
                  _pokemonV2TypeByTargetTypeId?.build(),
              pokemon_v2_type: _pokemon_v2_type?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemonV2TypeByTargetTypeId';
        _pokemonV2TypeByTargetTypeId?.build();
        _$failedField = 'pokemon_v2_type';
        _pokemon_v2_type?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TypeEfficacies', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
