// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_form_holder.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PokemonFormHolder> _$pokemonFormHolderSerializer =
    new _$PokemonFormHolderSerializer();

class _$PokemonFormHolderSerializer
    implements StructuredSerializer<PokemonFormHolder> {
  @override
  final Iterable<Type> types = const [PokemonFormHolder, _$PokemonFormHolder];
  @override
  final String wireName = 'PokemonFormHolder';

  @override
  Iterable<Object?> serialize(Serializers serializers, PokemonFormHolder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.pokemon_v2_pokemonform;
    if (value != null) {
      result
        ..add('pokemon_v2_pokemonform')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonForm)));
    }
    return result;
  }

  @override
  PokemonFormHolder deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonFormHolderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'pokemon_v2_pokemonform':
          result.pokemon_v2_pokemonform.replace(serializers.deserialize(value,
              specifiedType: const FullType(PokemonForm))! as PokemonForm);
          break;
      }
    }

    return result.build();
  }
}

class _$PokemonFormHolder extends PokemonFormHolder {
  @override
  final PokemonForm? pokemon_v2_pokemonform;

  factory _$PokemonFormHolder(
          [void Function(PokemonFormHolderBuilder)? updates]) =>
      (new PokemonFormHolderBuilder()..update(updates))._build();

  _$PokemonFormHolder._({this.pokemon_v2_pokemonform}) : super._();

  @override
  PokemonFormHolder rebuild(void Function(PokemonFormHolderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonFormHolderBuilder toBuilder() =>
      new PokemonFormHolderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonFormHolder &&
        pokemon_v2_pokemonform == other.pokemon_v2_pokemonform;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, pokemon_v2_pokemonform.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PokemonFormHolder')
          ..add('pokemon_v2_pokemonform', pokemon_v2_pokemonform))
        .toString();
  }
}

class PokemonFormHolderBuilder
    implements Builder<PokemonFormHolder, PokemonFormHolderBuilder> {
  _$PokemonFormHolder? _$v;

  PokemonFormBuilder? _pokemon_v2_pokemonform;
  PokemonFormBuilder get pokemon_v2_pokemonform =>
      _$this._pokemon_v2_pokemonform ??= new PokemonFormBuilder();
  set pokemon_v2_pokemonform(PokemonFormBuilder? pokemon_v2_pokemonform) =>
      _$this._pokemon_v2_pokemonform = pokemon_v2_pokemonform;

  PokemonFormHolderBuilder();

  PokemonFormHolderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pokemon_v2_pokemonform = $v.pokemon_v2_pokemonform?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PokemonFormHolder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PokemonFormHolder;
  }

  @override
  void update(void Function(PokemonFormHolderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PokemonFormHolder build() => _build();

  _$PokemonFormHolder _build() {
    _$PokemonFormHolder _$result;
    try {
      _$result = _$v ??
          new _$PokemonFormHolder._(
              pokemon_v2_pokemonform: _pokemon_v2_pokemonform?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon_v2_pokemonform';
        _pokemon_v2_pokemonform?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PokemonFormHolder', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
