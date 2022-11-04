// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_species.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PokemonSpecies> _$pokemonSpeciesSerializer =
    new _$PokemonSpeciesSerializer();

class _$PokemonSpeciesSerializer
    implements StructuredSerializer<PokemonSpecies> {
  @override
  final Iterable<Type> types = const [PokemonSpecies, _$PokemonSpecies];
  @override
  final String wireName = 'PokemonSpecies';

  @override
  Iterable<Object?> serialize(Serializers serializers, PokemonSpecies object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.genus;
    if (value != null) {
      result
        ..add('genus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PokemonSpecies deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonSpeciesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'genus':
          result.genus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$PokemonSpecies extends PokemonSpecies {
  @override
  final String? genus;

  factory _$PokemonSpecies([void Function(PokemonSpeciesBuilder)? updates]) =>
      (new PokemonSpeciesBuilder()..update(updates))._build();

  _$PokemonSpecies._({this.genus}) : super._();

  @override
  PokemonSpecies rebuild(void Function(PokemonSpeciesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonSpeciesBuilder toBuilder() =>
      new PokemonSpeciesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonSpecies && genus == other.genus;
  }

  @override
  int get hashCode {
    return $jf($jc(0, genus.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PokemonSpecies')..add('genus', genus))
        .toString();
  }
}

class PokemonSpeciesBuilder
    implements Builder<PokemonSpecies, PokemonSpeciesBuilder> {
  _$PokemonSpecies? _$v;

  String? _genus;
  String? get genus => _$this._genus;
  set genus(String? genus) => _$this._genus = genus;

  PokemonSpeciesBuilder();

  PokemonSpeciesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _genus = $v.genus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PokemonSpecies other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PokemonSpecies;
  }

  @override
  void update(void Function(PokemonSpeciesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PokemonSpecies build() => _build();

  _$PokemonSpecies _build() {
    final _$result = _$v ?? new _$PokemonSpecies._(genus: genus);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
