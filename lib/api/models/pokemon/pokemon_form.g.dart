// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_form.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PokemonForm> _$pokemonFormSerializer = new _$PokemonFormSerializer();

class _$PokemonFormSerializer implements StructuredSerializer<PokemonForm> {
  @override
  final Iterable<Type> types = const [PokemonForm, _$PokemonForm];
  @override
  final String wireName = 'PokemonForm';

  @override
  Iterable<Object?> serialize(Serializers serializers, PokemonForm object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'pokemon_v2_pokemonabilities',
      serializers.serialize(object.pokemon_v2_pokemonabilities,
          specifiedType: const FullType(BuiltList, const [const FullType(PokemonAbilityHolder)])),
      'pokemon_v2_pokemonformgenerations',
      serializers.serialize(object.pokemon_v2_pokemonformgenerations,
          specifiedType: const FullType(BuiltList, const [const FullType(PokemonResource)])),
      'pokemon_v2_pokemonformnames',
      serializers.serialize(object.pokemon_v2_pokemonformnames,
          specifiedType: const FullType(BuiltList, const [const FullType(PokemonResource)])),
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
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.is_mega;
    if (value != null) {
      result
        ..add('is_mega')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.is_default;
    if (value != null) {
      result
        ..add('is_default')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.is_battle_only;
    if (value != null) {
      result
        ..add('is_battle_only')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.form_name;
    if (value != null) {
      result
        ..add('form_name')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.formOrder;
    if (value != null) {
      result
        ..add('formOrder')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pokemon_id;
    if (value != null) {
      result
        ..add('pokemon_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.order;
    if (value != null) {
      result
        ..add('order')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pokemon_v2_pokemon;
    if (value != null) {
      result
        ..add('pokemon_v2_pokemon')
        ..add(serializers.serialize(value, specifiedType: const FullType(Pokemon)));
    }
    return result;
  }

  @override
  PokemonForm deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonFormBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'is_mega':
          result.is_mega = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'is_default':
          result.is_default = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'is_battle_only':
          result.is_battle_only = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'form_name':
          result.form_name = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'formOrder':
          result.formOrder = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'pokemon_id':
          result.pokemon_id = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'order':
          result.order = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'pokemon_v2_pokemon':
          result.pokemon_v2_pokemon
              .replace(serializers.deserialize(value, specifiedType: const FullType(Pokemon))! as Pokemon);
          break;
        case 'pokemon_v2_pokemonabilities':
          result.pokemon_v2_pokemonabilities.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, const [const FullType(PokemonAbilityHolder)]))!
              as BuiltList<Object?>);
          break;
        case 'pokemon_v2_pokemonformgenerations':
          result.pokemon_v2_pokemonformgenerations.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, const [const FullType(PokemonResource)]))!
              as BuiltList<Object?>);
          break;
        case 'pokemon_v2_pokemonformnames':
          result.pokemon_v2_pokemonformnames.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, const [const FullType(PokemonResource)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$PokemonForm extends PokemonForm {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final bool? is_mega;
  @override
  final bool? is_default;
  @override
  final bool? is_battle_only;
  @override
  final String? form_name;
  @override
  final int? formOrder;
  @override
  final int? pokemon_id;
  @override
  final int? order;
  @override
  final Pokemon? pokemon_v2_pokemon;
  @override
  final BuiltList<PokemonAbilityHolder> pokemon_v2_pokemonabilities;
  @override
  final BuiltList<PokemonResource> pokemon_v2_pokemonformgenerations;
  @override
  final BuiltList<PokemonResource> pokemon_v2_pokemonformnames;

  factory _$PokemonForm([void Function(PokemonFormBuilder)? updates]) =>
      (new PokemonFormBuilder()..update(updates))._build();

  _$PokemonForm._(
      {this.id,
      this.name,
      this.is_mega,
      this.is_default,
      this.is_battle_only,
      this.form_name,
      this.formOrder,
      this.pokemon_id,
      this.order,
      this.pokemon_v2_pokemon,
      required this.pokemon_v2_pokemonabilities,
      required this.pokemon_v2_pokemonformgenerations,
      required this.pokemon_v2_pokemonformnames})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(pokemon_v2_pokemonabilities, r'PokemonForm', 'pokemon_v2_pokemonabilities');
    BuiltValueNullFieldError.checkNotNull(
        pokemon_v2_pokemonformgenerations, r'PokemonForm', 'pokemon_v2_pokemonformgenerations');
    BuiltValueNullFieldError.checkNotNull(pokemon_v2_pokemonformnames, r'PokemonForm', 'pokemon_v2_pokemonformnames');
  }

  @override
  PokemonForm rebuild(void Function(PokemonFormBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  PokemonFormBuilder toBuilder() => new PokemonFormBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonForm &&
        id == other.id &&
        name == other.name &&
        is_mega == other.is_mega &&
        is_default == other.is_default &&
        is_battle_only == other.is_battle_only &&
        form_name == other.form_name &&
        formOrder == other.formOrder &&
        pokemon_id == other.pokemon_id &&
        order == other.order &&
        pokemon_v2_pokemon == other.pokemon_v2_pokemon &&
        pokemon_v2_pokemonabilities == other.pokemon_v2_pokemonabilities &&
        pokemon_v2_pokemonformgenerations == other.pokemon_v2_pokemonformgenerations &&
        pokemon_v2_pokemonformnames == other.pokemon_v2_pokemonformnames;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, is_mega.hashCode);
    _$hash = $jc(_$hash, is_default.hashCode);
    _$hash = $jc(_$hash, is_battle_only.hashCode);
    _$hash = $jc(_$hash, form_name.hashCode);
    _$hash = $jc(_$hash, formOrder.hashCode);
    _$hash = $jc(_$hash, pokemon_id.hashCode);
    _$hash = $jc(_$hash, order.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_pokemon.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_pokemonabilities.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_pokemonformgenerations.hashCode);
    _$hash = $jc(_$hash, pokemon_v2_pokemonformnames.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PokemonForm')
          ..add('id', id)
          ..add('name', name)
          ..add('is_mega', is_mega)
          ..add('is_default', is_default)
          ..add('is_battle_only', is_battle_only)
          ..add('form_name', form_name)
          ..add('formOrder', formOrder)
          ..add('pokemon_id', pokemon_id)
          ..add('order', order)
          ..add('pokemon_v2_pokemon', pokemon_v2_pokemon)
          ..add('pokemon_v2_pokemonabilities', pokemon_v2_pokemonabilities)
          ..add('pokemon_v2_pokemonformgenerations', pokemon_v2_pokemonformgenerations)
          ..add('pokemon_v2_pokemonformnames', pokemon_v2_pokemonformnames))
        .toString();
  }
}

class PokemonFormBuilder implements Builder<PokemonForm, PokemonFormBuilder> {
  _$PokemonForm? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _is_mega;
  bool? get is_mega => _$this._is_mega;
  set is_mega(bool? is_mega) => _$this._is_mega = is_mega;

  bool? _is_default;
  bool? get is_default => _$this._is_default;
  set is_default(bool? is_default) => _$this._is_default = is_default;

  bool? _is_battle_only;
  bool? get is_battle_only => _$this._is_battle_only;
  set is_battle_only(bool? is_battle_only) => _$this._is_battle_only = is_battle_only;

  String? _form_name;
  String? get form_name => _$this._form_name;
  set form_name(String? form_name) => _$this._form_name = form_name;

  int? _formOrder;
  int? get formOrder => _$this._formOrder;
  set formOrder(int? formOrder) => _$this._formOrder = formOrder;

  int? _pokemon_id;
  int? get pokemon_id => _$this._pokemon_id;
  set pokemon_id(int? pokemon_id) => _$this._pokemon_id = pokemon_id;

  int? _order;
  int? get order => _$this._order;
  set order(int? order) => _$this._order = order;

  PokemonBuilder? _pokemon_v2_pokemon;
  PokemonBuilder get pokemon_v2_pokemon => _$this._pokemon_v2_pokemon ??= new PokemonBuilder();
  set pokemon_v2_pokemon(PokemonBuilder? pokemon_v2_pokemon) => _$this._pokemon_v2_pokemon = pokemon_v2_pokemon;

  ListBuilder<PokemonAbilityHolder>? _pokemon_v2_pokemonabilities;
  ListBuilder<PokemonAbilityHolder> get pokemon_v2_pokemonabilities =>
      _$this._pokemon_v2_pokemonabilities ??= new ListBuilder<PokemonAbilityHolder>();
  set pokemon_v2_pokemonabilities(ListBuilder<PokemonAbilityHolder>? pokemon_v2_pokemonabilities) =>
      _$this._pokemon_v2_pokemonabilities = pokemon_v2_pokemonabilities;

  ListBuilder<PokemonResource>? _pokemon_v2_pokemonformgenerations;
  ListBuilder<PokemonResource> get pokemon_v2_pokemonformgenerations =>
      _$this._pokemon_v2_pokemonformgenerations ??= new ListBuilder<PokemonResource>();
  set pokemon_v2_pokemonformgenerations(ListBuilder<PokemonResource>? pokemon_v2_pokemonformgenerations) =>
      _$this._pokemon_v2_pokemonformgenerations = pokemon_v2_pokemonformgenerations;

  ListBuilder<PokemonResource>? _pokemon_v2_pokemonformnames;
  ListBuilder<PokemonResource> get pokemon_v2_pokemonformnames =>
      _$this._pokemon_v2_pokemonformnames ??= new ListBuilder<PokemonResource>();
  set pokemon_v2_pokemonformnames(ListBuilder<PokemonResource>? pokemon_v2_pokemonformnames) =>
      _$this._pokemon_v2_pokemonformnames = pokemon_v2_pokemonformnames;

  PokemonFormBuilder();

  PokemonFormBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _is_mega = $v.is_mega;
      _is_default = $v.is_default;
      _is_battle_only = $v.is_battle_only;
      _form_name = $v.form_name;
      _formOrder = $v.formOrder;
      _pokemon_id = $v.pokemon_id;
      _order = $v.order;
      _pokemon_v2_pokemon = $v.pokemon_v2_pokemon?.toBuilder();
      _pokemon_v2_pokemonabilities = $v.pokemon_v2_pokemonabilities.toBuilder();
      _pokemon_v2_pokemonformgenerations = $v.pokemon_v2_pokemonformgenerations.toBuilder();
      _pokemon_v2_pokemonformnames = $v.pokemon_v2_pokemonformnames.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PokemonForm other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PokemonForm;
  }

  @override
  void update(void Function(PokemonFormBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PokemonForm build() => _build();

  _$PokemonForm _build() {
    _$PokemonForm _$result;
    try {
      _$result = _$v ??
          new _$PokemonForm._(
              id: id,
              name: name,
              is_mega: is_mega,
              is_default: is_default,
              is_battle_only: is_battle_only,
              form_name: form_name,
              formOrder: formOrder,
              pokemon_id: pokemon_id,
              order: order,
              pokemon_v2_pokemon: _pokemon_v2_pokemon?.build(),
              pokemon_v2_pokemonabilities: pokemon_v2_pokemonabilities.build(),
              pokemon_v2_pokemonformgenerations: pokemon_v2_pokemonformgenerations.build(),
              pokemon_v2_pokemonformnames: pokemon_v2_pokemonformnames.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon_v2_pokemon';
        _pokemon_v2_pokemon?.build();
        _$failedField = 'pokemon_v2_pokemonabilities';
        pokemon_v2_pokemonabilities.build();
        _$failedField = 'pokemon_v2_pokemonformgenerations';
        pokemon_v2_pokemonformgenerations.build();
        _$failedField = 'pokemon_v2_pokemonformnames';
        pokemon_v2_pokemonformnames.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(r'PokemonForm', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
