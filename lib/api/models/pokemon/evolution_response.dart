import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'evolution_chain_holder.dart';

part 'evolution_response.g.dart';

abstract class EvolutionResponse implements Built<EvolutionResponse, EvolutionResponseBuilder> {
  factory EvolutionResponse([void Function(EvolutionResponseBuilder) updates]) = _$EvolutionResponse;

  EvolutionResponse._();

  EvolutionChainHolder? get data;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(EvolutionResponse.serializer, this) as Map<String, dynamic>;
  }

  static EvolutionResponse fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(EvolutionResponse.serializer, json)!;
  }

  static Serializer<EvolutionResponse> get serializer => _$evolutionResponseSerializer;
}
