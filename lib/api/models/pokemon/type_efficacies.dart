// ignore_for_file: non_constant_identifier_names
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'pokemon_resource.dart';

part 'type_efficacies.g.dart';

abstract class TypeEfficacies implements Built<TypeEfficacies, TypeEfficaciesBuilder> {

  factory TypeEfficacies([void Function(TypeEfficaciesBuilder) updates]) = _$TypeEfficacies;
  TypeEfficacies._();

  double? get damage_factor;

  int? get damage_type_id;

  int? get target_type_id;

  PokemonResource? get pokemonV2TypeByTargetTypeId;

  PokemonResource? get pokemon_v2_type;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(TypeEfficacies.serializer, this) as Map<String, dynamic>;
  }

  static TypeEfficacies fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(TypeEfficacies.serializer, json)!;
  }

  static Serializer<TypeEfficacies> get serializer => _$typeEfficaciesSerializer;
}