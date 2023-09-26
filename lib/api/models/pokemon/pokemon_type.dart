import 'dart:ui';

import '../../../extensions/iterable_extension.dart';
import '../filter_type.dart';

enum PokemonType implements FilterType {
  normal(1, 'normal', Color(0xFFA8A878), 'assets/images/normal_type_icon.png'),
  fighting(2, 'fighting', Color(0xFFC13128), 'assets/images/fighting_type_icon.png'),
  flying(3, 'flying', Color(0xFFA791F0), 'assets/images/flying_type_icon.png'),
  poison(4, 'poison', Color(0xFFA040A0), 'assets/images/poison_type_icon.png'),
  ground(5, 'ground', Color(0xFFE1C068), 'assets/images/ground_type_icon.png'),
  rock(6, 'rock', Color(0xFFB8A038), 'assets/images/rock_type_icon.png'),
  bug(7, 'bug', Color(0xFFA8B720), 'assets/images/bug_type_icon.png'),
  ghost(8, 'ghost', Color(0xFF705898), 'assets/images/ghost_type_icon.png'),
  steel(9, 'steel', Color(0xFFB8B7D0), 'assets/images/steel_type_icon.png'),
  fire(10, 'fire', Color(0xFFF08030), 'assets/images/fire_type_icon.png'),
  water(11, 'water', Color(0xFF6790F0), 'assets/images/water_type_icon.png'),
  grass(12, 'grass', Color(0xFF78C750), 'assets/images/grass_type_icon.png'),
  electric(13, 'electric', Color(0xFFF9CF30), 'assets/images/electric_type_icon.png'),
  psychic(14, 'psychic', Color(0xFFF85888), 'assets/images/psychic_type_icon.png'),
  ice(15, 'ice', Color(0xFF98D8D8), 'assets/images/ice_type_icon.png'),
  dragon(16, 'dragon', Color(0xFFFF7038), 'assets/images/dragon_type_icon.png'),
  dark(17, 'dark', Color(0xFF6F5848), 'assets/images/dark_type_icon.png'),
  fairy(18, 'fairy', Color(0xFFF0B6BC), 'assets/images/fairy_type_icon.png'),
  unknown(10001, 'unknown', Color(0xFFFFFFFF), 'assets/images/pokeball.png'),
  shadow(10002, 'shadow', Color(0xFF6F5848), 'assets/images/dark_type_icon.png');

  const PokemonType(
    this.id,
    this.name,
    this.color,
    this.image,
  );

  final int id;
  final String name;
  final Color color;
  final String image;

  static PokemonType getTypeForId(int id) {
    return PokemonType.values.firstWhere(
      (type) => type.id == id,
      orElse: () => PokemonType.unknown,
    );
  }

  static List<FilterType> get filters => PokemonType.values
      .whereNot(
        (type) => type == PokemonType.shadow || type == PokemonType.unknown,
      )
      .toList();
}
