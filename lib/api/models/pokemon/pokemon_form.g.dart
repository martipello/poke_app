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
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.is_mega;
    if (value != null) {
      result
        ..add('is_mega')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.is_default;
    if (value != null) {
      result
        ..add('is_default')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.is_battle_only;
    if (value != null) {
      result
        ..add('is_battle_only')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.form_name;
    if (value != null) {
      result
        ..add('form_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pokemon_id;
    if (value != null) {
      result
        ..add('pokemon_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_mega':
          result.is_mega = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'is_default':
          result.is_default = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'is_battle_only':
          result.is_battle_only = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'form_name':
          result.form_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pokemon_id':
          result.pokemon_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$PokemonForm extends PokemonForm {
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
  final int? pokemon_id;

  factory _$PokemonForm([void Function(PokemonFormBuilder)? updates]) =>
      (new PokemonFormBuilder()..update(updates))._build();

  _$PokemonForm._(
      {this.name,
      this.is_mega,
      this.is_default,
      this.is_battle_only,
      this.form_name,
      this.pokemon_id})
      : super._();

  @override
  PokemonForm rebuild(void Function(PokemonFormBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonFormBuilder toBuilder() => new PokemonFormBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonForm &&
        name == other.name &&
        is_mega == other.is_mega &&
        is_default == other.is_default &&
        is_battle_only == other.is_battle_only &&
        form_name == other.form_name &&
        pokemon_id == other.pokemon_id;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, name.hashCode), is_mega.hashCode),
                    is_default.hashCode),
                is_battle_only.hashCode),
            form_name.hashCode),
        pokemon_id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PokemonForm')
          ..add('name', name)
          ..add('is_mega', is_mega)
          ..add('is_default', is_default)
          ..add('is_battle_only', is_battle_only)
          ..add('form_name', form_name)
          ..add('pokemon_id', pokemon_id))
        .toString();
  }
}

class PokemonFormBuilder implements Builder<PokemonForm, PokemonFormBuilder> {
  _$PokemonForm? _$v;

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
  set is_battle_only(bool? is_battle_only) =>
      _$this._is_battle_only = is_battle_only;

  String? _form_name;
  String? get form_name => _$this._form_name;
  set form_name(String? form_name) => _$this._form_name = form_name;

  int? _pokemon_id;
  int? get pokemon_id => _$this._pokemon_id;
  set pokemon_id(int? pokemon_id) => _$this._pokemon_id = pokemon_id;

  PokemonFormBuilder();

  PokemonFormBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _is_mega = $v.is_mega;
      _is_default = $v.is_default;
      _is_battle_only = $v.is_battle_only;
      _form_name = $v.form_name;
      _pokemon_id = $v.pokemon_id;
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
    final _$result = _$v ??
        new _$PokemonForm._(
            name: name,
            is_mega: is_mega,
            is_default: is_default,
            is_battle_only: is_battle_only,
            form_name: form_name,
            pokemon_id: pokemon_id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
