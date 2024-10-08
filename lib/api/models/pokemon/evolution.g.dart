// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolution.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Evolution> _$evolutionSerializer = new _$EvolutionSerializer();

class _$EvolutionSerializer implements StructuredSerializer<Evolution> {
  @override
  final Iterable<Type> types = const [Evolution, _$Evolution];
  @override
  final String wireName = 'Evolution';

  @override
  Iterable<Object?> serialize(Serializers serializers, Evolution object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.needs_overworld_rain;
    if (value != null) {
      result
        ..add('needs_overworld_rain')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.min_level;
    if (value != null) {
      result
        ..add('min_level')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.min_happiness;
    if (value != null) {
      result
        ..add('min_happiness')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.min_beauty;
    if (value != null) {
      result
        ..add('min_beauty')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.min_affection;
    if (value != null) {
      result
        ..add('min_affection')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.location_id;
    if (value != null) {
      result
        ..add('location_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pokemon_v2_evolutiontrigger;
    if (value != null) {
      result
        ..add('pokemon_v2_evolutiontrigger')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonResource)));
    }
    value = object.turn_upside_down;
    if (value != null) {
      result
        ..add('turn_upside_down')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.trade_species_id;
    if (value != null) {
      result
        ..add('trade_species_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.time_of_day;
    if (value != null) {
      result
        ..add('time_of_day')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.relative_physical_stats;
    if (value != null) {
      result
        ..add('relative_physical_stats')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pokemon_v2_location;
    if (value != null) {
      result
        ..add('pokemon_v2_location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonResource)));
    }
    value = object.pokemon_v2_item;
    if (value != null) {
      result
        ..add('pokemon_v2_item')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonResource)));
    }
    value = object.known_move_id;
    if (value != null) {
      result
        ..add('known_move_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.known_move_type_id;
    if (value != null) {
      result
        ..add('known_move_type_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.held_item_id;
    if (value != null) {
      result
        ..add('held_item_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.gender_id;
    if (value != null) {
      result
        ..add('gender_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pokemonV2ItemByHeldItemId;
    if (value != null) {
      result
        ..add('pokemonV2ItemByHeldItemId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonResource)));
    }
    return result;
  }

  @override
  Evolution deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EvolutionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'needs_overworld_rain':
          result.needs_overworld_rain = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'min_level':
          result.min_level = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'min_happiness':
          result.min_happiness = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'min_beauty':
          result.min_beauty = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'min_affection':
          result.min_affection = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'location_id':
          result.location_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'pokemon_v2_evolutiontrigger':
          result.pokemon_v2_evolutiontrigger.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(PokemonResource))!
              as PokemonResource);
          break;
        case 'turn_upside_down':
          result.turn_upside_down = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'trade_species_id':
          result.trade_species_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'time_of_day':
          result.time_of_day = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'relative_physical_stats':
          result.relative_physical_stats = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'pokemon_v2_location':
          result.pokemon_v2_location.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PokemonResource))!
              as PokemonResource);
          break;
        case 'pokemon_v2_item':
          result.pokemon_v2_item.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PokemonResource))!
              as PokemonResource);
          break;
        case 'known_move_id':
          result.known_move_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'known_move_type_id':
          result.known_move_type_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'held_item_id':
          result.held_item_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'gender_id':
          result.gender_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'pokemonV2ItemByHeldItemId':
          result.pokemonV2ItemByHeldItemId.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(PokemonResource))!
              as PokemonResource);
          break;
      }
    }

    return result.build();
  }
}

class _$Evolution extends Evolution {
  @override
  final bool? needs_overworld_rain;
  @override
  final int? min_level;
  @override
  final int? min_happiness;
  @override
  final int? min_beauty;
  @override
  final int? min_affection;
  @override
  final int? location_id;
  @override
  final PokemonResource? pokemon_v2_evolutiontrigger;
  @override
  final bool? turn_upside_down;
  @override
  final int? trade_species_id;
  @override
  final String? time_of_day;
  @override
  final int? relative_physical_stats;
  @override
  final PokemonResource? pokemon_v2_location;
  @override
  final PokemonResource? pokemon_v2_item;
  @override
  final int? known_move_id;
  @override
  final int? known_move_type_id;
  @override
  final int? held_item_id;
  @override
  final int? gender_id;
  @override
  final PokemonResource? pokemonV2ItemByHeldItemId;

  factory _$Evolution([void Function(EvolutionBuilder)? updates]) =>
      (new EvolutionBuilder()..update(updates))._build();

  _$Evolution._(
      {this.needs_overworld_rain,
      this.min_level,
      this.min_happiness,
      this.min_beauty,
      this.min_affection,
      this.location_id,
      this.pokemon_v2_evolutiontrigger,
      this.turn_upside_down,
      this.trade_species_id,
      this.time_of_day,
      this.relative_physical_stats,
      this.pokemon_v2_location,
      this.pokemon_v2_item,
      this.known_move_id,
      this.known_move_type_id,
      this.held_item_id,
      this.gender_id,
      this.pokemonV2ItemByHeldItemId})
      : super._();

  @override
  Evolution rebuild(void Function(EvolutionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EvolutionBuilder toBuilder() => new EvolutionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Evolution &&
        needs_overworld_rain == other.needs_overworld_rain &&
        min_level == other.min_level &&
        min_happiness == other.min_happiness &&
        min_beauty == other.min_beauty &&
        min_affection == other.min_affection &&
        location_id == other.location_id &&
        pokemon_v2_evolutiontrigger == other.pokemon_v2_evolutiontrigger &&
        turn_upside_down == other.turn_upside_down &&
        trade_species_id == other.trade_species_id &&
        time_of_day == other.time_of_day &&
        relative_physical_stats == other.relative_physical_stats &&
        pokemon_v2_location == other.pokemon_v2_location &&
        pokemon_v2_item == other.pokemon_v2_item &&
        known_move_id == other.known_move_id &&
        known_move_type_id == other.known_move_type_id &&
        held_item_id == other.held_item_id &&
        gender_id == other.gender_id &&
        pokemonV2ItemByHeldItemId == other.pokemonV2ItemByHeldItemId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, needs_overworld_rain.hashCode);
    _$hash = $jc(_$hash, min_level.hashCode);
    _$hash = $jc(_$hash, min_happiness.hashCode);
    _$hash = $jc(_$hash, min_beauty.hashCode);
    _$hash = $jc(_$hash, min_affection.hashCode);
    _$hash = $jc(_$hash, location_id.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_evolutiontrigger.hashCode);
    _$hash = $jc(_$hash, turn_upside_down.hashCode);
    _$hash = $jc(_$hash, trade_species_id.hashCode);
    _$hash = $jc(_$hash, time_of_day.hashCode);
    _$hash = $jc(_$hash, relative_physical_stats.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_location.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_item.hashCode);
    _$hash = $jc(_$hash, known_move_id.hashCode);
    _$hash = $jc(_$hash, known_move_type_id.hashCode);
    _$hash = $jc(_$hash, held_item_id.hashCode);
    _$hash = $jc(_$hash, gender_id.hashCode);
    _$hash = $jc(_$hash, pokemonV2ItemByHeldItemId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Evolution')
          ..add('needs_overworld_rain', needs_overworld_rain)
          ..add('min_level', min_level)
          ..add('min_happiness', min_happiness)
          ..add('min_beauty', min_beauty)
          ..add('min_affection', min_affection)
          ..add('location_id', location_id)
          ..add('pokemon_v2_evolutiontrigger', pokemon_v2_evolutiontrigger)
          ..add('turn_upside_down', turn_upside_down)
          ..add('trade_species_id', trade_species_id)
          ..add('time_of_day', time_of_day)
          ..add('relative_physical_stats', relative_physical_stats)
          ..add('pokemon_v2_location', pokemon_v2_location)
          ..add('pokemon_v2_item', pokemon_v2_item)
          ..add('known_move_id', known_move_id)
          ..add('known_move_type_id', known_move_type_id)
          ..add('held_item_id', held_item_id)
          ..add('gender_id', gender_id)
          ..add('pokemonV2ItemByHeldItemId', pokemonV2ItemByHeldItemId))
        .toString();
  }
}

class EvolutionBuilder implements Builder<Evolution, EvolutionBuilder> {
  _$Evolution? _$v;

  bool? _needs_overworld_rain;
  bool? get needs_overworld_rain => _$this._needs_overworld_rain;
  set needs_overworld_rain(bool? needs_overworld_rain) =>
      _$this._needs_overworld_rain = needs_overworld_rain;

  int? _min_level;
  int? get min_level => _$this._min_level;
  set min_level(int? min_level) => _$this._min_level = min_level;

  int? _min_happiness;
  int? get min_happiness => _$this._min_happiness;
  set min_happiness(int? min_happiness) =>
      _$this._min_happiness = min_happiness;

  int? _min_beauty;
  int? get min_beauty => _$this._min_beauty;
  set min_beauty(int? min_beauty) => _$this._min_beauty = min_beauty;

  int? _min_affection;
  int? get min_affection => _$this._min_affection;
  set min_affection(int? min_affection) =>
      _$this._min_affection = min_affection;

  int? _location_id;
  int? get location_id => _$this._location_id;
  set location_id(int? location_id) => _$this._location_id = location_id;

  PokemonResourceBuilder? _pokemon_v2_evolutiontrigger;
  PokemonResourceBuilder get pokemon_v2_evolutiontrigger =>
      _$this._pokemon_v2_evolutiontrigger ??= new PokemonResourceBuilder();
  set pokemon_v2_evolutiontrigger(
          PokemonResourceBuilder? pokemon_v2_evolutiontrigger) =>
      _$this._pokemon_v2_evolutiontrigger = pokemon_v2_evolutiontrigger;

  bool? _turn_upside_down;
  bool? get turn_upside_down => _$this._turn_upside_down;
  set turn_upside_down(bool? turn_upside_down) =>
      _$this._turn_upside_down = turn_upside_down;

  int? _trade_species_id;
  int? get trade_species_id => _$this._trade_species_id;
  set trade_species_id(int? trade_species_id) =>
      _$this._trade_species_id = trade_species_id;

  String? _time_of_day;
  String? get time_of_day => _$this._time_of_day;
  set time_of_day(String? time_of_day) => _$this._time_of_day = time_of_day;

  int? _relative_physical_stats;
  int? get relative_physical_stats => _$this._relative_physical_stats;
  set relative_physical_stats(int? relative_physical_stats) =>
      _$this._relative_physical_stats = relative_physical_stats;

  PokemonResourceBuilder? _pokemon_v2_location;
  PokemonResourceBuilder get pokemon_v2_location =>
      _$this._pokemon_v2_location ??= new PokemonResourceBuilder();
  set pokemon_v2_location(PokemonResourceBuilder? pokemon_v2_location) =>
      _$this._pokemon_v2_location = pokemon_v2_location;

  PokemonResourceBuilder? _pokemon_v2_item;
  PokemonResourceBuilder get pokemon_v2_item =>
      _$this._pokemon_v2_item ??= new PokemonResourceBuilder();
  set pokemon_v2_item(PokemonResourceBuilder? pokemon_v2_item) =>
      _$this._pokemon_v2_item = pokemon_v2_item;

  int? _known_move_id;
  int? get known_move_id => _$this._known_move_id;
  set known_move_id(int? known_move_id) =>
      _$this._known_move_id = known_move_id;

  int? _known_move_type_id;
  int? get known_move_type_id => _$this._known_move_type_id;
  set known_move_type_id(int? known_move_type_id) =>
      _$this._known_move_type_id = known_move_type_id;

  int? _held_item_id;
  int? get held_item_id => _$this._held_item_id;
  set held_item_id(int? held_item_id) => _$this._held_item_id = held_item_id;

  int? _gender_id;
  int? get gender_id => _$this._gender_id;
  set gender_id(int? gender_id) => _$this._gender_id = gender_id;

  PokemonResourceBuilder? _pokemonV2ItemByHeldItemId;
  PokemonResourceBuilder get pokemonV2ItemByHeldItemId =>
      _$this._pokemonV2ItemByHeldItemId ??= new PokemonResourceBuilder();
  set pokemonV2ItemByHeldItemId(
          PokemonResourceBuilder? pokemonV2ItemByHeldItemId) =>
      _$this._pokemonV2ItemByHeldItemId = pokemonV2ItemByHeldItemId;

  EvolutionBuilder();

  EvolutionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _needs_overworld_rain = $v.needs_overworld_rain;
      _min_level = $v.min_level;
      _min_happiness = $v.min_happiness;
      _min_beauty = $v.min_beauty;
      _min_affection = $v.min_affection;
      _location_id = $v.location_id;
      _pokemon_v2_evolutiontrigger =
          $v.pokemon_v2_evolutiontrigger?.toBuilder();
      _turn_upside_down = $v.turn_upside_down;
      _trade_species_id = $v.trade_species_id;
      _time_of_day = $v.time_of_day;
      _relative_physical_stats = $v.relative_physical_stats;
      _pokemon_v2_location = $v.pokemon_v2_location?.toBuilder();
      _pokemon_v2_item = $v.pokemon_v2_item?.toBuilder();
      _known_move_id = $v.known_move_id;
      _known_move_type_id = $v.known_move_type_id;
      _held_item_id = $v.held_item_id;
      _gender_id = $v.gender_id;
      _pokemonV2ItemByHeldItemId = $v.pokemonV2ItemByHeldItemId?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Evolution other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Evolution;
  }

  @override
  void update(void Function(EvolutionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Evolution build() => _build();

  _$Evolution _build() {
    _$Evolution _$result;
    try {
      _$result = _$v ??
          new _$Evolution._(
              needs_overworld_rain: needs_overworld_rain,
              min_level: min_level,
              min_happiness: min_happiness,
              min_beauty: min_beauty,
              min_affection: min_affection,
              location_id: location_id,
              pokemon_v2_evolutiontrigger:
                  _pokemon_v2_evolutiontrigger?.build(),
              turn_upside_down: turn_upside_down,
              trade_species_id: trade_species_id,
              time_of_day: time_of_day,
              relative_physical_stats: relative_physical_stats,
              pokemon_v2_location: _pokemon_v2_location?.build(),
              pokemon_v2_item: _pokemon_v2_item?.build(),
              known_move_id: known_move_id,
              known_move_type_id: known_move_type_id,
              held_item_id: held_item_id,
              gender_id: gender_id,
              pokemonV2ItemByHeldItemId: _pokemonV2ItemByHeldItemId?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon_v2_evolutiontrigger';
        _pokemon_v2_evolutiontrigger?.build();

        _$failedField = 'pokemon_v2_location';
        _pokemon_v2_location?.build();
        _$failedField = 'pokemon_v2_item';
        _pokemon_v2_item?.build();

        _$failedField = 'pokemonV2ItemByHeldItemId';
        _pokemonV2ItemByHeldItemId?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Evolution', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
