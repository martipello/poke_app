// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_move_holder.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PokemonMoveHolder> _$pokemonMoveHolderSerializer =
    new _$PokemonMoveHolderSerializer();

class _$PokemonMoveHolderSerializer
    implements StructuredSerializer<PokemonMoveHolder> {
  @override
  final Iterable<Type> types = const [PokemonMoveHolder, _$PokemonMoveHolder];
  @override
  final String wireName = 'PokemonMoveHolder';

  @override
  Iterable<Object?> serialize(Serializers serializers, PokemonMoveHolder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.pokemon_v2_move;
    if (value != null) {
      result
        ..add('pokemon_v2_move')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonMove)));
    }
    value = object.pokemon_v2_versiongroup;
    if (value != null) {
      result
        ..add('pokemon_v2_versiongroup')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonResource)));
    }
    value = object.pokemon_v2_movelearnmethod;
    if (value != null) {
      result
        ..add('pokemon_v2_movelearnmethod')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(MoveLearnMethod)));
    }
    return result;
  }

  @override
  PokemonMoveHolder deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonMoveHolderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'pokemon_v2_move':
          result.pokemon_v2_move.replace(serializers.deserialize(value,
              specifiedType: const FullType(PokemonMove))! as PokemonMove);
          break;
        case 'pokemon_v2_versiongroup':
          result.pokemon_v2_versiongroup.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PokemonResource))!
              as PokemonResource);
          break;
        case 'pokemon_v2_movelearnmethod':
          result.pokemon_v2_movelearnmethod.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(MoveLearnMethod))!
              as MoveLearnMethod);
          break;
      }
    }

    return result.build();
  }
}

class _$PokemonMoveHolder extends PokemonMoveHolder {
  @override
  final PokemonMove? pokemon_v2_move;
  @override
  final PokemonResource? pokemon_v2_versiongroup;
  @override
  final MoveLearnMethod? pokemon_v2_movelearnmethod;

  factory _$PokemonMoveHolder(
          [void Function(PokemonMoveHolderBuilder)? updates]) =>
      (new PokemonMoveHolderBuilder()..update(updates))._build();

  _$PokemonMoveHolder._(
      {this.pokemon_v2_move,
      this.pokemon_v2_versiongroup,
      this.pokemon_v2_movelearnmethod})
      : super._();

  @override
  PokemonMoveHolder rebuild(void Function(PokemonMoveHolderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonMoveHolderBuilder toBuilder() =>
      new PokemonMoveHolderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonMoveHolder &&
        pokemon_v2_move == other.pokemon_v2_move &&
        pokemon_v2_versiongroup == other.pokemon_v2_versiongroup &&
        pokemon_v2_movelearnmethod == other.pokemon_v2_movelearnmethod;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, pokemon_v2_move.hashCode), pokemon_v2_versiongroup.hashCode),
        pokemon_v2_movelearnmethod.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PokemonMoveHolder')
          ..add('pokemon_v2_move', pokemon_v2_move)
          ..add('pokemon_v2_versiongroup', pokemon_v2_versiongroup)
          ..add('pokemon_v2_movelearnmethod', pokemon_v2_movelearnmethod))
        .toString();
  }
}

class PokemonMoveHolderBuilder
    implements Builder<PokemonMoveHolder, PokemonMoveHolderBuilder> {
  _$PokemonMoveHolder? _$v;

  PokemonMoveBuilder? _pokemon_v2_move;
  PokemonMoveBuilder get pokemon_v2_move =>
      _$this._pokemon_v2_move ??= new PokemonMoveBuilder();
  set pokemon_v2_move(PokemonMoveBuilder? pokemon_v2_move) =>
      _$this._pokemon_v2_move = pokemon_v2_move;

  PokemonResourceBuilder? _pokemon_v2_versiongroup;
  PokemonResourceBuilder get pokemon_v2_versiongroup =>
      _$this._pokemon_v2_versiongroup ??= new PokemonResourceBuilder();
  set pokemon_v2_versiongroup(
          PokemonResourceBuilder? pokemon_v2_versiongroup) =>
      _$this._pokemon_v2_versiongroup = pokemon_v2_versiongroup;

  MoveLearnMethodBuilder? _pokemon_v2_movelearnmethod;
  MoveLearnMethodBuilder get pokemon_v2_movelearnmethod =>
      _$this._pokemon_v2_movelearnmethod ??= new MoveLearnMethodBuilder();
  set pokemon_v2_movelearnmethod(
          MoveLearnMethodBuilder? pokemon_v2_movelearnmethod) =>
      _$this._pokemon_v2_movelearnmethod = pokemon_v2_movelearnmethod;

  PokemonMoveHolderBuilder();

  PokemonMoveHolderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pokemon_v2_move = $v.pokemon_v2_move?.toBuilder();
      _pokemon_v2_versiongroup = $v.pokemon_v2_versiongroup?.toBuilder();
      _pokemon_v2_movelearnmethod = $v.pokemon_v2_movelearnmethod?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PokemonMoveHolder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PokemonMoveHolder;
  }

  @override
  void update(void Function(PokemonMoveHolderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PokemonMoveHolder build() => _build();

  _$PokemonMoveHolder _build() {
    _$PokemonMoveHolder _$result;
    try {
      _$result = _$v ??
          new _$PokemonMoveHolder._(
              pokemon_v2_move: _pokemon_v2_move?.build(),
              pokemon_v2_versiongroup: _pokemon_v2_versiongroup?.build(),
              pokemon_v2_movelearnmethod: _pokemon_v2_movelearnmethod?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon_v2_move';
        _pokemon_v2_move?.build();
        _$failedField = 'pokemon_v2_versiongroup';
        _pokemon_v2_versiongroup?.build();
        _$failedField = 'pokemon_v2_movelearnmethod';
        _pokemon_v2_movelearnmethod?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PokemonMoveHolder', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
