// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TypeData> _$typeDataSerializer = new _$TypeDataSerializer();

class _$TypeDataSerializer implements StructuredSerializer<TypeData> {
  @override
  final Iterable<Type> types = const [TypeData, _$TypeData];
  @override
  final String wireName = 'TypeData';

  @override
  Iterable<Object?> serialize(Serializers serializers, TypeData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'pokemonV2TypeefficaciesByTargetTypeId',
      serializers.serialize(object.pokemonV2TypeefficaciesByTargetTypeId,
          specifiedType: const FullType(
              BuiltList, const [const FullType(TypeEfficacies)])),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pokemon_v2_movedamageclass;
    if (value != null) {
      result
        ..add('pokemon_v2_movedamageclass')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonResource)));
    }
    return result;
  }

  @override
  TypeData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TypeDataBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pokemon_v2_movedamageclass':
          result.pokemon_v2_movedamageclass.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(PokemonResource))!
              as PokemonResource);
          break;
        case 'pokemonV2TypeefficaciesByTargetTypeId':
          result.pokemonV2TypeefficaciesByTargetTypeId.replace(
              serializers.deserialize(value,
                      specifiedType: const FullType(
                          BuiltList, const [const FullType(TypeEfficacies)]))!
                  as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$TypeData extends TypeData {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final PokemonResource? pokemon_v2_movedamageclass;
  @override
  final BuiltList<TypeEfficacies> pokemonV2TypeefficaciesByTargetTypeId;

  factory _$TypeData([void Function(TypeDataBuilder)? updates]) =>
      (new TypeDataBuilder()..update(updates))._build();

  _$TypeData._(
      {this.id,
      this.name,
      this.pokemon_v2_movedamageclass,
      required this.pokemonV2TypeefficaciesByTargetTypeId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(pokemonV2TypeefficaciesByTargetTypeId,
        r'TypeData', 'pokemonV2TypeefficaciesByTargetTypeId');
  }

  @override
  TypeData rebuild(void Function(TypeDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TypeDataBuilder toBuilder() => new TypeDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TypeData &&
        id == other.id &&
        name == other.name &&
        pokemon_v2_movedamageclass == other.pokemon_v2_movedamageclass &&
        pokemonV2TypeefficaciesByTargetTypeId ==
            other.pokemonV2TypeefficaciesByTargetTypeId;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), name.hashCode),
            pokemon_v2_movedamageclass.hashCode),
        pokemonV2TypeefficaciesByTargetTypeId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TypeData')
          ..add('id', id)
          ..add('name', name)
          ..add('pokemon_v2_movedamageclass', pokemon_v2_movedamageclass)
          ..add('pokemonV2TypeefficaciesByTargetTypeId',
              pokemonV2TypeefficaciesByTargetTypeId))
        .toString();
  }
}

class TypeDataBuilder implements Builder<TypeData, TypeDataBuilder> {
  _$TypeData? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  PokemonResourceBuilder? _pokemon_v2_movedamageclass;
  PokemonResourceBuilder get pokemon_v2_movedamageclass =>
      _$this._pokemon_v2_movedamageclass ??= new PokemonResourceBuilder();
  set pokemon_v2_movedamageclass(
          PokemonResourceBuilder? pokemon_v2_movedamageclass) =>
      _$this._pokemon_v2_movedamageclass = pokemon_v2_movedamageclass;

  ListBuilder<TypeEfficacies>? _pokemonV2TypeefficaciesByTargetTypeId;
  ListBuilder<TypeEfficacies> get pokemonV2TypeefficaciesByTargetTypeId =>
      _$this._pokemonV2TypeefficaciesByTargetTypeId ??=
          new ListBuilder<TypeEfficacies>();
  set pokemonV2TypeefficaciesByTargetTypeId(
          ListBuilder<TypeEfficacies>? pokemonV2TypeefficaciesByTargetTypeId) =>
      _$this._pokemonV2TypeefficaciesByTargetTypeId =
          pokemonV2TypeefficaciesByTargetTypeId;

  TypeDataBuilder();

  TypeDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _pokemon_v2_movedamageclass = $v.pokemon_v2_movedamageclass?.toBuilder();
      _pokemonV2TypeefficaciesByTargetTypeId =
          $v.pokemonV2TypeefficaciesByTargetTypeId.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TypeData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TypeData;
  }

  @override
  void update(void Function(TypeDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TypeData build() => _build();

  _$TypeData _build() {
    _$TypeData _$result;
    try {
      _$result = _$v ??
          new _$TypeData._(
              id: id,
              name: name,
              pokemon_v2_movedamageclass: _pokemon_v2_movedamageclass?.build(),
              pokemonV2TypeefficaciesByTargetTypeId:
                  pokemonV2TypeefficaciesByTargetTypeId.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon_v2_movedamageclass';
        _pokemon_v2_movedamageclass?.build();
        _$failedField = 'pokemonV2TypeefficaciesByTargetTypeId';
        pokemonV2TypeefficaciesByTargetTypeId.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TypeData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
