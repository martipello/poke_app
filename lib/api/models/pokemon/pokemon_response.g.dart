// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PokemonResponse> _$pokemonResponseSerializer = new _$PokemonResponseSerializer();

class _$PokemonResponseSerializer implements StructuredSerializer<PokemonResponse> {
  @override
  final Iterable<Type> types = const [PokemonResponse, _$PokemonResponse];
  @override
  final String wireName = 'PokemonResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, PokemonResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'pokemon_v2_pokemon',
      serializers.serialize(object.pokemon_v2_pokemon,
          specifiedType: const FullType(BuiltList, const [const FullType(Pokemon)])),
    ];

    return result;
  }

  @override
  PokemonResponse deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'pokemon_v2_pokemon':
          result.pokemon_v2_pokemon.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [const FullType(Pokemon)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$PokemonResponse extends PokemonResponse {
  @override
  final BuiltList<Pokemon> pokemon_v2_pokemon;

  factory _$PokemonResponse([void Function(PokemonResponseBuilder)? updates]) =>
      (new PokemonResponseBuilder()..update(updates))._build();

  _$PokemonResponse._({required this.pokemon_v2_pokemon}) : super._() {
    BuiltValueNullFieldError.checkNotNull(pokemon_v2_pokemon, r'PokemonResponse', 'pokemon_v2_pokemon');
  }

  @override
  PokemonResponse rebuild(void Function(PokemonResponseBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  PokemonResponseBuilder toBuilder() => new PokemonResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonResponse && pokemon_v2_pokemon == other.pokemon_v2_pokemon;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, pokemon_v2_pokemon.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PokemonResponse')..add('pokemon_v2_pokemon', pokemon_v2_pokemon)).toString();
  }
}

class PokemonResponseBuilder implements Builder<PokemonResponse, PokemonResponseBuilder> {
  _$PokemonResponse? _$v;

  ListBuilder<Pokemon>? _pokemon_v2_pokemon;
  ListBuilder<Pokemon> get pokemon_v2_pokemon => _$this._pokemon_v2_pokemon ??= new ListBuilder<Pokemon>();
  set pokemon_v2_pokemon(ListBuilder<Pokemon>? pokemon_v2_pokemon) => _$this._pokemon_v2_pokemon = pokemon_v2_pokemon;

  PokemonResponseBuilder();

  PokemonResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pokemon_v2_pokemon = $v.pokemon_v2_pokemon.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PokemonResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PokemonResponse;
  }

  @override
  void update(void Function(PokemonResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PokemonResponse build() => _build();

  _$PokemonResponse _build() {
    _$PokemonResponse _$result;
    try {
      _$result = _$v ?? new _$PokemonResponse._(pokemon_v2_pokemon: pokemon_v2_pokemon.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon_v2_pokemon';
        pokemon_v2_pokemon.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(r'PokemonResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
