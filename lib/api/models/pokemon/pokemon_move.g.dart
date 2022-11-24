// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_move.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PokemonMove> _$pokemonMoveSerializer = new _$PokemonMoveSerializer();

class _$PokemonMoveSerializer implements StructuredSerializer<PokemonMove> {
  @override
  final Iterable<Type> types = const [PokemonMove, _$PokemonMove];
  @override
  final String wireName = 'PokemonMove';

  @override
  Iterable<Object?> serialize(Serializers serializers, PokemonMove object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'pokemon_v2_moveflavortexts',
      serializers.serialize(object.pokemon_v2_moveflavortexts,
          specifiedType: const FullType(
              BuiltList, const [const FullType(PokemonResource)])),
      'machines',
      serializers.serialize(object.machines,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Machine)])),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.accuracy;
    if (value != null) {
      result
        ..add('accuracy')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.move_effect_chance;
    if (value != null) {
      result
        ..add('move_effect_chance')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.priority;
    if (value != null) {
      result
        ..add('priority')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pp;
    if (value != null) {
      result
        ..add('pp')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.power;
    if (value != null) {
      result
        ..add('power')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.super_contest_effect_id;
    if (value != null) {
      result
        ..add('super_contest_effect_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.type_id;
    if (value != null) {
      result
        ..add('type_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pokemon_v2_generation;
    if (value != null) {
      result
        ..add('pokemon_v2_generation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonResource)));
    }
    value = object.pokemon_v2_type;
    if (value != null) {
      result
        ..add('pokemon_v2_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(TypeData)));
    }
    value = object.pokemon_v2_movemetum;
    if (value != null) {
      result
        ..add('pokemon_v2_movemetum')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(MoveMetum)));
    }
    return result;
  }

  @override
  PokemonMove deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonMoveBuilder();

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
        case 'accuracy':
          result.accuracy = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'move_effect_chance':
          result.move_effect_chance = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'priority':
          result.priority = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'pp':
          result.pp = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'power':
          result.power = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'super_contest_effect_id':
          result.super_contest_effect_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'type_id':
          result.type_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'pokemon_v2_generation':
          result.pokemon_v2_generation.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PokemonResource))!
              as PokemonResource);
          break;
        case 'pokemon_v2_moveflavortexts':
          result.pokemon_v2_moveflavortexts.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PokemonResource)]))!
              as BuiltList<Object?>);
          break;
        case 'pokemon_v2_type':
          result.pokemon_v2_type.replace(serializers.deserialize(value,
              specifiedType: const FullType(TypeData))! as TypeData);
          break;
        case 'machines':
          result.machines.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Machine)]))!
              as BuiltList<Object?>);
          break;
        case 'pokemon_v2_movemetum':
          result.pokemon_v2_movemetum.replace(serializers.deserialize(value,
              specifiedType: const FullType(MoveMetum))! as MoveMetum);
          break;
      }
    }

    return result.build();
  }
}

class _$PokemonMove extends PokemonMove {
  @override
  final int? id;
  @override
  final int? accuracy;
  @override
  final int? move_effect_chance;
  @override
  final String? name;
  @override
  final int? priority;
  @override
  final int? pp;
  @override
  final int? power;
  @override
  final int? super_contest_effect_id;
  @override
  final int? type_id;
  @override
  final PokemonResource? pokemon_v2_generation;
  @override
  final BuiltList<PokemonResource> pokemon_v2_moveflavortexts;
  @override
  final TypeData? pokemon_v2_type;
  @override
  final BuiltList<Machine> machines;
  @override
  final MoveMetum? pokemon_v2_movemetum;

  factory _$PokemonMove([void Function(PokemonMoveBuilder)? updates]) =>
      (new PokemonMoveBuilder()..update(updates))._build();

  _$PokemonMove._(
      {this.id,
      this.accuracy,
      this.move_effect_chance,
      this.name,
      this.priority,
      this.pp,
      this.power,
      this.super_contest_effect_id,
      this.type_id,
      this.pokemon_v2_generation,
      required this.pokemon_v2_moveflavortexts,
      this.pokemon_v2_type,
      required this.machines,
      this.pokemon_v2_movemetum})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(pokemon_v2_moveflavortexts,
        r'PokemonMove', 'pokemon_v2_moveflavortexts');
    BuiltValueNullFieldError.checkNotNull(machines, r'PokemonMove', 'machines');
  }

  @override
  PokemonMove rebuild(void Function(PokemonMoveBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonMoveBuilder toBuilder() => new PokemonMoveBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonMove &&
        id == other.id &&
        accuracy == other.accuracy &&
        move_effect_chance == other.move_effect_chance &&
        name == other.name &&
        priority == other.priority &&
        pp == other.pp &&
        power == other.power &&
        super_contest_effect_id == other.super_contest_effect_id &&
        type_id == other.type_id &&
        pokemon_v2_generation == other.pokemon_v2_generation &&
        pokemon_v2_moveflavortexts == other.pokemon_v2_moveflavortexts &&
        pokemon_v2_type == other.pokemon_v2_type &&
        machines == other.machines &&
        pokemon_v2_movemetum == other.pokemon_v2_movemetum;
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
                                            $jc(
                                                $jc(
                                                    $jc($jc(0, id.hashCode),
                                                        accuracy.hashCode),
                                                    move_effect_chance
                                                        .hashCode),
                                                name.hashCode),
                                            priority.hashCode),
                                        pp.hashCode),
                                    power.hashCode),
                                super_contest_effect_id.hashCode),
                            type_id.hashCode),
                        pokemon_v2_generation.hashCode),
                    pokemon_v2_moveflavortexts.hashCode),
                pokemon_v2_type.hashCode),
            machines.hashCode),
        pokemon_v2_movemetum.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PokemonMove')
          ..add('id', id)
          ..add('accuracy', accuracy)
          ..add('move_effect_chance', move_effect_chance)
          ..add('name', name)
          ..add('priority', priority)
          ..add('pp', pp)
          ..add('power', power)
          ..add('super_contest_effect_id', super_contest_effect_id)
          ..add('type_id', type_id)
          ..add('pokemon_v2_generation', pokemon_v2_generation)
          ..add('pokemon_v2_moveflavortexts', pokemon_v2_moveflavortexts)
          ..add('pokemon_v2_type', pokemon_v2_type)
          ..add('machines', machines)
          ..add('pokemon_v2_movemetum', pokemon_v2_movemetum))
        .toString();
  }
}

