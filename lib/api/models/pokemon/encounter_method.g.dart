// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encounter_method.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EncounterMethod> _$encounterMethodSerializer =
    new _$EncounterMethodSerializer();

class _$EncounterMethodSerializer
    implements StructuredSerializer<EncounterMethod> {
  @override
  final Iterable<Type> types = const [EncounterMethod, _$EncounterMethod];
  @override
  final String wireName = 'EncounterMethod';

  @override
  Iterable<Object?> serialize(Serializers serializers, EncounterMethod object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'pokemon_v2_encountermethodnames',
      serializers.serialize(object.pokemon_v2_encountermethodnames,
          specifiedType: const FullType(
              BuiltList, const [const FullType(PokemonResource)])),
    ];

    return result;
  }

  @override
  EncounterMethod deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EncounterMethodBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'pokemon_v2_encountermethodnames':
          result.pokemon_v2_encountermethodnames.replace(
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

class _$EncounterMethod extends EncounterMethod {
  @override
  final BuiltList<PokemonResource> pokemon_v2_encountermethodnames;

  factory _$EncounterMethod([void Function(EncounterMethodBuilder)? updates]) =>
      (new EncounterMethodBuilder()..update(updates))._build();

  _$EncounterMethod._({required this.pokemon_v2_encountermethodnames})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(pokemon_v2_encountermethodnames,
        r'EncounterMethod', 'pokemon_v2_encountermethodnames');
  }

  @override
  EncounterMethod rebuild(void Function(EncounterMethodBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EncounterMethodBuilder toBuilder() =>
      new EncounterMethodBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EncounterMethod &&
        pokemon_v2_encountermethodnames ==
            other.pokemon_v2_encountermethodnames;
  }

  @override
  int get hashCode {
    return $jf($jc(0, pokemon_v2_encountermethodnames.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EncounterMethod')
          ..add('pokemon_v2_encountermethodnames',
              pokemon_v2_encountermethodnames))
        .toString();
  }
}

class EncounterMethodBuilder
    implements Builder<EncounterMethod, EncounterMethodBuilder> {
  _$EncounterMethod? _$v;

  ListBuilder<PokemonResource>? _pokemon_v2_encountermethodnames;
  ListBuilder<PokemonResource> get pokemon_v2_encountermethodnames =>
      _$this._pokemon_v2_encountermethodnames ??=
          new ListBuilder<PokemonResource>();
  set pokemon_v2_encountermethodnames(
          ListBuilder<PokemonResource>? pokemon_v2_encountermethodnames) =>
      _$this._pokemon_v2_encountermethodnames = pokemon_v2_encountermethodnames;

  EncounterMethodBuilder();

  EncounterMethodBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pokemon_v2_encountermethodnames =
          $v.pokemon_v2_encountermethodnames.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EncounterMethod other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EncounterMethod;
  }

  @override
  void update(void Function(EncounterMethodBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EncounterMethod build() => _build();

  _$EncounterMethod _build() {
    _$EncounterMethod _$result;
    try {
      _$result = _$v ??
          new _$EncounterMethod._(
              pokemon_v2_encountermethodnames:
                  pokemon_v2_encountermethodnames.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon_v2_encountermethodnames';
        pokemon_v2_encountermethodnames.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EncounterMethod', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
