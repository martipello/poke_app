// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_ability_holder.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PokemonAbilityHolder> _$pokemonAbilityHolderSerializer =
    new _$PokemonAbilityHolderSerializer();

class _$PokemonAbilityHolderSerializer
    implements StructuredSerializer<PokemonAbilityHolder> {
  @override
  final Iterable<Type> types = const [
    PokemonAbilityHolder,
    _$PokemonAbilityHolder
  ];
  @override
  final String wireName = 'PokemonAbilityHolder';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PokemonAbilityHolder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.is_hidden;
    if (value != null) {
      result
        ..add('is_hidden')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.pokemon_v2_ability;
    if (value != null) {
      result
        ..add('pokemon_v2_ability')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonAbility)));
    }
    return result;
  }

  @override
  PokemonAbilityHolder deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonAbilityHolderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'is_hidden':
          result.is_hidden = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'pokemon_v2_ability':
          result.pokemon_v2_ability.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PokemonAbility))!
              as PokemonAbility);
          break;
      }
    }

    return result.build();
  }
}

class _$PokemonAbilityHolder extends PokemonAbilityHolder {
  @override
  final bool? is_hidden;
  @override
  final PokemonAbility? pokemon_v2_ability;

  factory _$PokemonAbilityHolder(
          [void Function(PokemonAbilityHolderBuilder)? updates]) =>
      (new PokemonAbilityHolderBuilder()..update(updates))._build();

  _$PokemonAbilityHolder._({this.is_hidden, this.pokemon_v2_ability})
      : super._();

  @override
  PokemonAbilityHolder rebuild(
          void Function(PokemonAbilityHolderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonAbilityHolderBuilder toBuilder() =>
      new PokemonAbilityHolderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonAbilityHolder &&
        is_hidden == other.is_hidden &&
        pokemon_v2_ability == other.pokemon_v2_ability;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, is_hidden.hashCode), pokemon_v2_ability.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PokemonAbilityHolder')
          ..add('is_hidden', is_hidden)
          ..add('pokemon_v2_ability', pokemon_v2_ability))
        .toString();
  }
}

class PokemonAbilityHolderBuilder
    implements Builder<PokemonAbilityHolder, PokemonAbilityHolderBuilder> {
  _$PokemonAbilityHolder? _$v;

  bool? _is_hidden;
  bool? get is_hidden => _$this._is_hidden;
  set is_hidden(bool? is_hidden) => _$this._is_hidden = is_hidden;

  PokemonAbilityBuilder? _pokemon_v2_ability;
  PokemonAbilityBuilder get pokemon_v2_ability =>
      _$this._pokemon_v2_ability ??= new PokemonAbilityBuilder();
  set pokemon_v2_ability(PokemonAbilityBuilder? pokemon_v2_ability) =>
      _$this._pokemon_v2_ability = pokemon_v2_ability;

  PokemonAbilityHolderBuilder();

  PokemonAbilityHolderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _is_hidden = $v.is_hidden;
      _pokemon_v2_ability = $v.pokemon_v2_ability?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PokemonAbilityHolder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PokemonAbilityHolder;
  }

  @override
  void update(void Function(PokemonAbilityHolderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PokemonAbilityHolder build() => _build();

  _$PokemonAbilityHolder _build() {
    _$PokemonAbilityHolder _$result;
    try {
      _$result = _$v ??
          new _$PokemonAbilityHolder._(
              is_hidden: is_hidden,
              pokemon_v2_ability: _pokemon_v2_ability?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon_v2_ability';
        _pokemon_v2_ability?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PokemonAbilityHolder', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
