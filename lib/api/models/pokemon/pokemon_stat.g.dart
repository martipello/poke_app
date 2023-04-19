// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_stat.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PokemonStat> _$pokemonStatSerializer = new _$PokemonStatSerializer();

class _$PokemonStatSerializer implements StructuredSerializer<PokemonStat> {
  @override
  final Iterable<Type> types = const [PokemonStat, _$PokemonStat];
  @override
  final String wireName = 'PokemonStat';

  @override
  Iterable<Object?> serialize(Serializers serializers, PokemonStat object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.base_stat;
    if (value != null) {
      result
        ..add('base_stat')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.effort;
    if (value != null) {
      result
        ..add('effort')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.stat_id;
    if (value != null) {
      result
        ..add('stat_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pokemon_v2_stat;
    if (value != null) {
      result
        ..add('pokemon_v2_stat')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Stat)));
    }
    return result;
  }

  @override
  PokemonStat deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonStatBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'base_stat':
          result.base_stat = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'effort':
          result.effort = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'stat_id':
          result.stat_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'pokemon_v2_stat':
          result.pokemon_v2_stat.replace(serializers.deserialize(value,
              specifiedType: const FullType(Stat))! as Stat);
          break;
      }
    }

    return result.build();
  }
}

class _$PokemonStat extends PokemonStat {
  @override
  final int? base_stat;
  @override
  final int? effort;
  @override
  final int? stat_id;
  @override
  final Stat? pokemon_v2_stat;

  factory _$PokemonStat([void Function(PokemonStatBuilder)? updates]) =>
      (new PokemonStatBuilder()..update(updates))._build();

  _$PokemonStat._(
      {this.base_stat, this.effort, this.stat_id, this.pokemon_v2_stat})
      : super._();

  @override
  PokemonStat rebuild(void Function(PokemonStatBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonStatBuilder toBuilder() => new PokemonStatBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonStat &&
        base_stat == other.base_stat &&
        effort == other.effort &&
        stat_id == other.stat_id &&
        pokemon_v2_stat == other.pokemon_v2_stat;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, base_stat.hashCode);
    _$hash = $jc(_$hash, effort.hashCode);
    _$hash = $jc(_$hash, stat_id.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_stat.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PokemonStat')
          ..add('base_stat', base_stat)
          ..add('effort', effort)
          ..add('stat_id', stat_id)
          ..add('pokemon_v2_stat', pokemon_v2_stat))
        .toString();
  }
}

class PokemonStatBuilder implements Builder<PokemonStat, PokemonStatBuilder> {
  _$PokemonStat? _$v;

  int? _base_stat;
  int? get base_stat => _$this._base_stat;
  set base_stat(int? base_stat) => _$this._base_stat = base_stat;

  int? _effort;
  int? get effort => _$this._effort;
  set effort(int? effort) => _$this._effort = effort;

  int? _stat_id;
  int? get stat_id => _$this._stat_id;
  set stat_id(int? stat_id) => _$this._stat_id = stat_id;

  StatBuilder? _pokemon_v2_stat;
  StatBuilder get pokemon_v2_stat =>
      _$this._pokemon_v2_stat ??= new StatBuilder();
  set pokemon_v2_stat(StatBuilder? pokemon_v2_stat) =>
      _$this._pokemon_v2_stat = pokemon_v2_stat;

  PokemonStatBuilder();

  PokemonStatBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _base_stat = $v.base_stat;
      _effort = $v.effort;
      _stat_id = $v.stat_id;
      _pokemon_v2_stat = $v.pokemon_v2_stat?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PokemonStat other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PokemonStat;
  }

  @override
  void update(void Function(PokemonStatBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PokemonStat build() => _build();

  _$PokemonStat _build() {
    _$PokemonStat _$result;
    try {
      _$result = _$v ??
          new _$PokemonStat._(
              base_stat: base_stat,
              effort: effort,
              stat_id: stat_id,
              pokemon_v2_stat: _pokemon_v2_stat?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon_v2_stat';
        _pokemon_v2_stat?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PokemonStat', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
