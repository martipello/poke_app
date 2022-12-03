// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_species_holder.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PokemonSpeciesHolder> _$pokemonSpeciesHolderSerializer =
    new _$PokemonSpeciesHolderSerializer();

class _$PokemonSpeciesHolderSerializer
    implements StructuredSerializer<PokemonSpeciesHolder> {
  @override
  final Iterable<Type> types = const [
    PokemonSpeciesHolder,
    _$PokemonSpeciesHolder
  ];
  @override
  final String wireName = 'PokemonSpeciesHolder';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PokemonSpeciesHolder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'pokemon_v2_pokemonevolutions',
      serializers.serialize(object.pokemon_v2_pokemonevolutions,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Evolution)])),
      'pokemon_v2_pokemonspeciesnames',
      serializers.serialize(object.pokemon_v2_pokemonspeciesnames,
          specifiedType: const FullType(
              BuiltList, const [const FullType(PokemonSpecies)])),
      'pokemon_v2_pokemons',
      serializers.serialize(object.pokemon_v2_pokemons,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Pokemon)])),
      'pokemon_v2_pokemonegggroups',
      serializers.serialize(object.pokemon_v2_pokemonegggroups,
          specifiedType: const FullType(
              BuiltList, const [const FullType(PokemonResource)])),
      'pokemon_v2_pokemonspeciesflavortexts',
      serializers.serialize(object.pokemon_v2_pokemonspeciesflavortexts,
          specifiedType: const FullType(
              BuiltList, const [const FullType(PokemonResource)])),
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
    value = object.base_happiness;
    if (value != null) {
      result
        ..add('base_happiness')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.capture_rate;
    if (value != null) {
      result
        ..add('capture_rate')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.evolution_chain_id;
    if (value != null) {
      result
        ..add('evolution_chain_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.evolves_from_species_id;
    if (value != null) {
      result
        ..add('evolves_from_species_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.forms_switchable;
    if (value != null) {
      result
        ..add('forms_switchable')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.generation_id;
    if (value != null) {
      result
        ..add('generation_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.is_baby;
    if (value != null) {
      result
        ..add('is_baby')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.is_legendary;
    if (value != null) {
      result
        ..add('is_legendary')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.is_mythical;
    if (value != null) {
      result
        ..add('is_mythical')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hatch_counter;
    if (value != null) {
      result
        ..add('hatch_counter')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.pokemon_v2_pokemonshape;
    if (value != null) {
      result
        ..add('pokemon_v2_pokemonshape')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonResource)));
    }
    value = object.pokemon_v2_pokemonhabitat;
    if (value != null) {
      result
        ..add('pokemon_v2_pokemonhabitat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonResource)));
    }
    value = object.gender_rate;
    if (value != null) {
      result
        ..add('gender_rate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.pokemon_v2_pokemoncolor;
    if (value != null) {
      result
        ..add('pokemon_v2_pokemoncolor')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonResource)));
    }
    return result;
  }

  @override
  PokemonSpeciesHolder deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonSpeciesHolderBuilder();

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
        case 'base_happiness':
          result.base_happiness = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'capture_rate':
          result.capture_rate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'evolution_chain_id':
          result.evolution_chain_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'evolves_from_species_id':
          result.evolves_from_species_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'forms_switchable':
          result.forms_switchable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'generation_id':
          result.generation_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_baby':
          result.is_baby = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'is_legendary':
          result.is_legendary = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'is_mythical':
          result.is_mythical = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'pokemon_v2_pokemonevolutions':
          result.pokemon_v2_pokemonevolutions.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Evolution)]))!
              as BuiltList<Object?>);
          break;
        case 'pokemon_v2_pokemonspeciesnames':
          result.pokemon_v2_pokemonspeciesnames.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PokemonSpecies)]))!
              as BuiltList<Object?>);
          break;
        case 'pokemon_v2_pokemons':
          result.pokemon_v2_pokemons.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Pokemon)]))!
              as BuiltList<Object?>);
          break;
        case 'hatch_counter':
          result.hatch_counter = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'pokemon_v2_pokemonshape':
          result.pokemon_v2_pokemonshape.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PokemonResource))!
              as PokemonResource);
          break;
        case 'pokemon_v2_pokemonhabitat':
          result.pokemon_v2_pokemonhabitat.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(PokemonResource))!
              as PokemonResource);
          break;
        case 'gender_rate':
          result.gender_rate = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'pokemon_v2_pokemonegggroups':
          result.pokemon_v2_pokemonegggroups.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PokemonResource)]))!
              as BuiltList<Object?>);
          break;
        case 'pokemon_v2_pokemonspeciesflavortexts':
          result.pokemon_v2_pokemonspeciesflavortexts.replace(
              serializers.deserialize(value,
                      specifiedType: const FullType(
                          BuiltList, const [const FullType(PokemonResource)]))!
                  as BuiltList<Object?>);
          break;
        case 'pokemon_v2_pokemoncolor':
          result.pokemon_v2_pokemoncolor.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PokemonResource))!
              as PokemonResource);
          break;
      }
    }

    return result.build();
  }
}

