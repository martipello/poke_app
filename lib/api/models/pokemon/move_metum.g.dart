// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_metum.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MoveMetum> _$moveMetumSerializer = new _$MoveMetumSerializer();

class _$MoveMetumSerializer implements StructuredSerializer<MoveMetum> {
  @override
  final Iterable<Type> types = const [MoveMetum, _$MoveMetum];
  @override
  final String wireName = 'MoveMetum';

  @override
  Iterable<Object?> serialize(Serializers serializers, MoveMetum object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.crit_rate;
    if (value != null) {
      result
        ..add('crit_rate')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.ailment_chance;
    if (value != null) {
      result
        ..add('ailment_chance')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.flinch_chance;
    if (value != null) {
      result
        ..add('flinch_chance')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.drain;
    if (value != null) {
      result
        ..add('drain')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.max_hits;
    if (value != null) {
      result
        ..add('max_hits')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.max_turns;
    if (value != null) {
      result
        ..add('max_turns')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.min_hits;
    if (value != null) {
      result
        ..add('min_hits')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.min_turns;
    if (value != null) {
      result
        ..add('min_turns')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.stat_chance;
    if (value != null) {
      result
        ..add('stat_chance')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.healing;
    if (value != null) {
      result
        ..add('healing')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pokemon_v2_movemetaailment;
    if (value != null) {
      result
        ..add('pokemon_v2_movemetaailment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonResource)));
    }
    value = object.pokemon_v2_movemetacategory;
    if (value != null) {
      result
        ..add('pokemon_v2_movemetacategory')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonResource)));
    }
    return result;
  }

  @override
  MoveMetum deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MoveMetumBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'crit_rate':
          result.crit_rate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'ailment_chance':
          result.ailment_chance = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'flinch_chance':
          result.flinch_chance = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'drain':
          result.drain = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'max_hits':
          result.max_hits = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'max_turns':
          result.max_turns = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'min_hits':
          result.min_hits = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'min_turns':
          result.min_turns = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'stat_chance':
          result.stat_chance = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'healing':
          result.healing = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'pokemon_v2_movemetaailment':
          result.pokemon_v2_movemetaailment.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(PokemonResource))!
              as PokemonResource);
          break;
        case 'pokemon_v2_movemetacategory':
          result.pokemon_v2_movemetacategory.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(PokemonResource))!
              as PokemonResource);
          break;
      }
    }

    return result.build();
  }
}

class _$MoveMetum extends MoveMetum {
  @override
  final int? crit_rate;
  @override
  final int? ailment_chance;
  @override
  final int? flinch_chance;
  @override
  final int? drain;
  @override
  final int? max_hits;
  @override
  final int? max_turns;
  @override
  final int? min_hits;
  @override
  final int? min_turns;
  @override
  final int? stat_chance;
  @override
  final int? healing;
  @override
  final PokemonResource? pokemon_v2_movemetaailment;
  @override
  final PokemonResource? pokemon_v2_movemetacategory;

  factory _$MoveMetum([void Function(MoveMetumBuilder)? updates]) =>
      (new MoveMetumBuilder()..update(updates))._build();

  _$MoveMetum._(
      {this.crit_rate,
      this.ailment_chance,
      this.flinch_chance,
      this.drain,
      this.max_hits,
      this.max_turns,
      this.min_hits,
      this.min_turns,
      this.stat_chance,
      this.healing,
      this.pokemon_v2_movemetaailment,
      this.pokemon_v2_movemetacategory})
      : super._();

  @override
  MoveMetum rebuild(void Function(MoveMetumBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MoveMetumBuilder toBuilder() => new MoveMetumBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MoveMetum &&
        crit_rate == other.crit_rate &&
        ailment_chance == other.ailment_chance &&
        flinch_chance == other.flinch_chance &&
        drain == other.drain &&
        max_hits == other.max_hits &&
        max_turns == other.max_turns &&
        min_hits == other.min_hits &&
        min_turns == other.min_turns &&
        stat_chance == other.stat_chance &&
        healing == other.healing &&
        pokemon_v2_movemetaailment == other.pokemon_v2_movemetaailment &&
        pokemon_v2_movemetacategory == other.pokemon_v2_movemetacategory;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, crit_rate.hashCode),
                                                ailment_chance.hashCode),
                                            flinch_chance.hashCode),
                                        drain.hashCode),
                                    max_hits.hashCode),
                                max_turns.hashCode),
                            min_hits.hashCode),
                        min_turns.hashCode),
                    stat_chance.hashCode),
                healing.hashCode),
            pokemon_v2_movemetaailment.hashCode),
        pokemon_v2_movemetacategory.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MoveMetum')
          ..add('crit_rate', crit_rate)
          ..add('ailment_chance', ailment_chance)
          ..add('flinch_chance', flinch_chance)
          ..add('drain', drain)
          ..add('max_hits', max_hits)
          ..add('max_turns', max_turns)
          ..add('min_hits', min_hits)
          ..add('min_turns', min_turns)
          ..add('stat_chance', stat_chance)
          ..add('healing', healing)
          ..add('pokemon_v2_movemetaailment', pokemon_v2_movemetaailment)
          ..add('pokemon_v2_movemetacategory', pokemon_v2_movemetacategory))
        .toString();
  }
}

