// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Stat> _$statSerializer = new _$StatSerializer();

class _$StatSerializer implements StructuredSerializer<Stat> {
  @override
  final Iterable<Type> types = const [Stat, _$Stat];
  @override
  final String wireName = 'Stat';

  @override
  Iterable<Object?> serialize(Serializers serializers, Stat object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.move_damage_class_id;
    if (value != null) {
      result
        ..add('move_damage_class_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.is_battle_only;
    if (value != null) {
      result
        ..add('is_battle_only')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.game_index;
    if (value != null) {
      result
        ..add('game_index')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Stat deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StatBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'move_damage_class_id':
          result.move_damage_class_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_battle_only':
          result.is_battle_only = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'game_index':
          result.game_index = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$Stat extends Stat {
  @override
  final String? name;
  @override
  final int? move_damage_class_id;
  @override
  final bool? is_battle_only;
  @override
  final int? game_index;

  factory _$Stat([void Function(StatBuilder)? updates]) =>
      (new StatBuilder()..update(updates))._build();

  _$Stat._(
      {this.name,
      this.move_damage_class_id,
      this.is_battle_only,
      this.game_index})
      : super._();

  @override
  Stat rebuild(void Function(StatBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StatBuilder toBuilder() => new StatBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Stat &&
        name == other.name &&
        move_damage_class_id == other.move_damage_class_id &&
        is_battle_only == other.is_battle_only &&
        game_index == other.game_index;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, move_damage_class_id.hashCode);
    _$hash = $jc(_$hash, is_battle_only.hashCode);
    _$hash = $jc(_$hash, game_index.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Stat')
          ..add('name', name)
          ..add('move_damage_class_id', move_damage_class_id)
          ..add('is_battle_only', is_battle_only)
          ..add('game_index', game_index))
        .toString();
  }
}

class StatBuilder implements Builder<Stat, StatBuilder> {
  _$Stat? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _move_damage_class_id;
  int? get move_damage_class_id => _$this._move_damage_class_id;
  set move_damage_class_id(int? move_damage_class_id) =>
      _$this._move_damage_class_id = move_damage_class_id;

  bool? _is_battle_only;
  bool? get is_battle_only => _$this._is_battle_only;
  set is_battle_only(bool? is_battle_only) =>
      _$this._is_battle_only = is_battle_only;

  int? _game_index;
  int? get game_index => _$this._game_index;
  set game_index(int? game_index) => _$this._game_index = game_index;

  StatBuilder();

  StatBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _move_damage_class_id = $v.move_damage_class_id;
      _is_battle_only = $v.is_battle_only;
      _game_index = $v.game_index;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Stat other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Stat;
  }

  @override
  void update(void Function(StatBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Stat build() => _build();

  _$Stat _build() {
    final _$result = _$v ??
        new _$Stat._(
            name: name,
            move_damage_class_id: move_damage_class_id,
            is_battle_only: is_battle_only,
            game_index: game_index);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
