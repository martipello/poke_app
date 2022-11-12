import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'pokemon_type.dart';

part 'pokemon_request.g.dart';

abstract class PokemonRequest implements Built<PokemonRequest, PokemonRequestBuilder> {


  factory PokemonRequest([void Function(PokemonRequestBuilder) updates]) = _$PokemonRequest;
  PokemonRequest._();

  bool? get pagination;

  int? get limit;

  int? get skip;

  String? get search;

  BuiltList<PokemonType> get pokemonTypes;

  String? get sort;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(PokemonRequest.serializer, this) as Map<String, dynamic>;
  }

  static PokemonRequest fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(PokemonRequest.serializer, json)!;
  }

  static Serializer<PokemonRequest> get serializer => _$pokemonRequestSerializer;
}