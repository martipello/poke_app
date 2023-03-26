// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encounter_slot.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EncounterSlot> _$encounterSlotSerializer = new _$EncounterSlotSerializer();

class _$EncounterSlotSerializer implements StructuredSerializer<EncounterSlot> {
  @override
  final Iterable<Type> types = const [EncounterSlot, _$EncounterSlot];
  @override
  final String wireName = 'EncounterSlot';

  @override
  Iterable<Object?> serialize(Serializers serializers, EncounterSlot object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.rarity;
    if (value != null) {
      result
        ..add('rarity')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pokemon_v2_locationarea;
    if (value != null) {
      result
        ..add('pokemon_v2_locationarea')
        ..add(serializers.serialize(value, specifiedType: const FullType(Encounter)));
    }
    value = object.pokemon_v2_encountermethod;
    if (value != null) {
      result
        ..add('pokemon_v2_encountermethod')
        ..add(serializers.serialize(value, specifiedType: const FullType(EncounterMethod)));
    }
    return result;
  }

  @override
  EncounterSlot deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EncounterSlotBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'rarity':
          result.rarity = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'pokemon_v2_locationarea':
          result.pokemon_v2_locationarea
              .replace(serializers.deserialize(value, specifiedType: const FullType(Encounter))! as Encounter);
          break;
        case 'pokemon_v2_encountermethod':
          result.pokemon_v2_encountermethod.replace(
              serializers.deserialize(value, specifiedType: const FullType(EncounterMethod))! as EncounterMethod);
          break;
      }
    }

    return result.build();
  }
}

class _$EncounterSlot extends EncounterSlot {
  @override
  final int? id;
  @override
  final int? rarity;
  @override
  final Encounter? pokemon_v2_locationarea;
  @override
  final EncounterMethod? pokemon_v2_encountermethod;

  factory _$EncounterSlot([void Function(EncounterSlotBuilder)? updates]) =>
      (new EncounterSlotBuilder()..update(updates))._build();

  _$EncounterSlot._({this.id, this.rarity, this.pokemon_v2_locationarea, this.pokemon_v2_encountermethod}) : super._();

  @override
  EncounterSlot rebuild(void Function(EncounterSlotBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  EncounterSlotBuilder toBuilder() => new EncounterSlotBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EncounterSlot &&
        id == other.id &&
        rarity == other.rarity &&
        pokemon_v2_locationarea == other.pokemon_v2_locationarea &&
        pokemon_v2_encountermethod == other.pokemon_v2_encountermethod;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, rarity.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_locationarea.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_encountermethod.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EncounterSlot')
          ..add('id', id)
          ..add('rarity', rarity)
          ..add('pokemon_v2_locationarea', pokemon_v2_locationarea)
          ..add('pokemon_v2_encountermethod', pokemon_v2_encountermethod))
        .toString();
  }
}

class EncounterSlotBuilder implements Builder<EncounterSlot, EncounterSlotBuilder> {
  _$EncounterSlot? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _rarity;
  int? get rarity => _$this._rarity;
  set rarity(int? rarity) => _$this._rarity = rarity;

  EncounterBuilder? _pokemon_v2_locationarea;
  EncounterBuilder get pokemon_v2_locationarea => _$this._pokemon_v2_locationarea ??= new EncounterBuilder();
  set pokemon_v2_locationarea(EncounterBuilder? pokemon_v2_locationarea) =>
      _$this._pokemon_v2_locationarea = pokemon_v2_locationarea;

  EncounterMethodBuilder? _pokemon_v2_encountermethod;
  EncounterMethodBuilder get pokemon_v2_encountermethod =>
      _$this._pokemon_v2_encountermethod ??= new EncounterMethodBuilder();
  set pokemon_v2_encountermethod(EncounterMethodBuilder? pokemon_v2_encountermethod) =>
      _$this._pokemon_v2_encountermethod = pokemon_v2_encountermethod;

  EncounterSlotBuilder();

  EncounterSlotBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _rarity = $v.rarity;
      _pokemon_v2_locationarea = $v.pokemon_v2_locationarea?.toBuilder();
      _pokemon_v2_encountermethod = $v.pokemon_v2_encountermethod?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EncounterSlot other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EncounterSlot;
  }

  @override
  void update(void Function(EncounterSlotBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EncounterSlot build() => _build();

  _$EncounterSlot _build() {
    _$EncounterSlot _$result;
    try {
      _$result = _$v ??
          new _$EncounterSlot._(
              id: id,
              rarity: rarity,
              pokemon_v2_locationarea: _pokemon_v2_locationarea?.build(),
              pokemon_v2_encountermethod: _pokemon_v2_encountermethod?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon_v2_locationarea';
        _pokemon_v2_locationarea?.build();
        _$failedField = 'pokemon_v2_encountermethod';
        _pokemon_v2_encountermethod?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(r'EncounterSlot', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
