import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'evolution_holder.dart';

part 'evolution_chain_holder.g.dart';

abstract class EvolutionChainHolder implements Built<EvolutionChainHolder, EvolutionChainHolderBuilder> {
  factory EvolutionChainHolder([void Function(EvolutionChainHolderBuilder) updates]) = _$EvolutionChainHolder;

  EvolutionChainHolder._();

  BuiltList<EvolutionHolder> get pokemon_v2_evolutionchain;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(EvolutionChainHolder.serializer, this) as Map<String, dynamic>;
  }

  static EvolutionChainHolder fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(EvolutionChainHolder.serializer, json)!;
  }

  static Serializer<EvolutionChainHolder> get serializer => _$evolutionChainHolderSerializer;
}
