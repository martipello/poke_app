// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machine.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Machine> _$machineSerializer = new _$MachineSerializer();

class _$MachineSerializer implements StructuredSerializer<Machine> {
  @override
  final Iterable<Type> types = const [Machine, _$Machine];
  @override
  final String wireName = 'Machine';

  @override
  Iterable<Object?> serialize(Serializers serializers, Machine object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.machine_number;
    if (value != null) {
      result
        ..add('machine_number')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
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
  Machine deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MachineBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'machine_number':
          result.machine_number = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'pokemon_v2_versiongroup':
          result.pokemon_v2_versiongroup.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PokemonResource))!
              as PokemonResource);
          break;
      }
    }

    return result.build();
  }
}

class _$Machine extends Machine {
  @override
  final int? machine_number;
  @override
  final PokemonResource? pokemon_v2_versiongroup;

  factory _$Machine([void Function(MachineBuilder)? updates]) =>
      (new MachineBuilder()..update(updates))._build();

  _$Machine._({this.machine_number, this.pokemon_v2_versiongroup}) : super._();

  @override
  Machine rebuild(void Function(MachineBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MachineBuilder toBuilder() => new MachineBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Machine &&
        machine_number == other.machine_number &&
        pokemon_v2_versiongroup == other.pokemon_v2_versiongroup;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, machine_number.hashCode), pokemon_v2_versiongroup.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Machine')
          ..add('machine_number', machine_number)
          ..add('pokemon_v2_versiongroup', pokemon_v2_versiongroup))
        .toString();
  }
}

class MachineBuilder implements Builder<Machine, MachineBuilder> {
  _$Machine? _$v;

  int? _machine_number;
  int? get machine_number => _$this._machine_number;
  set machine_number(int? machine_number) =>
      _$this._machine_number = machine_number;

  PokemonResourceBuilder? _pokemon_v2_versiongroup;
  PokemonResourceBuilder get pokemon_v2_versiongroup =>
      _$this._pokemon_v2_versiongroup ??= new PokemonResourceBuilder();
  set pokemon_v2_versiongroup(
          PokemonResourceBuilder? pokemon_v2_versiongroup) =>
      _$this._pokemon_v2_versiongroup = pokemon_v2_versiongroup;

  MachineBuilder();

  MachineBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _machine_number = $v.machine_number;
      _pokemon_v2_versiongroup = $v.pokemon_v2_versiongroup?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Machine other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Machine;
  }

  @override
  void update(void Function(MachineBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Machine build() => _build();

  _$Machine _build() {
    _$Machine _$result;
    try {
      _$result = _$v ??
          new _$Machine._(
              machine_number: machine_number,
              pokemon_v2_versiongroup: _pokemon_v2_versiongroup?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon_v2_versiongroup';
        _pokemon_v2_versiongroup?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Machine', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
