// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sprite.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Sprite> _$spriteSerializer = new _$SpriteSerializer();

class _$SpriteSerializer implements StructuredSerializer<Sprite> {
  @override
  final Iterable<Type> types = const [Sprite, _$Sprite];
  @override
  final String wireName = 'Sprite';

  @override
  Iterable<Object?> serialize(Serializers serializers, Sprite object, {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.front_default;
    if (value != null) {
      result
        ..add('front_default')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.front_shiny;
    if (value != null) {
      result
        ..add('front_shiny')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Sprite deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SpriteBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'front_default':
          result.front_default = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'front_shiny':
          result.front_shiny = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Sprite extends Sprite {
  @override
  final String? front_default;
  @override
  final String? front_shiny;

  factory _$Sprite([void Function(SpriteBuilder)? updates]) => (new SpriteBuilder()..update(updates))._build();

  _$Sprite._({this.front_default, this.front_shiny}) : super._();

  @override
  Sprite rebuild(void Function(SpriteBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  SpriteBuilder toBuilder() => new SpriteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Sprite && front_default == other.front_default && front_shiny == other.front_shiny;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, front_default.hashCode);
    _$hash = $jc(_$hash, front_shiny.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Sprite')
          ..add('front_default', front_default)
          ..add('front_shiny', front_shiny))
        .toString();
  }
}

class SpriteBuilder implements Builder<Sprite, SpriteBuilder> {
  _$Sprite? _$v;

  String? _front_default;
  String? get front_default => _$this._front_default;
  set front_default(String? front_default) => _$this._front_default = front_default;

  String? _front_shiny;
  String? get front_shiny => _$this._front_shiny;
  set front_shiny(String? front_shiny) => _$this._front_shiny = front_shiny;

  SpriteBuilder();

  SpriteBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _front_default = $v.front_default;
      _front_shiny = $v.front_shiny;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Sprite other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Sprite;
  }

  @override
  void update(void Function(SpriteBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Sprite build() => _build();

  _$Sprite _build() {
    final _$result = _$v ?? new _$Sprite._(front_default: front_default, front_shiny: front_shiny);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