class _$PokemonSpeciesHolder extends PokemonSpeciesHolder {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final double? base_happiness;
  @override
  final int? capture_rate;
  @override
  final int? evolution_chain_id;
  @override
  final int? evolves_from_species_id;
  @override
  final bool? forms_switchable;
  @override
  final int? generation_id;
  @override
  final bool? is_baby;
  @override
  final bool? is_legendary;
  @override
  final bool? is_mythical;
  @override
  final BuiltList<Evolution> pokemon_v2_pokemonevolutions;
  @override
  final BuiltList<PokemonSpecies> pokemon_v2_pokemonspeciesnames;
  @override
  final BuiltList<Pokemon> pokemon_v2_pokemons;
  @override
  final double? hatch_counter;
  @override
  final PokemonResource? pokemon_v2_pokemonshape;
  @override
  final PokemonResource? pokemon_v2_pokemonhabitat;
  @override
  final double? gender_rate;
  @override
  final BuiltList<PokemonResource> pokemon_v2_pokemonegggroups;
  @override
  final BuiltList<PokemonResource> pokemon_v2_pokemonspeciesflavortexts;
  @override
  final PokemonResource? pokemon_v2_pokemoncolor;

  factory _$PokemonSpeciesHolder(
          [void Function(PokemonSpeciesHolderBuilder)? updates]) =>
      (new PokemonSpeciesHolderBuilder()..update(updates))._build();