class MoveMetumBuilder implements Builder<MoveMetum, MoveMetumBuilder> {
  _$MoveMetum? _$v;

  int? _crit_rate;
  int? get crit_rate => _$this._crit_rate;
  set crit_rate(int? crit_rate) => _$this._crit_rate = crit_rate;

  int? _ailment_chance;
  int? get ailment_chance => _$this._ailment_chance;
  set ailment_chance(int? ailment_chance) =>
      _$this._ailment_chance = ailment_chance;

  int? _flinch_chance;
  int? get flinch_chance => _$this._flinch_chance;
  set flinch_chance(int? flinch_chance) =>
      _$this._flinch_chance = flinch_chance;

  int? _drain;
  int? get drain => _$this._drain;
  set drain(int? drain) => _$this._drain = drain;

  int? _max_hits;
  int? get max_hits => _$this._max_hits;
  set max_hits(int? max_hits) => _$this._max_hits = max_hits;

  int? _max_turns;
  int? get max_turns => _$this._max_turns;
  set max_turns(int? max_turns) => _$this._max_turns = max_turns;

  int? _min_hits;
  int? get min_hits => _$this._min_hits;
  set min_hits(int? min_hits) => _$this._min_hits = min_hits;

  int? _min_turns;
  int? get min_turns => _$this._min_turns;
  set min_turns(int? min_turns) => _$this._min_turns = min_turns;

  int? _stat_chance;
  int? get stat_chance => _$this._stat_chance;
  set stat_chance(int? stat_chance) => _$this._stat_chance = stat_chance;

  int? _healing;
  int? get healing => _$this._healing;
  set healing(int? healing) => _$this._healing = healing;

  PokemonResourceBuilder? _pokemon_v2_movemetaailment;
  PokemonResourceBuilder get pokemon_v2_movemetaailment =>
      _$this._pokemon_v2_movemetaailment ??= new PokemonResourceBuilder();
  set pokemon_v2_movemetaailment(
          PokemonResourceBuilder? pokemon_v2_movemetaailment) =>
      _$this._pokemon_v2_movemetaailment = pokemon_v2_movemetaailment;

  PokemonResourceBuilder? _pokemon_v2_movemetacategory;
  PokemonResourceBuilder get pokemon_v2_movemetacategory =>
      _$this._pokemon_v2_movemetacategory ??= new PokemonResourceBuilder();
  set pokemon_v2_movemetacategory(
          PokemonResourceBuilder? pokemon_v2_movemetacategory) =>
      _$this._pokemon_v2_movemetacategory = pokemon_v2_movemetacategory;

  MoveMetumBuilder();

  MoveMetumBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _crit_rate = $v.crit_rate;
      _ailment_chance = $v.ailment_chance;
      _flinch_chance = $v.flinch_chance;
      _drain = $v.drain;
      _max_hits = $v.max_hits;
      _max_turns = $v.max_turns;
      _min_hits = $v.min_hits;
      _min_turns = $v.min_turns;
      _stat_chance = $v.stat_chance;
      _healing = $v.healing;
      _pokemon_v2_movemetaailment = $v.pokemon_v2_movemetaailment?.toBuilder();
      _pokemon_v2_movemetacategory =
          $v.pokemon_v2_movemetacategory?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MoveMetum other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MoveMetum;
  }

  @override
  void update(void Function(MoveMetumBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MoveMetum build() => _build();

  _$MoveMetum _build() {
    _$MoveMetum _$result;
    try {
      _$result = _$v ??
          new _$MoveMetum._(
              crit_rate: crit_rate,
              ailment_chance: ailment_chance,
              flinch_chance: flinch_chance,
              drain: drain,
              max_hits: max_hits,
              max_turns: max_turns,
              min_hits: min_hits,
              min_turns: min_turns,
              stat_chance: stat_chance,
              healing: healing,
              pokemon_v2_movemetaailment: _pokemon_v2_movemetaailment?.build(),
              pokemon_v2_movemetacategory:
                  _pokemon_v2_movemetacategory?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon_v2_movemetaailment';
        _pokemon_v2_movemetaailment?.build();
        _$failedField = 'pokemon_v2_movemetacategory';
        _pokemon_v2_movemetacategory?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MoveMetum', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
