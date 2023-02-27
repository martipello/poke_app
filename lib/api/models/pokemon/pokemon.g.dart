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
      'pokemon_v2_pokemonabilities',
      serializers.serialize(object.pokemon_v2_pokemonabilities,
          specifiedType: const FullType(
              BuiltList, const [const FullType(PokemonAbilityHolder)])),
      'pokemon_v2_pokemonforms',
      serializers.serialize(object.pokemon_v2_pokemonforms,
          specifiedType: const FullType(
              BuiltList, const [const FullType(PokemonFormWithVersionGroup)])),
      'pokemon_v2_pokemonstats',
      serializers.serialize(object.pokemon_v2_pokemonstats,
          specifiedType:
              const FullType(BuiltList, const [const FullType(PokemonStat)])),
      'pokemon_v2_pokemonmoves',
      serializers.serialize(object.pokemon_v2_pokemonmoves,
          specifiedType: const FullType(
              BuiltList, const [const FullType(PokemonMoveHolder)])),
      'pokemon_v2_encounters',
      serializers.serialize(object.pokemon_v2_encounters,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Encounter)])),
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
    value = object.pokemon_species_id;
    if (value != null) {
      result
        ..add('pokemon_species_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.base_experience;
    if (value != null) {
      result
        ..add('base_experience')
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
        case 'pokemon_species_id':
          result.pokemon_species_id = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'base_experience':
          result.base_experience = serializers.deserialize(value,
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
        case 'pokemon_v2_pokemonabilities':
          result.pokemon_v2_pokemonabilities.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PokemonAbilityHolder)]))!
              as BuiltList<Object?>);
          break;
        case 'pokemon_v2_pokemonspecy':
          result.pokemon_v2_pokemonspecy.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PokemonSpeciesHolder))!
              as PokemonSpeciesHolder);
          break;
        case 'pokemon_v2_pokemonforms':
          result.pokemon_v2_pokemonforms.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(PokemonFormWithVersionGroup)
              ]))! as BuiltList<Object?>);
          break;
        case 'pokemon_v2_pokemonstats':
          result.pokemon_v2_pokemonstats.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PokemonStat)]))!
              as BuiltList<Object?>);
          break;
        case 'pokemon_v2_pokemonmoves':
          result.pokemon_v2_pokemonmoves.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PokemonMoveHolder)]))!
              as BuiltList<Object?>);
          break;
        case 'pokemon_v2_encounters':
          result.pokemon_v2_encounters.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Encounter)]))!
              as BuiltList<Object?>);
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
  final double? pokemon_species_id;
  @override
  final double? base_experience;
  @override
  final BuiltList<SpriteResponse> pokemon_v2_pokemonsprites;
  @override
  final BuiltList<TypeDataHolder> pokemon_v2_pokemontypes;
  @override
  final BuiltList<PokemonAbilityHolder> pokemon_v2_pokemonabilities;
  @override
  final PokemonSpeciesHolder? pokemon_v2_pokemonspecy;
  @override
  final BuiltList<PokemonFormWithVersionGroup> pokemon_v2_pokemonforms;
  @override
  final BuiltList<PokemonStat> pokemon_v2_pokemonstats;
  @override
  final BuiltList<PokemonMoveHolder> pokemon_v2_pokemonmoves;
  @override
  final BuiltList<Encounter> pokemon_v2_encounters;

  factory _$Pokemon([void Function(PokemonBuilder)? updates]) =>
      (new PokemonBuilder()..update(updates))._build();

  _$Pokemon._(
      {this.id,
      this.name,
      this.height,
      this.weight,
      this.pokemon_species_id,
      this.base_experience,
      required this.pokemon_v2_pokemonsprites,
      required this.pokemon_v2_pokemontypes,
      required this.pokemon_v2_pokemonabilities,
      this.pokemon_v2_pokemonspecy,
      required this.pokemon_v2_pokemonforms,
      required this.pokemon_v2_pokemonstats,
      required this.pokemon_v2_pokemonmoves,
      required this.pokemon_v2_encounters})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        pokemon_v2_pokemonsprites, r'Pokemon', 'pokemon_v2_pokemonsprites');
    BuiltValueNullFieldError.checkNotNull(
        pokemon_v2_pokemontypes, r'Pokemon', 'pokemon_v2_pokemontypes');
    BuiltValueNullFieldError.checkNotNull(
        pokemon_v2_pokemonabilities, r'Pokemon', 'pokemon_v2_pokemonabilities');
    BuiltValueNullFieldError.checkNotNull(
        pokemon_v2_pokemonforms, r'Pokemon', 'pokemon_v2_pokemonforms');
    BuiltValueNullFieldError.checkNotNull(
        pokemon_v2_pokemonstats, r'Pokemon', 'pokemon_v2_pokemonstats');
    BuiltValueNullFieldError.checkNotNull(
        pokemon_v2_pokemonmoves, r'Pokemon', 'pokemon_v2_pokemonmoves');
    BuiltValueNullFieldError.checkNotNull(
        pokemon_v2_encounters, r'Pokemon', 'pokemon_v2_encounters');
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
        pokemon_species_id == other.pokemon_species_id &&
        base_experience == other.base_experience &&
        pokemon_v2_pokemonsprites == other.pokemon_v2_pokemonsprites &&
        pokemon_v2_pokemontypes == other.pokemon_v2_pokemontypes &&
        pokemon_v2_pokemonabilities == other.pokemon_v2_pokemonabilities &&
        pokemon_v2_pokemonspecy == other.pokemon_v2_pokemonspecy &&
        pokemon_v2_pokemonforms == other.pokemon_v2_pokemonforms &&
        pokemon_v2_pokemonstats == other.pokemon_v2_pokemonstats &&
        pokemon_v2_pokemonmoves == other.pokemon_v2_pokemonmoves &&
        pokemon_v2_encounters == other.pokemon_v2_encounters;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, height.hashCode);
    _$hash = $jc(_$hash, weight.hashCode);
    _$hash = $jc(_$hash, pokemon_species_id.hashCode);
    _$hash = $jc(_$hash, base_experience.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_pokemonsprites.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_pokemontypes.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_pokemonabilities.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_pokemonspecy.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_pokemonforms.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_pokemonstats.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_pokemonmoves.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_encounters.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Pokemon')
          ..add('id', id)
          ..add('name', name)
          ..add('height', height)
          ..add('weight', weight)
          ..add('pokemon_species_id', pokemon_species_id)
          ..add('base_experience', base_experience)
          ..add('pokemon_v2_pokemonsprites', pokemon_v2_pokemonsprites)
          ..add('pokemon_v2_pokemontypes', pokemon_v2_pokemontypes)
          ..add('pokemon_v2_pokemonabilities', pokemon_v2_pokemonabilities)
          ..add('pokemon_v2_pokemonspecy', pokemon_v2_pokemonspecy)
          ..add('pokemon_v2_pokemonforms', pokemon_v2_pokemonforms)
          ..add('pokemon_v2_pokemonstats', pokemon_v2_pokemonstats)
          ..add('pokemon_v2_pokemonmoves', pokemon_v2_pokemonmoves)
          ..add('pokemon_v2_encounters', pokemon_v2_encounters))
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

  double? _pokemon_species_id;
  double? get pokemon_species_id => _$this._pokemon_species_id;
  set pokemon_species_id(double? pokemon_species_id) =>
      _$this._pokemon_species_id = pokemon_species_id;

  double? _base_experience;
  double? get base_experience => _$this._base_experience;
  set base_experience(double? base_experience) =>
      _$this._base_experience = base_experience;

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

  ListBuilder<PokemonAbilityHolder>? _pokemon_v2_pokemonabilities;
  ListBuilder<PokemonAbilityHolder> get pokemon_v2_pokemonabilities =>
      _$this._pokemon_v2_pokemonabilities ??=
          new ListBuilder<PokemonAbilityHolder>();
  set pokemon_v2_pokemonabilities(
          ListBuilder<PokemonAbilityHolder>? pokemon_v2_pokemonabilities) =>
      _$this._pokemon_v2_pokemonabilities = pokemon_v2_pokemonabilities;

  PokemonSpeciesHolderBuilder? _pokemon_v2_pokemonspecy;
  PokemonSpeciesHolderBuilder get pokemon_v2_pokemonspecy =>
      _$this._pokemon_v2_pokemonspecy ??= new PokemonSpeciesHolderBuilder();
  set pokemon_v2_pokemonspecy(
          PokemonSpeciesHolderBuilder? pokemon_v2_pokemonspecy) =>
      _$this._pokemon_v2_pokemonspecy = pokemon_v2_pokemonspecy;

  ListBuilder<PokemonFormWithVersionGroup>? _pokemon_v2_pokemonforms;
  ListBuilder<PokemonFormWithVersionGroup> get pokemon_v2_pokemonforms =>
      _$this._pokemon_v2_pokemonforms ??=
          new ListBuilder<PokemonFormWithVersionGroup>();
  set pokemon_v2_pokemonforms(
          ListBuilder<PokemonFormWithVersionGroup>? pokemon_v2_pokemonforms) =>
      _$this._pokemon_v2_pokemonforms = pokemon_v2_pokemonforms;

  ListBuilder<PokemonStat>? _pokemon_v2_pokemonstats;
  ListBuilder<PokemonStat> get pokemon_v2_pokemonstats =>
      _$this._pokemon_v2_pokemonstats ??= new ListBuilder<PokemonStat>();
  set pokemon_v2_pokemonstats(
          ListBuilder<PokemonStat>? pokemon_v2_pokemonstats) =>
      _$this._pokemon_v2_pokemonstats = pokemon_v2_pokemonstats;

  ListBuilder<PokemonMoveHolder>? _pokemon_v2_pokemonmoves;
  ListBuilder<PokemonMoveHolder> get pokemon_v2_pokemonmoves =>
      _$this._pokemon_v2_pokemonmoves ??= new ListBuilder<PokemonMoveHolder>();
  set pokemon_v2_pokemonmoves(
          ListBuilder<PokemonMoveHolder>? pokemon_v2_pokemonmoves) =>
      _$this._pokemon_v2_pokemonmoves = pokemon_v2_pokemonmoves;

  ListBuilder<Encounter>? _pokemon_v2_encounters;
  ListBuilder<Encounter> get pokemon_v2_encounters =>
      _$this._pokemon_v2_encounters ??= new ListBuilder<Encounter>();
  set pokemon_v2_encounters(ListBuilder<Encounter>? pokemon_v2_encounters) =>
      _$this._pokemon_v2_encounters = pokemon_v2_encounters;

  PokemonBuilder();

  PokemonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _height = $v.height;
      _weight = $v.weight;
      _pokemon_species_id = $v.pokemon_species_id;
      _base_experience = $v.base_experience;
      _pokemon_v2_pokemonsprites = $v.pokemon_v2_pokemonsprites.toBuilder();
      _pokemon_v2_pokemontypes = $v.pokemon_v2_pokemontypes.toBuilder();
      _pokemon_v2_pokemonabilities = $v.pokemon_v2_pokemonabilities.toBuilder();
      _pokemon_v2_pokemonspecy = $v.pokemon_v2_pokemonspecy?.toBuilder();
      _pokemon_v2_pokemonforms = $v.pokemon_v2_pokemonforms.toBuilder();
      _pokemon_v2_pokemonstats = $v.pokemon_v2_pokemonstats.toBuilder();
      _pokemon_v2_pokemonmoves = $v.pokemon_v2_pokemonmoves.toBuilder();
      _pokemon_v2_encounters = $v.pokemon_v2_encounters.toBuilder();
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
              pokemon_species_id: pokemon_species_id,
              base_experience: base_experience,
              pokemon_v2_pokemonsprites: pokemon_v2_pokemonsprites.build(),
              pokemon_v2_pokemontypes: pokemon_v2_pokemontypes.build(),
              pokemon_v2_pokemonabilities: pokemon_v2_pokemonabilities.build(),
              pokemon_v2_pokemonspecy: _pokemon_v2_pokemonspecy?.build(),
              pokemon_v2_pokemonforms: pokemon_v2_pokemonforms.build(),
              pokemon_v2_pokemonstats: pokemon_v2_pokemonstats.build(),
              pokemon_v2_pokemonmoves: pokemon_v2_pokemonmoves.build(),
              pokemon_v2_encounters: pokemon_v2_encounters.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon_v2_pokemonsprites';
        pokemon_v2_pokemonsprites.build();
        _$failedField = 'pokemon_v2_pokemontypes';
        pokemon_v2_pokemontypes.build();
        _$failedField = 'pokemon_v2_pokemonabilities';
        pokemon_v2_pokemonabilities.build();
        _$failedField = 'pokemon_v2_pokemonspecy';
        _pokemon_v2_pokemonspecy?.build();
        _$failedField = 'pokemon_v2_pokemonforms';
        pokemon_v2_pokemonforms.build();
        _$failedField = 'pokemon_v2_pokemonstats';
        pokemon_v2_pokemonstats.build();
        _$failedField = 'pokemon_v2_pokemonmoves';
        pokemon_v2_pokemonmoves.build();
        _$failedField = 'pokemon_v2_encounters';
        pokemon_v2_encounters.build();
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

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
