// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_ability.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PokemonAbility> _$pokemonAbilitySerializer =
    new _$PokemonAbilitySerializer();

class _$PokemonAbilitySerializer
    implements StructuredSerializer<PokemonAbility> {
  @override
  final Iterable<Type> types = const [PokemonAbility, _$PokemonAbility];
  @override
  final String wireName = 'PokemonAbility';

  @override
  Iterable<Object?> serialize(Serializers serializers, PokemonAbility object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'pokemon_v2_abilityflavortexts',
      serializers.serialize(object.pokemon_v2_abilityflavortexts,
          specifiedType: const FullType(
              BuiltList, const [const FullType(PokemonResource)])),
      'pokemon_v2_abilityeffecttexts',
      serializers.serialize(object.pokemon_v2_abilityeffecttexts,
          specifiedType: const FullType(
              BuiltList, const [const FullType(PokemonResource)])),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.generation_id;
    if (value != null) {
      result
        ..add('generation_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.is_main_series;
    if (value != null) {
      result
        ..add('is_main_series')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PokemonAbility deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonAbilityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'generation_id':
          result.generation_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_main_series':
          result.is_main_series = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pokemon_v2_abilityflavortexts':
          result.pokemon_v2_abilityflavortexts.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PokemonResource)]))!
              as BuiltList<Object?>);
          break;
        case 'pokemon_v2_abilityeffecttexts':
          result.pokemon_v2_abilityeffecttexts.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PokemonResource)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$PokemonAbility extends PokemonAbility {
  @override
  final int? id;
  @override
  final int? generation_id;
  @override
  final bool? is_main_series;
  @override
  final String? name;
  @override
  final BuiltList<PokemonResource> pokemon_v2_abilityflavortexts;
  @override
  final BuiltList<PokemonResource> pokemon_v2_abilityeffecttexts;

  factory _$PokemonAbility([void Function(PokemonAbilityBuilder)? updates]) =>
      (new PokemonAbilityBuilder()..update(updates))._build();

  _$PokemonAbility._(
      {this.id,
      this.generation_id,
      this.is_main_series,
      this.name,
      required this.pokemon_v2_abilityflavortexts,
      required this.pokemon_v2_abilityeffecttexts})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(pokemon_v2_abilityflavortexts,
        r'PokemonAbility', 'pokemon_v2_abilityflavortexts');
    BuiltValueNullFieldError.checkNotNull(pokemon_v2_abilityeffecttexts,
        r'PokemonAbility', 'pokemon_v2_abilityeffecttexts');
  }

  @override
  PokemonAbility rebuild(void Function(PokemonAbilityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonAbilityBuilder toBuilder() =>
      new PokemonAbilityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonAbility &&
        id == other.id &&
        generation_id == other.generation_id &&
        is_main_series == other.is_main_series &&
        name == other.name &&
        pokemon_v2_abilityflavortexts == other.pokemon_v2_abilityflavortexts &&
        pokemon_v2_abilityeffecttexts == other.pokemon_v2_abilityeffecttexts;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, generation_id.hashCode);
    _$hash = $jc(_$hash, is_main_series.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_abilityflavortexts.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_abilityeffecttexts.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PokemonAbility')
          ..add('id', id)
          ..add('generation_id', generation_id)
          ..add('is_main_series', is_main_series)
          ..add('name', name)
          ..add('pokemon_v2_abilityflavortexts', pokemon_v2_abilityflavortexts)
          ..add('pokemon_v2_abilityeffecttexts', pokemon_v2_abilityeffecttexts))
        .toString();
  }
}

class PokemonAbilityBuilder
    implements Builder<PokemonAbility, PokemonAbilityBuilder> {
  _$PokemonAbility? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _generation_id;
  int? get generation_id => _$this._generation_id;
  set generation_id(int? generation_id) =>
      _$this._generation_id = generation_id;

  bool? _is_main_series;
  bool? get is_main_series => _$this._is_main_series;
  set is_main_series(bool? is_main_series) =>
      _$this._is_main_series = is_main_series;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<PokemonResource>? _pokemon_v2_abilityflavortexts;
  ListBuilder<PokemonResource> get pokemon_v2_abilityflavortexts =>
      _$this._pokemon_v2_abilityflavortexts ??=
          new ListBuilder<PokemonResource>();
  set pokemon_v2_abilityflavortexts(
          ListBuilder<PokemonResource>? pokemon_v2_abilityflavortexts) =>
      _$this._pokemon_v2_abilityflavortexts = pokemon_v2_abilityflavortexts;

  ListBuilder<PokemonResource>? _pokemon_v2_abilityeffecttexts;
  ListBuilder<PokemonResource> get pokemon_v2_abilityeffecttexts =>
      _$this._pokemon_v2_abilityeffecttexts ??=
          new ListBuilder<PokemonResource>();
  set pokemon_v2_abilityeffecttexts(
          ListBuilder<PokemonResource>? pokemon_v2_abilityeffecttexts) =>
      _$this._pokemon_v2_abilityeffecttexts = pokemon_v2_abilityeffecttexts;

  PokemonAbilityBuilder();

  PokemonAbilityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _generation_id = $v.generation_id;
      _is_main_series = $v.is_main_series;
      _name = $v.name;
      _pokemon_v2_abilityflavortexts =
          $v.pokemon_v2_abilityflavortexts.toBuilder();
      _pokemon_v2_abilityeffecttexts =
          $v.pokemon_v2_abilityeffecttexts.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PokemonAbility other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PokemonAbility;
  }

  @override
  void update(void Function(PokemonAbilityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PokemonAbility build() => _build();

  _$PokemonAbility _build() {
    _$PokemonAbility _$result;
    try {
      _$result = _$v ??
          new _$PokemonAbility._(
              id: id,
              generation_id: generation_id,
              is_main_series: is_main_series,
              name: name,
              pokemon_v2_abilityflavortexts:
                  pokemon_v2_abilityflavortexts.build(),
              pokemon_v2_abilityeffecttexts:
                  pokemon_v2_abilityeffecttexts.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon_v2_abilityflavortexts';
        pokemon_v2_abilityflavortexts.build();
        _$failedField = 'pokemon_v2_abilityeffecttexts';
        pokemon_v2_abilityeffecttexts.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PokemonAbility', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
