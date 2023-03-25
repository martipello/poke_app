// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_ability_holder.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PokemonAbilityHolder> _$pokemonAbilityHolderSerializer = new _$PokemonAbilityHolderSerializer();

class _$PokemonAbilityHolderSerializer implements StructuredSerializer<PokemonAbilityHolder> {
  @override
  final Iterable<Type> types = const [PokemonAbilityHolder, _$PokemonAbilityHolder];
  @override
  final String wireName = 'PokemonAbilityHolder';

  @override
  Iterable<Object?> serialize(Serializers serializers, PokemonAbilityHolder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.is_hidden;
    if (value != null) {
      result
        ..add('is_hidden')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.pokemon_v2_ability;
    if (value != null) {
      result
        ..add('pokemon_v2_ability')
        ..add(serializers.serialize(value, specifiedType: const FullType(PokemonAbility)));
    }
    return result;
  }

  @override
  PokemonAbilityHolder deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonAbilityHolderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'is_hidden':
          result.is_hidden = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'pokemon_v2_ability':
          result.pokemon_v2_ability.replace(
              serializers.deserialize(value, specifiedType: const FullType(PokemonAbility))! as PokemonAbility);
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

  factory _$PokemonAbilityHolder([void Function(PokemonAbilityHolderBuilder)? updates]) =>
      (new PokemonAbilityHolderBuilder()..update(updates))._build();

  _$PokemonAbilityHolder._({this.is_hidden, this.pokemon_v2_ability}) : super._();

  @override
  PokemonAbilityHolder rebuild(void Function(PokemonAbilityHolderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonAbilityHolderBuilder toBuilder() => new PokemonAbilityHolderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonAbilityHolder &&
        is_hidden == other.is_hidden &&
        pokemon_v2_ability == other.pokemon_v2_ability;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, is_hidden.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_ability.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PokemonAbilityHolder')
          ..add('is_hidden', is_hidden)
          ..add('pokemon_v2_ability', pokemon_v2_ability))
        .toString();
  }
}

class PokemonAbilityHolderBuilder implements Builder<PokemonAbilityHolder, PokemonAbilityHolderBuilder> {
  _$PokemonAbilityHolder? _$v;

  bool? _is_hidden;
  bool? get is_hidden => _$this._is_hidden;
  set is_hidden(bool? is_hidden) => _$this._is_hidden = is_hidden;

  PokemonAbilityBuilder? _pokemon_v2_ability;
  PokemonAbilityBuilder get pokemon_v2_ability => _$this._pokemon_v2_ability ??= new PokemonAbilityBuilder();
  set pokemon_v2_ability(PokemonAbilityBuilder? pokemon_v2_ability) => _$this._pokemon_v2_ability = pokemon_v2_ability;

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
      _$result =
          _$v ?? new _$PokemonAbilityHolder._(is_hidden: is_hidden, pokemon_v2_ability: _pokemon_v2_ability?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon_v2_ability';
        _pokemon_v2_ability?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(r'PokemonAbilityHolder', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
