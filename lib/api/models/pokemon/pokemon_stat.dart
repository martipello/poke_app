import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'stat.dart';

part 'pokemon_stat.g.dart';

abstract class PokemonStat implements Built<PokemonStat, PokemonStatBuilder> {

  factory PokemonStat([void Function(PokemonStatBuilder) updates]) = _$PokemonStat;
  PokemonStat._();

  int? get base_stat;

  int? get effort;

  int? get stat_id;

  Stat? get pokemon_v2_stat;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(PokemonStat.serializer, this) as Map<String, dynamic>;
  }

  static PokemonStat fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(PokemonStat.serializer, json)!;
  }

  static Serializer<PokemonStat> get serializer => _$pokemonStatSerializer;
}