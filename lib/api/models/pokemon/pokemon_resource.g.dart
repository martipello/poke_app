// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_resource.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PokemonResource> _$pokemonResourceSerializer =
    new _$PokemonResourceSerializer();

class _$PokemonResourceSerializer
    implements StructuredSerializer<PokemonResource> {
  @override
  final Iterable<Type> types = const [PokemonResource, _$PokemonResource];
  @override
  final String wireName = 'PokemonResource';

  @override
  Iterable<Object?> serialize(Serializers serializers, PokemonResource object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'pokemon_v2_movedamageclassdescriptions',
      serializers.serialize(object.pokemon_v2_movedamageclassdescriptions,
          specifiedType: const FullType(
              BuiltList, const [const FullType(PokemonResource)])),
      'pokemon_v2_evolutiontriggernames',
      serializers.serialize(object.pokemon_v2_evolutiontriggernames,
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
    value = object.pokemon_name;
    if (value != null) {
      result
        ..add('pokemon_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.flavor_text;
    if (value != null) {
      result
        ..add('flavor_text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.version_id;
    if (value != null) {
      result
        ..add('version_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pokemon_species_id;
    if (value != null) {
      result
        ..add('pokemon_species_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.short_effect;
    if (value != null) {
      result
        ..add('short_effect')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pokemon_v2_version;
    if (value != null) {
      result
        ..add('pokemon_v2_version')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonResource)));
    }
    value = object.pokemon_v2_region;
    if (value != null) {
      result
        ..add('pokemon_v2_region')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonResource)));
    }
    value = object.pokemon_v2_versiongroup;
    if (value != null) {
      result
        ..add('pokemon_v2_versiongroup')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonResource)));
    }
    value = object.pokemon_v2_egggroup;
    if (value != null) {
      result
        ..add('pokemon_v2_egggroup')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonResource)));
    }
    value = object.pokemon_v2_movedamageclass;
    if (value != null) {
      result
        ..add('pokemon_v2_movedamageclass')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonResource)));
    }
    value = object.pokemon_v2_movelearnmethod;
    if (value != null) {
      result
        ..add('pokemon_v2_movelearnmethod')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonResource)));
    }
    value = object.pokemon_v2_ability;
    if (value != null) {
      result
        ..add('pokemon_v2_ability')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PokemonAbility)));
    }
    return result;
  }

  @override
  PokemonResource deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonResourceBuilder();

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
        case 'pokemon_name':
          result.pokemon_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'flavor_text':
          result.flavor_text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'version_id':
          result.version_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'pokemon_species_id':
          result.pokemon_species_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'short_effect':
          result.short_effect = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pokemon_v2_version':
          result.pokemon_v2_version.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PokemonResource))!
              as PokemonResource);
          break;
        case 'pokemon_v2_region':
          result.pokemon_v2_region.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PokemonResource))!
              as PokemonResource);
          break;
        case 'pokemon_v2_versiongroup':
          result.pokemon_v2_versiongroup.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PokemonResource))!
              as PokemonResource);
          break;
        case 'pokemon_v2_egggroup':
          result.pokemon_v2_egggroup.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PokemonResource))!
              as PokemonResource);
          break;
        case 'pokemon_v2_movedamageclass':
          result.pokemon_v2_movedamageclass.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(PokemonResource))!
              as PokemonResource);
          break;
        case 'pokemon_v2_movedamageclassdescriptions':
          result.pokemon_v2_movedamageclassdescriptions.replace(
              serializers.deserialize(value,
                      specifiedType: const FullType(
                          BuiltList, const [const FullType(PokemonResource)]))!
                  as BuiltList<Object?>);
          break;
        case 'pokemon_v2_movelearnmethod':
          result.pokemon_v2_movelearnmethod.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(PokemonResource))!
              as PokemonResource);
          break;
        case 'pokemon_v2_evolutiontriggernames':
          result.pokemon_v2_evolutiontriggernames.replace(
              serializers.deserialize(value,
                      specifiedType: const FullType(
                          BuiltList, const [const FullType(PokemonResource)]))!
                  as BuiltList<Object?>);
          break;
        case 'pokemon_v2_ability':
          result.pokemon_v2_ability.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PokemonAbility))!
              as PokemonAbility);
          break;
      }
    }

    return result.build();
  }
}

