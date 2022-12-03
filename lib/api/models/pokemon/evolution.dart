// ignore_for_file: non_constant_identifier_names
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers/serializers.dart';
import 'pokemon_resource.dart';

part 'evolution.g.dart';

abstract class Evolution implements Built<Evolution, EvolutionBuilder> {
  factory Evolution([void Function(EvolutionBuilder) updates]) = _$Evolution;

  Evolution._();

  bool? get needs_overworld_rain;

  int? get min_level;

  int? get min_happiness;

  int? get min_beauty;

  int? get min_affection;

  int? get location_id;

  PokemonResource? get pokemon_v2_evolutiontrigger;

  bool? get turn_upside_down;

  int? get trade_species_id;

  String? get time_of_day;

  int? get relative_physical_stats;

  PokemonResource? get pokemon_v2_location;

  PokemonResource? get pokemon_v2_item;

  int? get known_move_id;

  int? get known_move_type_id;

  int? get held_item_id;

  int? get gender_id;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Evolution.serializer, this) as Map<String, dynamic>;
  }

  static Evolution fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Evolution.serializer, json)!;
  }

  static Serializer<Evolution> get serializer => _$evolutionSerializer;
}
