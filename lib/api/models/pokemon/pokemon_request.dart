import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'damage_type.dart';
import 'gen_type.dart';
import 'pokemon_type.dart';

part 'pokemon_request.g.dart';

abstract class PokemonRequest implements Built<PokemonRequest, PokemonRequestBuilder> {
  factory PokemonRequest([void Function(PokemonRequestBuilder) updates]) = _$PokemonRequest;
  PokemonRequest._();

  bool? get pagination;

  int? get limit;

  int? get skip;

  String? get search;

  int? get pokemonId;

  int? get languageId;

  BuiltList<PokemonType> get pokemonTypes;

  BuiltList<DamageType> get damageTypes;

  BuiltList<GenType> get genTypes;

  String? get sort;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(PokemonRequest.serializer, this) as Map<String, dynamic>;
  }

  static PokemonRequest fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(PokemonRequest.serializer, json)!;
  }

  static Serializer<PokemonRequest> get serializer => _$pokemonRequestSerializer;
}