  _$PokemonSpeciesHolder._(
      {this.id,
      this.name,
      this.base_happiness,
      this.capture_rate,
      this.evolution_chain_id,
      this.evolves_from_species_id,
      this.forms_switchable,
      this.generation_id,
      this.is_baby,
      this.is_legendary,
      this.is_mythical,
      required this.pokemon_v2_pokemonevolutions,
      required this.pokemon_v2_pokemonspeciesnames,
      required this.pokemon_v2_pokemons,
      this.hatch_counter,
      this.pokemon_v2_pokemonshape,
      this.pokemon_v2_pokemonhabitat,
      this.gender_rate,
      required this.pokemon_v2_pokemonegggroups,
      required this.pokemon_v2_pokemonspeciesflavortexts,
      this.pokemon_v2_pokemoncolor})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(pokemon_v2_pokemonevolutions,
        r'PokemonSpeciesHolder', 'pokemon_v2_pokemonevolutions');
    BuiltValueNullFieldError.checkNotNull(pokemon_v2_pokemonspeciesnames,
        r'PokemonSpeciesHolder', 'pokemon_v2_pokemonspeciesnames');
    BuiltValueNullFieldError.checkNotNull(
        pokemon_v2_pokemons, r'PokemonSpeciesHolder', 'pokemon_v2_pokemons');
    BuiltValueNullFieldError.checkNotNull(pokemon_v2_pokemonegggroups,
        r'PokemonSpeciesHolder', 'pokemon_v2_pokemonegggroups');
    BuiltValueNullFieldError.checkNotNull(pokemon_v2_pokemonspeciesflavortexts,
        r'PokemonSpeciesHolder', 'pokemon_v2_pokemonspeciesflavortexts');
  }

  @override
  PokemonSpeciesHolder rebuild(
          void Function(PokemonSpeciesHolderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonSpeciesHolderBuilder toBuilder() =>
      new PokemonSpeciesHolderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonSpeciesHolder &&
        id == other.id &&
        name == other.name &&
        base_happiness == other.base_happiness &&
        capture_rate == other.capture_rate &&
        evolution_chain_id == other.evolution_chain_id &&
        evolves_from_species_id == other.evolves_from_species_id &&
        forms_switchable == other.forms_switchable &&
        generation_id == other.generation_id &&
        is_baby == other.is_baby &&
        is_legendary == other.is_legendary &&
        is_mythical == other.is_mythical &&
        pokemon_v2_pokemonevolutions == other.pokemon_v2_pokemonevolutions &&
        pokemon_v2_pokemonspeciesnames ==
            other.pokemon_v2_pokemonspeciesnames &&
        pokemon_v2_pokemons == other.pokemon_v2_pokemons &&
        hatch_counter == other.hatch_counter &&
        pokemon_v2_pokemonshape == other.pokemon_v2_pokemonshape &&
        pokemon_v2_pokemonhabitat == other.pokemon_v2_pokemonhabitat &&
        gender_rate == other.gender_rate &&
        pokemon_v2_pokemonegggroups == other.pokemon_v2_pokemonegggroups &&
        pokemon_v2_pokemonspeciesflavortexts ==
            other.pokemon_v2_pokemonspeciesflavortexts &&
        pokemon_v2_pokemoncolor == other.pokemon_v2_pokemoncolor;
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
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc(0, id.hashCode), name.hashCode),
                                                                                base_happiness.hashCode),
                                                                            capture_rate.hashCode),
                                                                        evolution_chain_id.hashCode),
                                                                    evolves_from_species_id.hashCode),
                                                                forms_switchable.hashCode),
                                                            generation_id.hashCode),
                                                        is_baby.hashCode),
                                                    is_legendary.hashCode),
                                                is_mythical.hashCode),
                                            pokemon_v2_pokemonevolutions.hashCode),
                                        pokemon_v2_pokemonspeciesnames.hashCode),
                                    pokemon_v2_pokemons.hashCode),
                                hatch_counter.hashCode),
                            pokemon_v2_pokemonshape.hashCode),
                        pokemon_v2_pokemonhabitat.hashCode),
                    gender_rate.hashCode),
                pokemon_v2_pokemonegggroups.hashCode),
            pokemon_v2_pokemonspeciesflavortexts.hashCode),
        pokemon_v2_pokemoncolor.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PokemonSpeciesHolder')
          ..add('id', id)
          ..add('name', name)
          ..add('base_happiness', base_happiness)
          ..add('capture_rate', capture_rate)
          ..add('evolution_chain_id', evolution_chain_id)
          ..add('evolves_from_species_id', evolves_from_species_id)
          ..add('forms_switchable', forms_switchable)
          ..add('generation_id', generation_id)
          ..add('is_baby', is_baby)
          ..add('is_legendary', is_legendary)
          ..add('is_mythical', is_mythical)
          ..add('pokemon_v2_pokemonevolutions', pokemon_v2_pokemonevolutions)
          ..add(
              'pokemon_v2_pokemonspeciesnames', pokemon_v2_pokemonspeciesnames)
          ..add('pokemon_v2_pokemons', pokemon_v2_pokemons)
          ..add('hatch_counter', hatch_counter)
          ..add('pokemon_v2_pokemonshape', pokemon_v2_pokemonshape)
          ..add('pokemon_v2_pokemonhabitat', pokemon_v2_pokemonhabitat)
          ..add('gender_rate', gender_rate)
          ..add('pokemon_v2_pokemonegggroups', pokemon_v2_pokemonegggroups)
          ..add('pokemon_v2_pokemonspeciesflavortexts',
              pokemon_v2_pokemonspeciesflavortexts)
          ..add('pokemon_v2_pokemoncolor', pokemon_v2_pokemoncolor))
        .toString();
  }
}

