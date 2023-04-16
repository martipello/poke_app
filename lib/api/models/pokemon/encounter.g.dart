// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encounter.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Encounter> _$encounterSerializer = new _$EncounterSerializer();

class _$EncounterSerializer implements StructuredSerializer<Encounter> {
  @override
  final Iterable<Type> types = const [Encounter, _$Encounter];
  @override
  final String wireName = 'Encounter';

  @override
  Iterable<Object?> serialize(Serializers serializers, Encounter object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'encounterSlotAndLocations',
      serializers.serialize(object.encounterSlotAndLocations,
          specifiedType: const FullType(BuiltMap, const [
            const FullType(PokemonResource),
            const FullType(EncounterSlot)
          ])),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.min_level;
    if (value != null) {
      result
        ..add('min_level')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.max_level;
    if (value != null) {
      result
        ..add('max_level')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pokemon_v2_version;
    if (value != null) {
      result
        ..add('pokemon_v2_version')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonResource)));
    }
    value = object.pokemon_v2_locationarea;
    if (value != null) {
      result
        ..add('pokemon_v2_locationarea')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonResource)));
    }
    value = object.pokemon_v2_location;
    if (value != null) {
      result
        ..add('pokemon_v2_location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonResource)));
    }
    value = object.pokemon_v2_encounterslot;
    if (value != null) {
      result
        ..add('pokemon_v2_encounterslot')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(EncounterSlot)));
    }
    return result;
  }

  @override
  Encounter deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EncounterBuilder();

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
        case 'min_level':
          result.min_level = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'max_level':
          result.max_level = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'pokemon_v2_version':
          result.pokemon_v2_version.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PokemonResource))!
              as PokemonResource);
          break;
        case 'pokemon_v2_locationarea':
          result.pokemon_v2_locationarea.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PokemonResource))!
              as PokemonResource);
          break;
        case 'pokemon_v2_location':
          result.pokemon_v2_location.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PokemonResource))!
              as PokemonResource);
          break;
        case 'pokemon_v2_encounterslot':
          result.pokemon_v2_encounterslot.replace(serializers.deserialize(value,
              specifiedType: const FullType(EncounterSlot))! as EncounterSlot);
          break;
        case 'encounterSlotAndLocations':
          result.encounterSlotAndLocations.replace(serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(PokemonResource),
                const FullType(EncounterSlot)
              ]))!);
          break;
      }
    }

    return result.build();
  }
}

class _$Encounter extends Encounter {
  @override
  final int? id;
  @override
  final int? min_level;
  @override
  final int? max_level;
  @override
  final PokemonResource? pokemon_v2_version;
  @override
  final PokemonResource? pokemon_v2_locationarea;
  @override
  final PokemonResource? pokemon_v2_location;
  @override
  final EncounterSlot? pokemon_v2_encounterslot;
  @override
  final BuiltMap<PokemonResource, EncounterSlot> encounterSlotAndLocations;

  factory _$Encounter([void Function(EncounterBuilder)? updates]) =>
      (new EncounterBuilder()..update(updates))._build();

  _$Encounter._(
      {this.id,
      this.min_level,
      this.max_level,
      this.pokemon_v2_version,
      this.pokemon_v2_locationarea,
      this.pokemon_v2_location,
      this.pokemon_v2_encounterslot,
      required this.encounterSlotAndLocations})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        encounterSlotAndLocations, r'Encounter', 'encounterSlotAndLocations');
  }

  @override
  Encounter rebuild(void Function(EncounterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EncounterBuilder toBuilder() => new EncounterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Encounter &&
        id == other.id &&
        min_level == other.min_level &&
        max_level == other.max_level &&
        pokemon_v2_version == other.pokemon_v2_version &&
        pokemon_v2_locationarea == other.pokemon_v2_locationarea &&
        pokemon_v2_location == other.pokemon_v2_location &&
        pokemon_v2_encounterslot == other.pokemon_v2_encounterslot &&
        encounterSlotAndLocations == other.encounterSlotAndLocations;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, min_level.hashCode);
    _$hash = $jc(_$hash, max_level.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_version.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_locationarea.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_location.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_encounterslot.hashCode);
    _$hash = $jc(_$hash, encounterSlotAndLocations.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Encounter')
          ..add('id', id)
          ..add('min_level', min_level)
          ..add('max_level', max_level)
          ..add('pokemon_v2_version', pokemon_v2_version)
          ..add('pokemon_v2_locationarea', pokemon_v2_locationarea)
          ..add('pokemon_v2_location', pokemon_v2_location)
          ..add('pokemon_v2_encounterslot', pokemon_v2_encounterslot)
          ..add('encounterSlotAndLocations', encounterSlotAndLocations))
        .toString();
  }
}

