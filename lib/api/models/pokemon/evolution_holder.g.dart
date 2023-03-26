// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolution_holder.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EvolutionHolder> _$evolutionHolderSerializer = new _$EvolutionHolderSerializer();

class _$EvolutionHolderSerializer implements StructuredSerializer<EvolutionHolder> {
  @override
  final Iterable<Type> types = const [EvolutionHolder, _$EvolutionHolder];
  @override
  final String wireName = 'EvolutionHolder';

  @override
  Iterable<Object?> serialize(Serializers serializers, EvolutionHolder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'pokemon_v2_pokemonspecies',
      serializers.serialize(object.pokemon_v2_pokemonspecies,
          specifiedType: const FullType(BuiltList, const [const FullType(PokemonSpeciesHolder)])),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  EvolutionHolder deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EvolutionHolderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'pokemon_v2_pokemonspecies':
          result.pokemon_v2_pokemonspecies.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, const [const FullType(PokemonSpeciesHolder)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$EvolutionHolder extends EvolutionHolder {
  @override
  final int? id;
  @override
  final BuiltList<PokemonSpeciesHolder> pokemon_v2_pokemonspecies;

  factory _$EvolutionHolder([void Function(EvolutionHolderBuilder)? updates]) =>
      (new EvolutionHolderBuilder()..update(updates))._build();

  _$EvolutionHolder._({this.id, required this.pokemon_v2_pokemonspecies}) : super._() {
    BuiltValueNullFieldError.checkNotNull(pokemon_v2_pokemonspecies, r'EvolutionHolder', 'pokemon_v2_pokemonspecies');
  }

  @override
  EvolutionHolder rebuild(void Function(EvolutionHolderBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  EvolutionHolderBuilder toBuilder() => new EvolutionHolderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EvolutionHolder && id == other.id && pokemon_v2_pokemonspecies == other.pokemon_v2_pokemonspecies;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_pokemonspecies.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EvolutionHolder')
          ..add('id', id)
          ..add('pokemon_v2_pokemonspecies', pokemon_v2_pokemonspecies))
        .toString();
  }
}

class EvolutionHolderBuilder implements Builder<EvolutionHolder, EvolutionHolderBuilder> {
  _$EvolutionHolder? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  ListBuilder<PokemonSpeciesHolder>? _pokemon_v2_pokemonspecies;
  ListBuilder<PokemonSpeciesHolder> get pokemon_v2_pokemonspecies =>
      _$this._pokemon_v2_pokemonspecies ??= new ListBuilder<PokemonSpeciesHolder>();
  set pokemon_v2_pokemonspecies(ListBuilder<PokemonSpeciesHolder>? pokemon_v2_pokemonspecies) =>
      _$this._pokemon_v2_pokemonspecies = pokemon_v2_pokemonspecies;

  EvolutionHolderBuilder();

  EvolutionHolderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _pokemon_v2_pokemonspecies = $v.pokemon_v2_pokemonspecies.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EvolutionHolder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EvolutionHolder;
  }

  @override
  void update(void Function(EvolutionHolderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EvolutionHolder build() => _build();

  _$EvolutionHolder _build() {
    _$EvolutionHolder _$result;
    try {
      _$result = _$v ?? new _$EvolutionHolder._(id: id, pokemon_v2_pokemonspecies: pokemon_v2_pokemonspecies.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon_v2_pokemonspecies';
        pokemon_v2_pokemonspecies.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(r'EvolutionHolder', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
