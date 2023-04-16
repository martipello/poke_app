// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_form_with_version_group.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PokemonFormWithVersionGroup>
    _$pokemonFormWithVersionGroupSerializer =
    new _$PokemonFormWithVersionGroupSerializer();

class _$PokemonFormWithVersionGroupSerializer
    implements StructuredSerializer<PokemonFormWithVersionGroup> {
  @override
  final Iterable<Type> types = const [
    PokemonFormWithVersionGroup,
    _$PokemonFormWithVersionGroup
  ];
  @override
  final String wireName = 'PokemonFormWithVersionGroup';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PokemonFormWithVersionGroup object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'pokemon_v2_pokemonformnames',
      serializers.serialize(object.pokemon_v2_pokemonformnames,
          specifiedType: const FullType(
              BuiltList, const [const FullType(PokemonFormHolder)])),
    ];
    Object? value;
    value = object.pokemon_v2_versiongroup;
    if (value != null) {
      result
        ..add('pokemon_v2_versiongroup')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonResource)));
    }
    return result;
  }

  @override
  PokemonFormWithVersionGroup deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonFormWithVersionGroupBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'pokemon_v2_versiongroup':
          result.pokemon_v2_versiongroup.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PokemonResource))!
              as PokemonResource);
          break;
        case 'pokemon_v2_pokemonformnames':
          result.pokemon_v2_pokemonformnames.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PokemonFormHolder)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$PokemonFormWithVersionGroup extends PokemonFormWithVersionGroup {
  @override
  final PokemonResource? pokemon_v2_versiongroup;
  @override
  final BuiltList<PokemonFormHolder> pokemon_v2_pokemonformnames;

  factory _$PokemonFormWithVersionGroup(
          [void Function(PokemonFormWithVersionGroupBuilder)? updates]) =>
      (new PokemonFormWithVersionGroupBuilder()..update(updates))._build();

  _$PokemonFormWithVersionGroup._(
      {this.pokemon_v2_versiongroup, required this.pokemon_v2_pokemonformnames})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(pokemon_v2_pokemonformnames,
        r'PokemonFormWithVersionGroup', 'pokemon_v2_pokemonformnames');
  }

  @override
  PokemonFormWithVersionGroup rebuild(
          void Function(PokemonFormWithVersionGroupBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonFormWithVersionGroupBuilder toBuilder() =>
      new PokemonFormWithVersionGroupBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonFormWithVersionGroup &&
        pokemon_v2_versiongroup == other.pokemon_v2_versiongroup &&
        pokemon_v2_pokemonformnames == other.pokemon_v2_pokemonformnames;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, pokemon_v2_versiongroup.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_pokemonformnames.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PokemonFormWithVersionGroup')
          ..add('pokemon_v2_versiongroup', pokemon_v2_versiongroup)
          ..add('pokemon_v2_pokemonformnames', pokemon_v2_pokemonformnames))
        .toString();
  }
}

class PokemonFormWithVersionGroupBuilder
    implements
        Builder<PokemonFormWithVersionGroup,
            PokemonFormWithVersionGroupBuilder> {
  _$PokemonFormWithVersionGroup? _$v;

  PokemonResourceBuilder? _pokemon_v2_versiongroup;
  PokemonResourceBuilder get pokemon_v2_versiongroup =>
      _$this._pokemon_v2_versiongroup ??= new PokemonResourceBuilder();
  set pokemon_v2_versiongroup(
          PokemonResourceBuilder? pokemon_v2_versiongroup) =>
      _$this._pokemon_v2_versiongroup = pokemon_v2_versiongroup;

  ListBuilder<PokemonFormHolder>? _pokemon_v2_pokemonformnames;
  ListBuilder<PokemonFormHolder> get pokemon_v2_pokemonformnames =>
      _$this._pokemon_v2_pokemonformnames ??=
          new ListBuilder<PokemonFormHolder>();
  set pokemon_v2_pokemonformnames(
          ListBuilder<PokemonFormHolder>? pokemon_v2_pokemonformnames) =>
      _$this._pokemon_v2_pokemonformnames = pokemon_v2_pokemonformnames;

  PokemonFormWithVersionGroupBuilder();

  PokemonFormWithVersionGroupBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pokemon_v2_versiongroup = $v.pokemon_v2_versiongroup?.toBuilder();
      _pokemon_v2_pokemonformnames = $v.pokemon_v2_pokemonformnames.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PokemonFormWithVersionGroup other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PokemonFormWithVersionGroup;
  }

  @override
  void update(void Function(PokemonFormWithVersionGroupBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PokemonFormWithVersionGroup build() => _build();

  _$PokemonFormWithVersionGroup _build() {
    _$PokemonFormWithVersionGroup _$result;
    try {
      _$result = _$v ??
          new _$PokemonFormWithVersionGroup._(
              pokemon_v2_versiongroup: _pokemon_v2_versiongroup?.build(),
              pokemon_v2_pokemonformnames: pokemon_v2_pokemonformnames.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon_v2_versiongroup';
        _pokemon_v2_versiongroup?.build();
        _$failedField = 'pokemon_v2_pokemonformnames';
        pokemon_v2_pokemonformnames.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PokemonFormWithVersionGroup', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