class _$PokemonResource extends PokemonResource {
  @override
  final String? name;
  @override
  final String? pokemon_name;
  @override
  final String? description;
  @override
  final int? id;
  @override
  final String? flavor_text;
  @override
  final int? version_id;
  @override
  final int? pokemon_species_id;
  @override
  final String? short_effect;
  @override
  final PokemonResource? pokemon_v2_version;
  @override
  final PokemonResource? pokemon_v2_region;
  @override
  final PokemonResource? pokemon_v2_versiongroup;
  @override
  final PokemonResource? pokemon_v2_egggroup;
  @override
  final PokemonResource? pokemon_v2_movedamageclass;
  @override
  final BuiltList<PokemonResource> pokemon_v2_movedamageclassdescriptions;
  @override
  final PokemonResource? pokemon_v2_movelearnmethod;
  @override
  final BuiltList<PokemonResource> pokemon_v2_evolutiontriggernames;
  @override
  final PokemonAbility? pokemon_v2_ability;

  factory _$PokemonResource([void Function(PokemonResourceBuilder)? updates]) =>
      (new PokemonResourceBuilder()..update(updates))._build();

  _$PokemonResource._(
      {this.name,
      this.pokemon_name,
      this.description,
      this.id,
      this.flavor_text,
      this.version_id,
      this.pokemon_species_id,
      this.short_effect,
      this.pokemon_v2_version,
      this.pokemon_v2_region,
      this.pokemon_v2_versiongroup,
      this.pokemon_v2_egggroup,
      this.pokemon_v2_movedamageclass,
      required this.pokemon_v2_movedamageclassdescriptions,
      this.pokemon_v2_movelearnmethod,
      required this.pokemon_v2_evolutiontriggernames,
      this.pokemon_v2_ability})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        pokemon_v2_movedamageclassdescriptions,
        r'PokemonResource',
        'pokemon_v2_movedamageclassdescriptions');
    BuiltValueNullFieldError.checkNotNull(pokemon_v2_evolutiontriggernames,
        r'PokemonResource', 'pokemon_v2_evolutiontriggernames');
  }

  @override
  PokemonResource rebuild(void Function(PokemonResourceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonResourceBuilder toBuilder() =>
      new PokemonResourceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonResource &&
        name == other.name &&
        pokemon_name == other.pokemon_name &&
        description == other.description &&
        id == other.id &&
        flavor_text == other.flavor_text &&
        version_id == other.version_id &&
        pokemon_species_id == other.pokemon_species_id &&
        short_effect == other.short_effect &&
        pokemon_v2_version == other.pokemon_v2_version &&
        pokemon_v2_region == other.pokemon_v2_region &&
        pokemon_v2_versiongroup == other.pokemon_v2_versiongroup &&
        pokemon_v2_egggroup == other.pokemon_v2_egggroup &&
        pokemon_v2_movedamageclass == other.pokemon_v2_movedamageclass &&
        pokemon_v2_movedamageclassdescriptions ==
            other.pokemon_v2_movedamageclassdescriptions &&
        pokemon_v2_movelearnmethod == other.pokemon_v2_movelearnmethod &&
        pokemon_v2_evolutiontriggernames ==
            other.pokemon_v2_evolutiontriggernames &&
        pokemon_v2_ability == other.pokemon_v2_ability;
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
                                                                        0,
                                                                        name
                                                                            .hashCode),
                                                                    pokemon_name
                                                                        .hashCode),
                                                                description
                                                                    .hashCode),
                                                            id.hashCode),
                                                        flavor_text.hashCode),
                                                    version_id.hashCode),
                                                pokemon_species_id.hashCode),
                                            short_effect.hashCode),
                                        pokemon_v2_version.hashCode),
                                    pokemon_v2_region.hashCode),
                                pokemon_v2_versiongroup.hashCode),
                            pokemon_v2_egggroup.hashCode),
                        pokemon_v2_movedamageclass.hashCode),
                    pokemon_v2_movedamageclassdescriptions.hashCode),
                pokemon_v2_movelearnmethod.hashCode),
            pokemon_v2_evolutiontriggernames.hashCode),
        pokemon_v2_ability.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PokemonResource')
          ..add('name', name)
          ..add('pokemon_name', pokemon_name)
          ..add('description', description)
          ..add('id', id)
          ..add('flavor_text', flavor_text)
          ..add('version_id', version_id)
          ..add('pokemon_species_id', pokemon_species_id)
          ..add('short_effect', short_effect)
          ..add('pokemon_v2_version', pokemon_v2_version)
          ..add('pokemon_v2_region', pokemon_v2_region)
          ..add('pokemon_v2_versiongroup', pokemon_v2_versiongroup)
          ..add('pokemon_v2_egggroup', pokemon_v2_egggroup)
          ..add('pokemon_v2_movedamageclass', pokemon_v2_movedamageclass)
          ..add('pokemon_v2_movedamageclassdescriptions',
              pokemon_v2_movedamageclassdescriptions)
          ..add('pokemon_v2_movelearnmethod', pokemon_v2_movelearnmethod)
          ..add('pokemon_v2_evolutiontriggernames',
              pokemon_v2_evolutiontriggernames)
          ..add('pokemon_v2_ability', pokemon_v2_ability))
        .toString();
  }
}