class PokemonMoveBuilder implements Builder<PokemonMove, PokemonMoveBuilder> {
  _$PokemonMove? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _accuracy;
  int? get accuracy => _$this._accuracy;
  set accuracy(int? accuracy) => _$this._accuracy = accuracy;

  int? _move_effect_chance;
  int? get move_effect_chance => _$this._move_effect_chance;
  set move_effect_chance(int? move_effect_chance) =>
      _$this._move_effect_chance = move_effect_chance;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _priority;
  int? get priority => _$this._priority;
  set priority(int? priority) => _$this._priority = priority;

  int? _pp;
  int? get pp => _$this._pp;
  set pp(int? pp) => _$this._pp = pp;

  int? _power;
  int? get power => _$this._power;
  set power(int? power) => _$this._power = power;

  int? _super_contest_effect_id;
  int? get super_contest_effect_id => _$this._super_contest_effect_id;
  set super_contest_effect_id(int? super_contest_effect_id) =>
      _$this._super_contest_effect_id = super_contest_effect_id;

  int? _type_id;
  int? get type_id => _$this._type_id;
  set type_id(int? type_id) => _$this._type_id = type_id;

  PokemonResourceBuilder? _pokemon_v2_generation;
  PokemonResourceBuilder get pokemon_v2_generation =>
      _$this._pokemon_v2_generation ??= new PokemonResourceBuilder();
  set pokemon_v2_generation(PokemonResourceBuilder? pokemon_v2_generation) =>
      _$this._pokemon_v2_generation = pokemon_v2_generation;

  ListBuilder<PokemonResource>? _pokemon_v2_moveflavortexts;
  ListBuilder<PokemonResource> get pokemon_v2_moveflavortexts =>
      _$this._pokemon_v2_moveflavortexts ??= new ListBuilder<PokemonResource>();
  set pokemon_v2_moveflavortexts(
          ListBuilder<PokemonResource>? pokemon_v2_moveflavortexts) =>
      _$this._pokemon_v2_moveflavortexts = pokemon_v2_moveflavortexts;

  TypeDataBuilder? _pokemon_v2_type;
  TypeDataBuilder get pokemon_v2_type =>
      _$this._pokemon_v2_type ??= new TypeDataBuilder();
  set pokemon_v2_type(TypeDataBuilder? pokemon_v2_type) =>
      _$this._pokemon_v2_type = pokemon_v2_type;

  ListBuilder<Machine>? _machines;
  ListBuilder<Machine> get machines =>
      _$this._machines ??= new ListBuilder<Machine>();
  set machines(ListBuilder<Machine>? machines) => _$this._machines = machines;

  MoveMetumBuilder? _pokemon_v2_movemetum;
  MoveMetumBuilder get pokemon_v2_movemetum =>
      _$this._pokemon_v2_movemetum ??= new MoveMetumBuilder();
  set pokemon_v2_movemetum(MoveMetumBuilder? pokemon_v2_movemetum) =>
      _$this._pokemon_v2_movemetum = pokemon_v2_movemetum;

  PokemonMoveBuilder();

  PokemonMoveBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _accuracy = $v.accuracy;
      _move_effect_chance = $v.move_effect_chance;
      _name = $v.name;
      _priority = $v.priority;
      _pp = $v.pp;
      _power = $v.power;
      _super_contest_effect_id = $v.super_contest_effect_id;
      _type_id = $v.type_id;
      _pokemon_v2_generation = $v.pokemon_v2_generation?.toBuilder();
      _pokemon_v2_moveflavortexts = $v.pokemon_v2_moveflavortexts.toBuilder();
      _pokemon_v2_type = $v.pokemon_v2_type?.toBuilder();
      _machines = $v.machines.toBuilder();
      _pokemon_v2_movemetum = $v.pokemon_v2_movemetum?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PokemonMove other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PokemonMove;
  }

  @override
  void update(void Function(PokemonMoveBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PokemonMove build() => _build();

  _$PokemonMove _build() {
    _$PokemonMove _$result;
    try {
      _$result = _$v ??
          new _$PokemonMove._(
              id: id,
              accuracy: accuracy,
              move_effect_chance: move_effect_chance,
              name: name,
              priority: priority,
              pp: pp,
              power: power,
              super_contest_effect_id: super_contest_effect_id,
              type_id: type_id,
              pokemon_v2_generation: _pokemon_v2_generation?.build(),
              pokemon_v2_moveflavortexts: pokemon_v2_moveflavortexts.build(),
              pokemon_v2_type: _pokemon_v2_type?.build(),
              machines: machines.build(),
              pokemon_v2_movemetum: _pokemon_v2_movemetum?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon_v2_generation';
        _pokemon_v2_generation?.build();
        _$failedField = 'pokemon_v2_moveflavortexts';
        pokemon_v2_moveflavortexts.build();
        _$failedField = 'pokemon_v2_type';
        _pokemon_v2_type?.build();
        _$failedField = 'machines';
        machines.build();
        _$failedField = 'pokemon_v2_movemetum';
        _pokemon_v2_movemetum?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PokemonMove', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
