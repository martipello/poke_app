// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_species_holder.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PokemonSpeciesHolder> _$pokemonSpeciesHolderSerializer =
    new _$PokemonSpeciesHolderSerializer();

class _$PokemonSpeciesHolderSerializer
    implements StructuredSerializer<PokemonSpeciesHolder> {
  @override
  final Iterable<Type> types = const [
    PokemonSpeciesHolder,
    _$PokemonSpeciesHolder
  ];
  @override
  final String wireName = 'PokemonSpeciesHolder';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PokemonSpeciesHolder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'pokemon_v2_pokemonspeciesnames',
      serializers.serialize(object.pokemon_v2_pokemonspeciesnames,
          specifiedType: const FullType(
              BuiltList, const [const FullType(PokemonSpecies)])),
    ];
    Object? value;
    value = object.generation_id;
    if (value != null) {
      result
        ..add('generation_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  PokemonSpeciesHolder deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonSpeciesHolderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'generation_id':
          result.generation_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'pokemon_v2_pokemonspeciesnames':
          result.pokemon_v2_pokemonspeciesnames.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PokemonSpecies)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$PokemonSpeciesHolder extends PokemonSpeciesHolder {
  @override
  final int? generation_id;
  @override
  final BuiltList<PokemonSpecies> pokemon_v2_pokemonspeciesnames;

  factory _$PokemonSpeciesHolder(
          [void Function(PokemonSpeciesHolderBuilder)? updates]) =>
      (new PokemonSpeciesHolderBuilder()..update(updates))._build();

  _$PokemonSpeciesHolder._(
      {this.generation_id, required this.pokemon_v2_pokemonspeciesnames})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(pokemon_v2_pokemonspeciesnames,
        r'PokemonSpeciesHolder', 'pokemon_v2_pokemonspeciesnames');
  }

  @override
  PokemonSpeciesHolder rebuild(
          void Function(PokemonSpeciesHolderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonSpeciesHolderBuilder toBuilder() =>
      new PokemonSpeciesHolderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonSpeciesHolder &&
        generation_id == other.generation_id &&
        pokemon_v2_pokemonspeciesnames == other.pokemon_v2_pokemonspeciesnames;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, generation_id.hashCode),
        pokemon_v2_pokemonspeciesnames.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PokemonSpeciesHolder')
          ..add('generation_id', generation_id)
          ..add(
              'pokemon_v2_pokemonspeciesnames', pokemon_v2_pokemonspeciesnames))
        .toString();
  }
}

class PokemonSpeciesHolderBuilder
    implements Builder<PokemonSpeciesHolder, PokemonSpeciesHolderBuilder> {
  _$PokemonSpeciesHolder? _$v;

  int? _generation_id;
  int? get generation_id => _$this._generation_id;
  set generation_id(int? generation_id) =>
      _$this._generation_id = generation_id;

  ListBuilder<PokemonSpecies>? _pokemon_v2_pokemonspeciesnames;
  ListBuilder<PokemonSpecies> get pokemon_v2_pokemonspeciesnames =>
      _$this._pokemon_v2_pokemonspeciesnames ??=
          new ListBuilder<PokemonSpecies>();
  set pokemon_v2_pokemonspeciesnames(
          ListBuilder<PokemonSpecies>? pokemon_v2_pokemonspeciesnames) =>
      _$this._pokemon_v2_pokemonspeciesnames = pokemon_v2_pokemonspeciesnames;

  PokemonSpeciesHolderBuilder();

  PokemonSpeciesHolderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _generation_id = $v.generation_id;
      _pokemon_v2_pokemonspeciesnames =
          $v.pokemon_v2_pokemonspeciesnames.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PokemonSpeciesHolder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PokemonSpeciesHolder;
  }

  @override
  void update(void Function(PokemonSpeciesHolderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PokemonSpeciesHolder build() => _build();

  _$PokemonSpeciesHolder _build() {
    _$PokemonSpeciesHolder _$result;
    try {
      _$result = _$v ??
          new _$PokemonSpeciesHolder._(
              generation_id: generation_id,
              pokemon_v2_pokemonspeciesnames:
                  pokemon_v2_pokemonspeciesnames.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon_v2_pokemonspeciesnames';
        pokemon_v2_pokemonspeciesnames.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PokemonSpeciesHolder', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
