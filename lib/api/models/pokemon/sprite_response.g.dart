// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sprite_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SpriteResponse> _$spriteResponseSerializer =
    new _$SpriteResponseSerializer();

class _$SpriteResponseSerializer
    implements StructuredSerializer<SpriteResponse> {
  @override
  final Iterable<Type> types = const [SpriteResponse, _$SpriteResponse];
  @override
  final String wireName = 'SpriteResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, SpriteResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.sprites;
    if (value != null) {
      result
        ..add('sprites')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SpriteResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SpriteResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'sprites':
          result.sprites = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$SpriteResponse extends SpriteResponse {
  @override
  final String? sprites;

  factory _$SpriteResponse([void Function(SpriteResponseBuilder)? updates]) =>
      (new SpriteResponseBuilder()..update(updates))._build();

  _$SpriteResponse._({this.sprites}) : super._();

  @override
  SpriteResponse rebuild(void Function(SpriteResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SpriteResponseBuilder toBuilder() =>
      new SpriteResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SpriteResponse && sprites == other.sprites;
  }

  @override
  int get hashCode {
    return $jf($jc(0, sprites.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SpriteResponse')
          ..add('sprites', sprites))
        .toString();
  }
}

class SpriteResponseBuilder
    implements Builder<SpriteResponse, SpriteResponseBuilder> {
  _$SpriteResponse? _$v;

  String? _sprites;
  String? get sprites => _$this._sprites;
  set sprites(String? sprites) => _$this._sprites = sprites;

  SpriteResponseBuilder();

  SpriteResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sprites = $v.sprites;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SpriteResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SpriteResponse;
  }

  @override
  void update(void Function(SpriteResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SpriteResponse build() => _build();

  _$SpriteResponse _build() {
    final _$result = _$v ?? new _$SpriteResponse._(sprites: sprites);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
