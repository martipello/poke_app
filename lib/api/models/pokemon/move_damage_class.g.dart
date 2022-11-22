// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_damage_class.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MoveDamageClass> _$moveDamageClassSerializer =
    new _$MoveDamageClassSerializer();

class _$MoveDamageClassSerializer
    implements StructuredSerializer<MoveDamageClass> {
  @override
  final Iterable<Type> types = const [MoveDamageClass, _$MoveDamageClass];
  @override
  final String wireName = 'MoveDamageClass';

  @override
  Iterable<Object?> serialize(Serializers serializers, MoveDamageClass object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.pokemon_v2_movedamageclassdescriptions;
    if (value != null) {
      result
        ..add('pokemon_v2_movedamageclassdescriptions')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(PokemonResource)])));
    }
    return result;
  }

  @override
  MoveDamageClass deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MoveDamageClassBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'pokemon_v2_movedamageclassdescriptions':
          result.pokemon_v2_movedamageclassdescriptions.replace(
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

class _$MoveDamageClass extends MoveDamageClass {
  @override
  final BuiltList<PokemonResource>? pokemon_v2_movedamageclassdescriptions;

  factory _$MoveDamageClass([void Function(MoveDamageClassBuilder)? updates]) =>
      (new MoveDamageClassBuilder()..update(updates))._build();

  _$MoveDamageClass._({this.pokemon_v2_movedamageclassdescriptions})
      : super._();

  @override
  MoveDamageClass rebuild(void Function(MoveDamageClassBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MoveDamageClassBuilder toBuilder() =>
      new MoveDamageClassBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MoveDamageClass &&
        pokemon_v2_movedamageclassdescriptions ==
            other.pokemon_v2_movedamageclassdescriptions;
  }

  @override
  int get hashCode {
    return $jf($jc(0, pokemon_v2_movedamageclassdescriptions.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MoveDamageClass')
          ..add('pokemon_v2_movedamageclassdescriptions',
              pokemon_v2_movedamageclassdescriptions))
        .toString();
  }
}

class MoveDamageClassBuilder
    implements Builder<MoveDamageClass, MoveDamageClassBuilder> {
  _$MoveDamageClass? _$v;

  ListBuilder<PokemonResource>? _pokemon_v2_movedamageclassdescriptions;
  ListBuilder<PokemonResource> get pokemon_v2_movedamageclassdescriptions =>
      _$this._pokemon_v2_movedamageclassdescriptions ??=
          new ListBuilder<PokemonResource>();
  set pokemon_v2_movedamageclassdescriptions(
          ListBuilder<PokemonResource>?
              pokemon_v2_movedamageclassdescriptions) =>
      _$this._pokemon_v2_movedamageclassdescriptions =
          pokemon_v2_movedamageclassdescriptions;

  MoveDamageClassBuilder();

  MoveDamageClassBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pokemon_v2_movedamageclassdescriptions =
          $v.pokemon_v2_movedamageclassdescriptions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MoveDamageClass other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MoveDamageClass;
  }

  @override
  void update(void Function(MoveDamageClassBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MoveDamageClass build() => _build();

  _$MoveDamageClass _build() {
    _$MoveDamageClass _$result;
    try {
      _$result = _$v ??
          new _$MoveDamageClass._(
              pokemon_v2_movedamageclassdescriptions:
                  _pokemon_v2_movedamageclassdescriptions?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon_v2_movedamageclassdescriptions';
        _pokemon_v2_movedamageclassdescriptions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MoveDamageClass', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
