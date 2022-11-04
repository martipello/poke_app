// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Pokemon> _$pokemonSerializer = new _$PokemonSerializer();

class _$PokemonSerializer implements StructuredSerializer<Pokemon> {
  @override
  final Iterable<Type> types = const [Pokemon, _$Pokemon];
  @override
  final String wireName = 'Pokemon';

  @override
  Iterable<Object?> serialize(Serializers serializers, Pokemon object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'pokemon_v2_pokemonsprites',
      serializers.serialize(object.pokemon_v2_pokemonsprites,
          specifiedType: const FullType(
              BuiltList, const [const FullType(SpriteResponse)])),
      'pokemon_v2_pokemontypes',
      serializers.serialize(object.pokemon_v2_pokemontypes,
          specifiedType: const FullType(
              BuiltList, const [const FullType(TypeDataHolder)])),
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
    value = object.height;
    if (value != null) {
      result
        ..add('height')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.weight;
    if (value != null) {
      result
        ..add('weight')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.pokemon_v2_pokemonspecy;
    if (value != null) {
      result
        ..add('pokemon_v2_pokemonspecy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonSpeciesHolder)));
    }
    return result;
  }

  @override
  Pokemon deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonBuilder();

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
        case 'height':
          result.height = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'weight':
          result.weight = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'pokemon_v2_pokemonsprites':
          result.pokemon_v2_pokemonsprites.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SpriteResponse)]))!
              as BuiltList<Object?>);
          break;
        case 'pokemon_v2_pokemontypes':
          result.pokemon_v2_pokemontypes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(TypeDataHolder)]))!
              as BuiltList<Object?>);
          break;
        case 'pokemon_v2_pokemonspecy':
          result.pokemon_v2_pokemonspecy.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PokemonSpeciesHolder))!
              as PokemonSpeciesHolder);
          break;
      }
    }

    return result.build();
  }
}

class _$Pokemon extends Pokemon {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final double? height;
  @override
  final double? weight;
  @override
  final BuiltList<SpriteResponse> pokemon_v2_pokemonsprites;
  @override
  final BuiltList<TypeDataHolder> pokemon_v2_pokemontypes;
  @override
  final PokemonSpeciesHolder? pokemon_v2_pokemonspecy;

  factory _$Pokemon([void Function(PokemonBuilder)? updates]) =>
      (new PokemonBuilder()..update(updates))._build();

  _$Pokemon._(
      {this.id,
      this.name,
      this.height,
      this.weight,
      required this.pokemon_v2_pokemonsprites,
      required this.pokemon_v2_pokemontypes,
      this.pokemon_v2_pokemonspecy})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        pokemon_v2_pokemonsprites, r'Pokemon', 'pokemon_v2_pokemonsprites');
    BuiltValueNullFieldError.checkNotNull(
        pokemon_v2_pokemontypes, r'Pokemon', 'pokemon_v2_pokemontypes');
  }

  @override
  Pokemon rebuild(void Function(PokemonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonBuilder toBuilder() => new PokemonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Pokemon &&
        id == other.id &&
        name == other.name &&
        height == other.height &&
        weight == other.weight &&
        pokemon_v2_pokemonsprites == other.pokemon_v2_pokemonsprites &&
        pokemon_v2_pokemontypes == other.pokemon_v2_pokemontypes &&
        pokemon_v2_pokemonspecy == other.pokemon_v2_pokemonspecy;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), name.hashCode),
                        height.hashCode),
                    weight.hashCode),
                pokemon_v2_pokemonsprites.hashCode),
            pokemon_v2_pokemontypes.hashCode),
        pokemon_v2_pokemonspecy.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Pokemon')
          ..add('id', id)
          ..add('name', name)
          ..add('height', height)
          ..add('weight', weight)
          ..add('pokemon_v2_pokemonsprites', pokemon_v2_pokemonsprites)
          ..add('pokemon_v2_pokemontypes', pokemon_v2_pokemontypes)
          ..add('pokemon_v2_pokemonspecy', pokemon_v2_pokemonspecy))
        .toString();
  }
}

class PokemonBuilder implements Builder<Pokemon, PokemonBuilder> {
  _$Pokemon? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  double? _height;
  double? get height => _$this._height;
  set height(double? height) => _$this._height = height;

  double? _weight;
  double? get weight => _$this._weight;
  set weight(double? weight) => _$this._weight = weight;

  ListBuilder<SpriteResponse>? _pokemon_v2_pokemonsprites;
  ListBuilder<SpriteResponse> get pokemon_v2_pokemonsprites =>
      _$this._pokemon_v2_pokemonsprites ??= new ListBuilder<SpriteResponse>();
  set pokemon_v2_pokemonsprites(
          ListBuilder<SpriteResponse>? pokemon_v2_pokemonsprites) =>
      _$this._pokemon_v2_pokemonsprites = pokemon_v2_pokemonsprites;

  ListBuilder<TypeDataHolder>? _pokemon_v2_pokemontypes;
  ListBuilder<TypeDataHolder> get pokemon_v2_pokemontypes =>
      _$this._pokemon_v2_pokemontypes ??= new ListBuilder<TypeDataHolder>();
  set pokemon_v2_pokemontypes(
          ListBuilder<TypeDataHolder>? pokemon_v2_pokemontypes) =>
      _$this._pokemon_v2_pokemontypes = pokemon_v2_pokemontypes;

  PokemonSpeciesHolderBuilder? _pokemon_v2_pokemonspecy;
  PokemonSpeciesHolderBuilder get pokemon_v2_pokemonspecy =>
      _$this._pokemon_v2_pokemonspecy ??= new PokemonSpeciesHolderBuilder();
  set pokemon_v2_pokemonspecy(
          PokemonSpeciesHolderBuilder? pokemon_v2_pokemonspecy) =>
      _$this._pokemon_v2_pokemonspecy = pokemon_v2_pokemonspecy;

  PokemonBuilder();

  PokemonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _height = $v.height;
      _weight = $v.weight;
      _pokemon_v2_pokemonsprites = $v.pokemon_v2_pokemonsprites.toBuilder();
      _pokemon_v2_pokemontypes = $v.pokemon_v2_pokemontypes.toBuilder();
      _pokemon_v2_pokemonspecy = $v.pokemon_v2_pokemonspecy?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Pokemon other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Pokemon;
  }

  @override
  void update(void Function(PokemonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Pokemon build() => _build();

  _$Pokemon _build() {
    _$Pokemon _$result;
    try {
      _$result = _$v ??
          new _$Pokemon._(
              id: id,
              name: name,
              height: height,
              weight: weight,
              pokemon_v2_pokemonsprites: pokemon_v2_pokemonsprites.build(),
              pokemon_v2_pokemontypes: pokemon_v2_pokemontypes.build(),
              pokemon_v2_pokemonspecy: _pokemon_v2_pokemonspecy?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon_v2_pokemonsprites';
        pokemon_v2_pokemonsprites.build();
        _$failedField = 'pokemon_v2_pokemontypes';
        pokemon_v2_pokemontypes.build();
        _$failedField = 'pokemon_v2_pokemonspecy';
        _pokemon_v2_pokemonspecy?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Pokemon', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
