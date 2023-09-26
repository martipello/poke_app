// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolution_chain_holder.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EvolutionChainHolder> _$evolutionChainHolderSerializer =
    new _$EvolutionChainHolderSerializer();

class _$EvolutionChainHolderSerializer
    implements StructuredSerializer<EvolutionChainHolder> {
  @override
  final Iterable<Type> types = const [
    EvolutionChainHolder,
    _$EvolutionChainHolder
  ];
  @override
  final String wireName = 'EvolutionChainHolder';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, EvolutionChainHolder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'pokemon_v2_evolutionchain',
      serializers.serialize(object.pokemon_v2_evolutionchain,
          specifiedType: const FullType(
              BuiltList, const [const FullType(EvolutionHolder)])),
    ];

    return result;
  }

  @override
  EvolutionChainHolder deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EvolutionChainHolderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'pokemon_v2_evolutionchain':
          result.pokemon_v2_evolutionchain.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(EvolutionHolder)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$EvolutionChainHolder extends EvolutionChainHolder {
  @override
  final BuiltList<EvolutionHolder> pokemon_v2_evolutionchain;

  factory _$EvolutionChainHolder(
          [void Function(EvolutionChainHolderBuilder)? updates]) =>
      (new EvolutionChainHolderBuilder()..update(updates))._build();

  _$EvolutionChainHolder._({required this.pokemon_v2_evolutionchain})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(pokemon_v2_evolutionchain,
        r'EvolutionChainHolder', 'pokemon_v2_evolutionchain');
  }

  @override
  EvolutionChainHolder rebuild(
          void Function(EvolutionChainHolderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EvolutionChainHolderBuilder toBuilder() =>
      new EvolutionChainHolderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EvolutionChainHolder &&
        pokemon_v2_evolutionchain == other.pokemon_v2_evolutionchain;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, pokemon_v2_evolutionchain.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EvolutionChainHolder')
          ..add('pokemon_v2_evolutionchain', pokemon_v2_evolutionchain))
        .toString();
  }
}

class EvolutionChainHolderBuilder
    implements Builder<EvolutionChainHolder, EvolutionChainHolderBuilder> {
  _$EvolutionChainHolder? _$v;

  ListBuilder<EvolutionHolder>? _pokemon_v2_evolutionchain;
  ListBuilder<EvolutionHolder> get pokemon_v2_evolutionchain =>
      _$this._pokemon_v2_evolutionchain ??= new ListBuilder<EvolutionHolder>();
  set pokemon_v2_evolutionchain(
          ListBuilder<EvolutionHolder>? pokemon_v2_evolutionchain) =>
      _$this._pokemon_v2_evolutionchain = pokemon_v2_evolutionchain;

  EvolutionChainHolderBuilder();

  EvolutionChainHolderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pokemon_v2_evolutionchain = $v.pokemon_v2_evolutionchain.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EvolutionChainHolder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EvolutionChainHolder;
  }

  @override
  void update(void Function(EvolutionChainHolderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EvolutionChainHolder build() => _build();

  _$EvolutionChainHolder _build() {
    _$EvolutionChainHolder _$result;
    try {
      _$result = _$v ??
          new _$EvolutionChainHolder._(
              pokemon_v2_evolutionchain: pokemon_v2_evolutionchain.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon_v2_evolutionchain';
        pokemon_v2_evolutionchain.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EvolutionChainHolder', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
