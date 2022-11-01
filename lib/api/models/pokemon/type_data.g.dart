// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TypeData> _$typeDataSerializer = new _$TypeDataSerializer();

class _$TypeDataSerializer implements StructuredSerializer<TypeData> {
  @override
  final Iterable<Type> types = const [TypeData, _$TypeData];
  @override
  final String wireName = 'TypeData';

  @override
  Iterable<Object?> serialize(Serializers serializers, TypeData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
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
    return result;
  }

  @override
  TypeData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TypeDataBuilder();

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
      }
    }

    return result.build();
  }
}

class _$TypeData extends TypeData {
  @override
  final int? id;
  @override
  final String? name;

  factory _$TypeData([void Function(TypeDataBuilder)? updates]) =>
      (new TypeDataBuilder()..update(updates))._build();

  _$TypeData._({this.id, this.name}) : super._();

  @override
  TypeData rebuild(void Function(TypeDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TypeDataBuilder toBuilder() => new TypeDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TypeData && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TypeData')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class TypeDataBuilder implements Builder<TypeData, TypeDataBuilder> {
  _$TypeData? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  TypeDataBuilder();

  TypeDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TypeData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TypeData;
  }

  @override
  void update(void Function(TypeDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TypeData build() => _build();

  _$TypeData _build() {
    final _$result = _$v ?? new _$TypeData._(id: id, name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
