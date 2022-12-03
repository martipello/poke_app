// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolution_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EvolutionResponse> _$evolutionResponseSerializer =
    new _$EvolutionResponseSerializer();

class _$EvolutionResponseSerializer
    implements StructuredSerializer<EvolutionResponse> {
  @override
  final Iterable<Type> types = const [EvolutionResponse, _$EvolutionResponse];
  @override
  final String wireName = 'EvolutionResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, EvolutionResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(EvolutionChainHolder)));
    }
    return result;
  }

  @override
  EvolutionResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EvolutionResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(EvolutionChainHolder))!
              as EvolutionChainHolder);
          break;
      }
    }

    return result.build();
  }
}

class _$EvolutionResponse extends EvolutionResponse {
  @override
  final EvolutionChainHolder? data;

  factory _$EvolutionResponse(
          [void Function(EvolutionResponseBuilder)? updates]) =>
      (new EvolutionResponseBuilder()..update(updates))._build();

  _$EvolutionResponse._({this.data}) : super._();

  @override
  EvolutionResponse rebuild(void Function(EvolutionResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EvolutionResponseBuilder toBuilder() =>
      new EvolutionResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EvolutionResponse && data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc(0, data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EvolutionResponse')
          ..add('data', data))
        .toString();
  }
}

class EvolutionResponseBuilder
    implements Builder<EvolutionResponse, EvolutionResponseBuilder> {
  _$EvolutionResponse? _$v;

  EvolutionChainHolderBuilder? _data;
  EvolutionChainHolderBuilder get data =>
      _$this._data ??= new EvolutionChainHolderBuilder();
  set data(EvolutionChainHolderBuilder? data) => _$this._data = data;

  EvolutionResponseBuilder();

  EvolutionResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EvolutionResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EvolutionResponse;
  }

  @override
  void update(void Function(EvolutionResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EvolutionResponse build() => _build();

  _$EvolutionResponse _build() {
    _$EvolutionResponse _$result;
    try {
      _$result = _$v ?? new _$EvolutionResponse._(data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EvolutionResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
