// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PokemonRequest> _$pokemonRequestSerializer =
    new _$PokemonRequestSerializer();

class _$PokemonRequestSerializer
    implements StructuredSerializer<PokemonRequest> {
  @override
  final Iterable<Type> types = const [PokemonRequest, _$PokemonRequest];
  @override
  final String wireName = 'PokemonRequest';

  @override
  Iterable<Object?> serialize(Serializers serializers, PokemonRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'pokemonTypes',
      serializers.serialize(object.pokemonTypes,
          specifiedType:
              const FullType(BuiltList, const [const FullType(PokemonType)])),
      'damageTypes',
      serializers.serialize(object.damageTypes,
          specifiedType:
              const FullType(BuiltList, const [const FullType(DamageType)])),
      'genTypes',
      serializers.serialize(object.genTypes,
          specifiedType:
              const FullType(BuiltList, const [const FullType(GenType)])),
    ];
    Object? value;
    value = object.pagination;
    if (value != null) {
      result
        ..add('pagination')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.limit;
    if (value != null) {
      result
        ..add('limit')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.skip;
    if (value != null) {
      result
        ..add('skip')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.search;
    if (value != null) {
      result
        ..add('search')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pokemonId;
    if (value != null) {
      result
        ..add('pokemonId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.languageId;
    if (value != null) {
      result
        ..add('languageId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.sort;
    if (value != null) {
      result
        ..add('sort')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PokemonRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'pagination':
          result.pagination = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'limit':
          result.limit = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'skip':
          result.skip = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'search':
          result.search = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pokemonId':
          result.pokemonId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'languageId':
          result.languageId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'pokemonTypes':
          result.pokemonTypes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PokemonType)]))!
              as BuiltList<Object?>);
          break;
        case 'damageTypes':
          result.damageTypes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DamageType)]))!
              as BuiltList<Object?>);
          break;
        case 'genTypes':
          result.genTypes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GenType)]))!
              as BuiltList<Object?>);
          break;
        case 'sort':
          result.sort = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$PokemonRequest extends PokemonRequest {
  @override
  final bool? pagination;
  @override
  final int? limit;
  @override
  final int? skip;
  @override
  final String? search;
  @override
  final int? pokemonId;
  @override
  final int? languageId;
  @override
  final BuiltList<PokemonType> pokemonTypes;
  @override
  final BuiltList<DamageType> damageTypes;
  @override
  final BuiltList<GenType> genTypes;
  @override
  final String? sort;

  factory _$PokemonRequest([void Function(PokemonRequestBuilder)? updates]) =>
      (new PokemonRequestBuilder()..update(updates))._build();

  _$PokemonRequest._(
      {this.pagination,
      this.limit,
      this.skip,
      this.search,
      this.pokemonId,
      this.languageId,
      required this.pokemonTypes,
      required this.damageTypes,
      required this.genTypes,
      this.sort})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        pokemonTypes, r'PokemonRequest', 'pokemonTypes');
    BuiltValueNullFieldError.checkNotNull(
        damageTypes, r'PokemonRequest', 'damageTypes');
    BuiltValueNullFieldError.checkNotNull(
        genTypes, r'PokemonRequest', 'genTypes');
  }

  @override
  PokemonRequest rebuild(void Function(PokemonRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonRequestBuilder toBuilder() =>
      new PokemonRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonRequest &&
        pagination == other.pagination &&
        limit == other.limit &&
        skip == other.skip &&
        search == other.search &&
        pokemonId == other.pokemonId &&
        languageId == other.languageId &&
        pokemonTypes == other.pokemonTypes &&
        damageTypes == other.damageTypes &&
        genTypes == other.genTypes &&
        sort == other.sort;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, pagination.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jc(_$hash, skip.hashCode);
    _$hash = $jc(_$hash, search.hashCode);
    _$hash = $jc(_$hash, pokemonId.hashCode);
    _$hash = $jc(_$hash, languageId.hashCode);
    _$hash = $jc(_$hash, pokemonTypes.hashCode);
    _$hash = $jc(_$hash, damageTypes.hashCode);
    _$hash = $jc(_$hash, genTypes.hashCode);
    _$hash = $jc(_$hash, sort.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PokemonRequest')
          ..add('pagination', pagination)
          ..add('limit', limit)
          ..add('skip', skip)
          ..add('search', search)
          ..add('pokemonId', pokemonId)
          ..add('languageId', languageId)
          ..add('pokemonTypes', pokemonTypes)
          ..add('damageTypes', damageTypes)
          ..add('genTypes', genTypes)
          ..add('sort', sort))
        .toString();
  }
}

class PokemonRequestBuilder
    implements Builder<PokemonRequest, PokemonRequestBuilder> {
  _$PokemonRequest? _$v;

  bool? _pagination;
  bool? get pagination => _$this._pagination;
  set pagination(bool? pagination) => _$this._pagination = pagination;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  int? _skip;
  int? get skip => _$this._skip;
  set skip(int? skip) => _$this._skip = skip;

  String? _search;
  String? get search => _$this._search;
  set search(String? search) => _$this._search = search;

  int? _pokemonId;
  int? get pokemonId => _$this._pokemonId;
  set pokemonId(int? pokemonId) => _$this._pokemonId = pokemonId;

  int? _languageId;
  int? get languageId => _$this._languageId;
  set languageId(int? languageId) => _$this._languageId = languageId;

  ListBuilder<PokemonType>? _pokemonTypes;
  ListBuilder<PokemonType> get pokemonTypes =>
      _$this._pokemonTypes ??= new ListBuilder<PokemonType>();
  set pokemonTypes(ListBuilder<PokemonType>? pokemonTypes) =>
      _$this._pokemonTypes = pokemonTypes;

  ListBuilder<DamageType>? _damageTypes;
  ListBuilder<DamageType> get damageTypes =>
      _$this._damageTypes ??= new ListBuilder<DamageType>();
  set damageTypes(ListBuilder<DamageType>? damageTypes) =>
      _$this._damageTypes = damageTypes;

  ListBuilder<GenType>? _genTypes;
  ListBuilder<GenType> get genTypes =>
      _$this._genTypes ??= new ListBuilder<GenType>();
  set genTypes(ListBuilder<GenType>? genTypes) => _$this._genTypes = genTypes;

  String? _sort;
  String? get sort => _$this._sort;
  set sort(String? sort) => _$this._sort = sort;

  PokemonRequestBuilder();

  PokemonRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pagination = $v.pagination;
      _limit = $v.limit;
      _skip = $v.skip;
      _search = $v.search;
      _pokemonId = $v.pokemonId;
      _languageId = $v.languageId;
      _pokemonTypes = $v.pokemonTypes.toBuilder();
      _damageTypes = $v.damageTypes.toBuilder();
      _genTypes = $v.genTypes.toBuilder();
      _sort = $v.sort;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PokemonRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PokemonRequest;
  }

  @override
  void update(void Function(PokemonRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PokemonRequest build() => _build();

  _$PokemonRequest _build() {
    _$PokemonRequest _$result;
    try {
      _$result = _$v ??
          new _$PokemonRequest._(
              pagination: pagination,
              limit: limit,
              skip: skip,
              search: search,
              pokemonId: pokemonId,
              languageId: languageId,
              pokemonTypes: pokemonTypes.build(),
              damageTypes: damageTypes.build(),
              genTypes: genTypes.build(),
              sort: sort);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemonTypes';
        pokemonTypes.build();
        _$failedField = 'damageTypes';
        damageTypes.build();
        _$failedField = 'genTypes';
        genTypes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PokemonRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