class EncounterBuilder implements Builder<Encounter, EncounterBuilder> {
  _$Encounter? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _min_level;
  int? get min_level => _$this._min_level;
  set min_level(int? min_level) => _$this._min_level = min_level;

  int? _max_level;
  int? get max_level => _$this._max_level;
  set max_level(int? max_level) => _$this._max_level = max_level;

  PokemonResourceBuilder? _pokemon_v2_version;
  PokemonResourceBuilder get pokemon_v2_version =>
      _$this._pokemon_v2_version ??= new PokemonResourceBuilder();
  set pokemon_v2_version(PokemonResourceBuilder? pokemon_v2_version) =>
      _$this._pokemon_v2_version = pokemon_v2_version;

  PokemonResourceBuilder? _pokemon_v2_locationarea;
  PokemonResourceBuilder get pokemon_v2_locationarea =>
      _$this._pokemon_v2_locationarea ??= new PokemonResourceBuilder();
  set pokemon_v2_locationarea(
          PokemonResourceBuilder? pokemon_v2_locationarea) =>
      _$this._pokemon_v2_locationarea = pokemon_v2_locationarea;

  PokemonResourceBuilder? _pokemon_v2_location;
  PokemonResourceBuilder get pokemon_v2_location =>
      _$this._pokemon_v2_location ??= new PokemonResourceBuilder();
  set pokemon_v2_location(PokemonResourceBuilder? pokemon_v2_location) =>
      _$this._pokemon_v2_location = pokemon_v2_location;

  EncounterSlotBuilder? _pokemon_v2_encounterslot;
  EncounterSlotBuilder get pokemon_v2_encounterslot =>
      _$this._pokemon_v2_encounterslot ??= new EncounterSlotBuilder();
  set pokemon_v2_encounterslot(
          EncounterSlotBuilder? pokemon_v2_encounterslot) =>
      _$this._pokemon_v2_encounterslot = pokemon_v2_encounterslot;

  MapBuilder<PokemonResource, EncounterSlot>? _encounterSlotAndLocations;
  MapBuilder<PokemonResource, EncounterSlot> get encounterSlotAndLocations =>
      _$this._encounterSlotAndLocations ??=
          new MapBuilder<PokemonResource, EncounterSlot>();
  set encounterSlotAndLocations(
          MapBuilder<PokemonResource, EncounterSlot>?
              encounterSlotAndLocations) =>
      _$this._encounterSlotAndLocations = encounterSlotAndLocations;

  EncounterBuilder();

  EncounterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _min_level = $v.min_level;
      _max_level = $v.max_level;
      _pokemon_v2_version = $v.pokemon_v2_version?.toBuilder();
      _pokemon_v2_locationarea = $v.pokemon_v2_locationarea?.toBuilder();
      _pokemon_v2_location = $v.pokemon_v2_location?.toBuilder();
      _pokemon_v2_encounterslot = $v.pokemon_v2_encounterslot?.toBuilder();
      _encounterSlotAndLocations = $v.encounterSlotAndLocations.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Encounter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Encounter;
  }

  @override
  void update(void Function(EncounterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Encounter build() => _build();

  _$Encounter _build() {
    _$Encounter _$result;
    try {
      _$result = _$v ??
          new _$Encounter._(
              id: id,
              min_level: min_level,
              max_level: max_level,
              pokemon_v2_version: _pokemon_v2_version?.build(),
              pokemon_v2_locationarea: _pokemon_v2_locationarea?.build(),
              pokemon_v2_location: _pokemon_v2_location?.build(),
              pokemon_v2_encounterslot: _pokemon_v2_encounterslot?.build(),
              encounterSlotAndLocations: encounterSlotAndLocations.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon_v2_version';
        _pokemon_v2_version?.build();
        _$failedField = 'pokemon_v2_locationarea';
        _pokemon_v2_locationarea?.build();
        _$failedField = 'pokemon_v2_location';
        _pokemon_v2_location?.build();
        _$failedField = 'pokemon_v2_encounterslot';
        _pokemon_v2_encounterslot?.build();
        _$failedField = 'encounterSlotAndLocations';
        encounterSlotAndLocations.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Encounter', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