class PokemonSpeciesHolderBuilder
    implements Builder<PokemonSpeciesHolder, PokemonSpeciesHolderBuilder> {
  _$PokemonSpeciesHolder? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  double? _base_happiness;
  double? get base_happiness => _$this._base_happiness;
  set base_happiness(double? base_happiness) =>
      _$this._base_happiness = base_happiness;

  int? _capture_rate;
  int? get capture_rate => _$this._capture_rate;
  set capture_rate(int? capture_rate) => _$this._capture_rate = capture_rate;

  int? _evolution_chain_id;
  int? get evolution_chain_id => _$this._evolution_chain_id;
  set evolution_chain_id(int? evolution_chain_id) =>
      _$this._evolution_chain_id = evolution_chain_id;

  int? _evolves_from_species_id;
  int? get evolves_from_species_id => _$this._evolves_from_species_id;
  set evolves_from_species_id(int? evolves_from_species_id) =>
      _$this._evolves_from_species_id = evolves_from_species_id;

  bool? _forms_switchable;
  bool? get forms_switchable => _$this._forms_switchable;
  set forms_switchable(bool? forms_switchable) =>
      _$this._forms_switchable = forms_switchable;

  int? _generation_id;
  int? get generation_id => _$this._generation_id;
  set generation_id(int? generation_id) =>
      _$this._generation_id = generation_id;

  bool? _is_baby;
  bool? get is_baby => _$this._is_baby;
  set is_baby(bool? is_baby) => _$this._is_baby = is_baby;

  bool? _is_legendary;
  bool? get is_legendary => _$this._is_legendary;
  set is_legendary(bool? is_legendary) => _$this._is_legendary = is_legendary;

  bool? _is_mythical;
  bool? get is_mythical => _$this._is_mythical;
  set is_mythical(bool? is_mythical) => _$this._is_mythical = is_mythical;

  ListBuilder<Evolution>? _pokemon_v2_pokemonevolutions;
  ListBuilder<Evolution> get pokemon_v2_pokemonevolutions =>
      _$this._pokemon_v2_pokemonevolutions ??= new ListBuilder<Evolution>();
  set pokemon_v2_pokemonevolutions(
          ListBuilder<Evolution>? pokemon_v2_pokemonevolutions) =>
      _$this._pokemon_v2_pokemonevolutions = pokemon_v2_pokemonevolutions;

  ListBuilder<PokemonSpecies>? _pokemon_v2_pokemonspeciesnames;
  ListBuilder<PokemonSpecies> get pokemon_v2_pokemonspeciesnames =>
      _$this._pokemon_v2_pokemonspeciesnames ??=
          new ListBuilder<PokemonSpecies>();
  set pokemon_v2_pokemonspeciesnames(
          ListBuilder<PokemonSpecies>? pokemon_v2_pokemonspeciesnames) =>
      _$this._pokemon_v2_pokemonspeciesnames = pokemon_v2_pokemonspeciesnames;

  ListBuilder<Pokemon>? _pokemon_v2_pokemons;
  ListBuilder<Pokemon> get pokemon_v2_pokemons =>
      _$this._pokemon_v2_pokemons ??= new ListBuilder<Pokemon>();
  set pokemon_v2_pokemons(ListBuilder<Pokemon>? pokemon_v2_pokemons) =>
      _$this._pokemon_v2_pokemons = pokemon_v2_pokemons;

  double? _hatch_counter;
  double? get hatch_counter => _$this._hatch_counter;
  set hatch_counter(double? hatch_counter) =>
      _$this._hatch_counter = hatch_counter;

  PokemonResourceBuilder? _pokemon_v2_pokemonshape;
  PokemonResourceBuilder get pokemon_v2_pokemonshape =>
      _$this._pokemon_v2_pokemonshape ??= new PokemonResourceBuilder();
  set pokemon_v2_pokemonshape(
          PokemonResourceBuilder? pokemon_v2_pokemonshape) =>
      _$this._pokemon_v2_pokemonshape = pokemon_v2_pokemonshape;

  PokemonResourceBuilder? _pokemon_v2_pokemonhabitat;
  PokemonResourceBuilder get pokemon_v2_pokemonhabitat =>
      _$this._pokemon_v2_pokemonhabitat ??= new PokemonResourceBuilder();
  set pokemon_v2_pokemonhabitat(
          PokemonResourceBuilder? pokemon_v2_pokemonhabitat) =>
      _$this._pokemon_v2_pokemonhabitat = pokemon_v2_pokemonhabitat;

  double? _gender_rate;
  double? get gender_rate => _$this._gender_rate;
  set gender_rate(double? gender_rate) => _$this._gender_rate = gender_rate;

  ListBuilder<PokemonResource>? _pokemon_v2_pokemonegggroups;
  ListBuilder<PokemonResource> get pokemon_v2_pokemonegggroups =>
      _$this._pokemon_v2_pokemonegggroups ??=
          new ListBuilder<PokemonResource>();
  set pokemon_v2_pokemonegggroups(
          ListBuilder<PokemonResource>? pokemon_v2_pokemonegggroups) =>
      _$this._pokemon_v2_pokemonegggroups = pokemon_v2_pokemonegggroups;

  ListBuilder<PokemonResource>? _pokemon_v2_pokemonspeciesflavortexts;
  ListBuilder<PokemonResource> get pokemon_v2_pokemonspeciesflavortexts =>
      _$this._pokemon_v2_pokemonspeciesflavortexts ??=
          new ListBuilder<PokemonResource>();
  set pokemon_v2_pokemonspeciesflavortexts(
          ListBuilder<PokemonResource>? pokemon_v2_pokemonspeciesflavortexts) =>
      _$this._pokemon_v2_pokemonspeciesflavortexts =
          pokemon_v2_pokemonspeciesflavortexts;

  PokemonResourceBuilder? _pokemon_v2_pokemoncolor;
  PokemonResourceBuilder get pokemon_v2_pokemoncolor =>
      _$this._pokemon_v2_pokemoncolor ??= new PokemonResourceBuilder();
  set pokemon_v2_pokemoncolor(
          PokemonResourceBuilder? pokemon_v2_pokemoncolor) =>
      _$this._pokemon_v2_pokemoncolor = pokemon_v2_pokemoncolor;

  PokemonSpeciesHolderBuilder();

  PokemonSpeciesHolderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _base_happiness = $v.base_happiness;
      _capture_rate = $v.capture_rate;
      _evolution_chain_id = $v.evolution_chain_id;
      _evolves_from_species_id = $v.evolves_from_species_id;
      _forms_switchable = $v.forms_switchable;
      _generation_id = $v.generation_id;
      _is_baby = $v.is_baby;
      _is_legendary = $v.is_legendary;
      _is_mythical = $v.is_mythical;
      _pokemon_v2_pokemonevolutions =
          $v.pokemon_v2_pokemonevolutions.toBuilder();
      _pokemon_v2_pokemonspeciesnames =
          $v.pokemon_v2_pokemonspeciesnames.toBuilder();
      _pokemon_v2_pokemons = $v.pokemon_v2_pokemons.toBuilder();
      _hatch_counter = $v.hatch_counter;
      _pokemon_v2_pokemonshape = $v.pokemon_v2_pokemonshape?.toBuilder();
      _pokemon_v2_pokemonhabitat = $v.pokemon_v2_pokemonhabitat?.toBuilder();
      _gender_rate = $v.gender_rate;
      _pokemon_v2_pokemonegggroups = $v.pokemon_v2_pokemonegggroups.toBuilder();
      _pokemon_v2_pokemonspeciesflavortexts =
          $v.pokemon_v2_pokemonspeciesflavortexts.toBuilder();
      _pokemon_v2_pokemoncolor = $v.pokemon_v2_pokemoncolor?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PokemonSpeciesHolder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PokemonSpeciesHolder;
  }

  @override
  void update(void Function(PokemonSpeciesHolderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PokemonSpeciesHolder build() => _build();

  _$PokemonSpeciesHolder _build() {
    _$PokemonSpeciesHolder _$result;
    try {
      _$result = _$v ??
          new _$PokemonSpeciesHolder._(
              id: id,
              name: name,
              base_happiness: base_happiness,
              capture_rate: capture_rate,
              evolution_chain_id: evolution_chain_id,
              evolves_from_species_id: evolves_from_species_id,
              forms_switchable: forms_switchable,
              generation_id: generation_id,
              is_baby: is_baby,
              is_legendary: is_legendary,
              is_mythical: is_mythical,
              pokemon_v2_pokemonevolutions:
                  pokemon_v2_pokemonevolutions.build(),
              pokemon_v2_pokemonspeciesnames:
                  pokemon_v2_pokemonspeciesnames.build(),
              pokemon_v2_pokemons: pokemon_v2_pokemons.build(),
              hatch_counter: hatch_counter,
              pokemon_v2_pokemonshape: _pokemon_v2_pokemonshape?.build(),
              pokemon_v2_pokemonhabitat: _pokemon_v2_pokemonhabitat?.build(),
              gender_rate: gender_rate,
              pokemon_v2_pokemonegggroups: pokemon_v2_pokemonegggroups.build(),
              pokemon_v2_pokemonspeciesflavortexts:
                  pokemon_v2_pokemonspeciesflavortexts.build(),
              pokemon_v2_pokemoncolor: _pokemon_v2_pokemoncolor?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon_v2_pokemonevolutions';
        pokemon_v2_pokemonevolutions.build();
        _$failedField = 'pokemon_v2_pokemonspeciesnames';
        pokemon_v2_pokemonspeciesnames.build();
        _$failedField = 'pokemon_v2_pokemons';
        pokemon_v2_pokemons.build();

        _$failedField = 'pokemon_v2_pokemonshape';
        _pokemon_v2_pokemonshape?.build();
        _$failedField = 'pokemon_v2_pokemonhabitat';
        _pokemon_v2_pokemonhabitat?.build();

        _$failedField = 'pokemon_v2_pokemonegggroups';
        pokemon_v2_pokemonegggroups.build();
        _$failedField = 'pokemon_v2_pokemonspeciesflavortexts';
        pokemon_v2_pokemonspeciesflavortexts.build();
        _$failedField = 'pokemon_v2_pokemoncolor';
        _pokemon_v2_pokemoncolor?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PokemonSpeciesHolder', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