class PokemonResourceBuilder
    implements Builder<PokemonResource, PokemonResourceBuilder> {
  _$PokemonResource? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _pokemon_name;
  String? get pokemon_name => _$this._pokemon_name;
  set pokemon_name(String? pokemon_name) => _$this._pokemon_name = pokemon_name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _flavor_text;
  String? get flavor_text => _$this._flavor_text;
  set flavor_text(String? flavor_text) => _$this._flavor_text = flavor_text;

  int? _version_id;
  int? get version_id => _$this._version_id;
  set version_id(int? version_id) => _$this._version_id = version_id;

  int? _pokemon_species_id;
  int? get pokemon_species_id => _$this._pokemon_species_id;
  set pokemon_species_id(int? pokemon_species_id) =>
      _$this._pokemon_species_id = pokemon_species_id;

  String? _short_effect;
  String? get short_effect => _$this._short_effect;
  set short_effect(String? short_effect) => _$this._short_effect = short_effect;

  PokemonResourceBuilder? _pokemon_v2_version;
  PokemonResourceBuilder get pokemon_v2_version =>
      _$this._pokemon_v2_version ??= new PokemonResourceBuilder();
  set pokemon_v2_version(PokemonResourceBuilder? pokemon_v2_version) =>
      _$this._pokemon_v2_version = pokemon_v2_version;

  PokemonResourceBuilder? _pokemon_v2_region;
  PokemonResourceBuilder get pokemon_v2_region =>
      _$this._pokemon_v2_region ??= new PokemonResourceBuilder();
  set pokemon_v2_region(PokemonResourceBuilder? pokemon_v2_region) =>
      _$this._pokemon_v2_region = pokemon_v2_region;

  PokemonResourceBuilder? _pokemon_v2_versiongroup;
  PokemonResourceBuilder get pokemon_v2_versiongroup =>
      _$this._pokemon_v2_versiongroup ??= new PokemonResourceBuilder();
  set pokemon_v2_versiongroup(
          PokemonResourceBuilder? pokemon_v2_versiongroup) =>
      _$this._pokemon_v2_versiongroup = pokemon_v2_versiongroup;

  PokemonResourceBuilder? _pokemon_v2_egggroup;
  PokemonResourceBuilder get pokemon_v2_egggroup =>
      _$this._pokemon_v2_egggroup ??= new PokemonResourceBuilder();
  set pokemon_v2_egggroup(PokemonResourceBuilder? pokemon_v2_egggroup) =>
      _$this._pokemon_v2_egggroup = pokemon_v2_egggroup;

  PokemonResourceBuilder? _pokemon_v2_movedamageclass;
  PokemonResourceBuilder get pokemon_v2_movedamageclass =>
      _$this._pokemon_v2_movedamageclass ??= new PokemonResourceBuilder();
  set pokemon_v2_movedamageclass(
          PokemonResourceBuilder? pokemon_v2_movedamageclass) =>
      _$this._pokemon_v2_movedamageclass = pokemon_v2_movedamageclass;

  ListBuilder<PokemonResource>? _pokemon_v2_movedamageclassdescriptions;
  ListBuilder<PokemonResource> get pokemon_v2_movedamageclassdescriptions =>
      _$this._pokemon_v2_movedamageclassdescriptions ??=
          new ListBuilder<PokemonResource>();
  set pokemon_v2_movedamageclassdescriptions(
          ListBuilder<PokemonResource>?
              pokemon_v2_movedamageclassdescriptions) =>
      _$this._pokemon_v2_movedamageclassdescriptions =
          pokemon_v2_movedamageclassdescriptions;

  PokemonResourceBuilder? _pokemon_v2_movelearnmethod;
  PokemonResourceBuilder get pokemon_v2_movelearnmethod =>
      _$this._pokemon_v2_movelearnmethod ??= new PokemonResourceBuilder();
  set pokemon_v2_movelearnmethod(
          PokemonResourceBuilder? pokemon_v2_movelearnmethod) =>
      _$this._pokemon_v2_movelearnmethod = pokemon_v2_movelearnmethod;

  ListBuilder<PokemonResource>? _pokemon_v2_evolutiontriggernames;
  ListBuilder<PokemonResource> get pokemon_v2_evolutiontriggernames =>
      _$this._pokemon_v2_evolutiontriggernames ??=
          new ListBuilder<PokemonResource>();
  set pokemon_v2_evolutiontriggernames(
          ListBuilder<PokemonResource>? pokemon_v2_evolutiontriggernames) =>
      _$this._pokemon_v2_evolutiontriggernames =
          pokemon_v2_evolutiontriggernames;

  PokemonAbilityBuilder? _pokemon_v2_ability;
  PokemonAbilityBuilder get pokemon_v2_ability =>
      _$this._pokemon_v2_ability ??= new PokemonAbilityBuilder();
  set pokemon_v2_ability(PokemonAbilityBuilder? pokemon_v2_ability) =>
      _$this._pokemon_v2_ability = pokemon_v2_ability;

  PokemonResourceBuilder();

  PokemonResourceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _pokemon_name = $v.pokemon_name;
      _description = $v.description;
      _id = $v.id;
      _flavor_text = $v.flavor_text;
      _version_id = $v.version_id;
      _pokemon_species_id = $v.pokemon_species_id;
      _short_effect = $v.short_effect;
      _pokemon_v2_version = $v.pokemon_v2_version?.toBuilder();
      _pokemon_v2_region = $v.pokemon_v2_region?.toBuilder();
      _pokemon_v2_versiongroup = $v.pokemon_v2_versiongroup?.toBuilder();
      _pokemon_v2_egggroup = $v.pokemon_v2_egggroup?.toBuilder();
      _pokemon_v2_movedamageclass = $v.pokemon_v2_movedamageclass?.toBuilder();
      _pokemon_v2_movedamageclassdescriptions =
          $v.pokemon_v2_movedamageclassdescriptions.toBuilder();
      _pokemon_v2_movelearnmethod = $v.pokemon_v2_movelearnmethod?.toBuilder();
      _pokemon_v2_evolutiontriggernames =
          $v.pokemon_v2_evolutiontriggernames.toBuilder();
      _pokemon_v2_ability = $v.pokemon_v2_ability?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PokemonResource other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PokemonResource;
  }

  @override
  void update(void Function(PokemonResourceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PokemonResource build() => _build();

  _$PokemonResource _build() {
    _$PokemonResource _$result;
    try {
      _$result = _$v ??
          new _$PokemonResource._(
              name: name,
              pokemon_name: pokemon_name,
              description: description,
              id: id,
              flavor_text: flavor_text,
              version_id: version_id,
              pokemon_species_id: pokemon_species_id,
              short_effect: short_effect,
              pokemon_v2_version: _pokemon_v2_version?.build(),
              pokemon_v2_region: _pokemon_v2_region?.build(),
              pokemon_v2_versiongroup: _pokemon_v2_versiongroup?.build(),
              pokemon_v2_egggroup: _pokemon_v2_egggroup?.build(),
              pokemon_v2_movedamageclass: _pokemon_v2_movedamageclass?.build(),
              pokemon_v2_movedamageclassdescriptions:
                  pokemon_v2_movedamageclassdescriptions.build(),
              pokemon_v2_movelearnmethod: _pokemon_v2_movelearnmethod?.build(),
              pokemon_v2_evolutiontriggernames:
                  pokemon_v2_evolutiontriggernames.build(),
              pokemon_v2_ability: _pokemon_v2_ability?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon_v2_version';
        _pokemon_v2_version?.build();
        _$failedField = 'pokemon_v2_region';
        _pokemon_v2_region?.build();
        _$failedField = 'pokemon_v2_versiongroup';
        _pokemon_v2_versiongroup?.build();
        _$failedField = 'pokemon_v2_egggroup';
        _pokemon_v2_egggroup?.build();
        _$failedField = 'pokemon_v2_movedamageclass';
        _pokemon_v2_movedamageclass?.build();
        _$failedField = 'pokemon_v2_movedamageclassdescriptions';
        pokemon_v2_movedamageclassdescriptions.build();
        _$failedField = 'pokemon_v2_movelearnmethod';
        _pokemon_v2_movelearnmethod?.build();
        _$failedField = 'pokemon_v2_evolutiontriggernames';
        pokemon_v2_evolutiontriggernames.build();
        _$failedField = 'pokemon_v2_ability';
        _pokemon_v2_ability?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PokemonResource', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
