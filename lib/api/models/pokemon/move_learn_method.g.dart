// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_learn_method.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MoveLearnMethod> _$moveLearnMethodSerializer =
    new _$MoveLearnMethodSerializer();

class _$MoveLearnMethodSerializer
    implements StructuredSerializer<MoveLearnMethod> {
  @override
  final Iterable<Type> types = const [MoveLearnMethod, _$MoveLearnMethod];
  @override
  final String wireName = 'MoveLearnMethod';

  @override
  Iterable<Object?> serialize(Serializers serializers, MoveLearnMethod object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'pokemon_v2_versiongroupmovelearnmethods',
      serializers.serialize(object.pokemon_v2_versiongroupmovelearnmethods,
          specifiedType: const FullType(
              BuiltList, const [const FullType(PokemonResource)])),
      'pokemon_v2_movelearnmethoddescriptions',
      serializers.serialize(object.pokemon_v2_movelearnmethoddescriptions,
          specifiedType: const FullType(
              BuiltList, const [const FullType(PokemonResource)])),
    ];
    Object? value;
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
  MoveLearnMethod deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MoveLearnMethodBuilder();

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
        case 'pokemon_v2_versiongroupmovelearnmethods':
          result.pokemon_v2_versiongroupmovelearnmethods.replace(
              serializers.deserialize(value,
                      specifiedType: const FullType(
                          BuiltList, const [const FullType(PokemonResource)]))!
                  as BuiltList<Object?>);
          break;
        case 'pokemon_v2_movelearnmethoddescriptions':
          result.pokemon_v2_movelearnmethoddescriptions.replace(
              serializers.deserialize(value,
                      specifiedType: const FullType(
                          BuiltList, const [const FullType(PokemonResource)]))!
                  as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$MoveLearnMethod extends MoveLearnMethod {
  @override
  final String? name;
  @override
  final BuiltList<PokemonResource> pokemon_v2_versiongroupmovelearnmethods;
  @override
  final BuiltList<PokemonResource> pokemon_v2_movelearnmethoddescriptions;

  factory _$MoveLearnMethod([void Function(MoveLearnMethodBuilder)? updates]) =>
      (new MoveLearnMethodBuilder()..update(updates))._build();

  _$MoveLearnMethod._(
      {this.name,
      required this.pokemon_v2_versiongroupmovelearnmethods,
      required this.pokemon_v2_movelearnmethoddescriptions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        pokemon_v2_versiongroupmovelearnmethods,
        r'MoveLearnMethod',
        'pokemon_v2_versiongroupmovelearnmethods');
    BuiltValueNullFieldError.checkNotNull(
        pokemon_v2_movelearnmethoddescriptions,
        r'MoveLearnMethod',
        'pokemon_v2_movelearnmethoddescriptions');
  }

  @override
  MoveLearnMethod rebuild(void Function(MoveLearnMethodBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MoveLearnMethodBuilder toBuilder() =>
      new MoveLearnMethodBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MoveLearnMethod &&
        name == other.name &&
        pokemon_v2_versiongroupmovelearnmethods ==
            other.pokemon_v2_versiongroupmovelearnmethods &&
        pokemon_v2_movelearnmethoddescriptions ==
            other.pokemon_v2_movelearnmethoddescriptions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_versiongroupmovelearnmethods.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_movelearnmethoddescriptions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MoveLearnMethod')
          ..add('name', name)
          ..add('pokemon_v2_versiongroupmovelearnmethods',
              pokemon_v2_versiongroupmovelearnmethods)
          ..add('pokemon_v2_movelearnmethoddescriptions',
              pokemon_v2_movelearnmethoddescriptions))
        .toString();
  }
}

class MoveLearnMethodBuilder
    implements Builder<MoveLearnMethod, MoveLearnMethodBuilder> {
  _$MoveLearnMethod? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<PokemonResource>? _pokemon_v2_versiongroupmovelearnmethods;
  ListBuilder<PokemonResource> get pokemon_v2_versiongroupmovelearnmethods =>
      _$this._pokemon_v2_versiongroupmovelearnmethods ??=
          new ListBuilder<PokemonResource>();
  set pokemon_v2_versiongroupmovelearnmethods(
          ListBuilder<PokemonResource>?
              pokemon_v2_versiongroupmovelearnmethods) =>
      _$this._pokemon_v2_versiongroupmovelearnmethods =
          pokemon_v2_versiongroupmovelearnmethods;

  ListBuilder<PokemonResource>? _pokemon_v2_movelearnmethoddescriptions;
  ListBuilder<PokemonResource> get pokemon_v2_movelearnmethoddescriptions =>
      _$this._pokemon_v2_movelearnmethoddescriptions ??=
          new ListBuilder<PokemonResource>();
  set pokemon_v2_movelearnmethoddescriptions(
          ListBuilder<PokemonResource>?
              pokemon_v2_movelearnmethoddescriptions) =>
      _$this._pokemon_v2_movelearnmethoddescriptions =
          pokemon_v2_movelearnmethoddescriptions;

  MoveLearnMethodBuilder();

  MoveLearnMethodBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _pokemon_v2_versiongroupmovelearnmethods =
          $v.pokemon_v2_versiongroupmovelearnmethods.toBuilder();
      _pokemon_v2_movelearnmethoddescriptions =
          $v.pokemon_v2_movelearnmethoddescriptions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MoveLearnMethod other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MoveLearnMethod;
  }

  @override
  void update(void Function(MoveLearnMethodBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MoveLearnMethod build() => _build();

  _$MoveLearnMethod _build() {
    _$MoveLearnMethod _$result;
    try {
      _$result = _$v ??
          new _$MoveLearnMethod._(
              name: name,
              pokemon_v2_versiongroupmovelearnmethods:
                  pokemon_v2_versiongroupmovelearnmethods.build(),
              pokemon_v2_movelearnmethoddescriptions:
                  pokemon_v2_movelearnmethoddescriptions.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon_v2_versiongroupmovelearnmethods';
        pokemon_v2_versiongroupmovelearnmethods.build();
        _$failedField = 'pokemon_v2_movelearnmethoddescriptions';
        pokemon_v2_movelearnmethoddescriptions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MoveLearnMethod', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
