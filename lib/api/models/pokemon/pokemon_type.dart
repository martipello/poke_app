import 'dart:ui';

enum PokemonType {
  normal(1, 'normal', Color(0xFFA8A878), 'assets/images/ic_normal_type.png'),
  fighting(2, 'fighting', Color(0xFFC13128), 'assets/images/ic_fighting_type.png'),
  flying(3, 'flying', Color(0xFFA791F0), 'assets/images/ic_flying_type.png'),
  poison(4, 'poison', Color(0xFFA040A0), 'assets/images/ic_poison_type.png'),
  ground(5, 'ground', Color(0xFFE1C068), 'assets/images/ic_ground_type.png'),
  rock(6, 'rock', Color(0xFFB8A038), 'assets/images/ic_rock_type.png'),
  bug(7, 'bug', Color(0xFFA8B720), 'assets/images/ic_bug_type.png'),
  ghost(8, 'ghost', Color(0xFF705898), 'assets/images/ic_ghost_type.png'),
  steel(9, 'steel', Color(0xFFB8B7D0), 'assets/images/ic_steel_type.png'),
  fire(10, 'fire', Color(0xFFF08030), 'assets/images/ic_fire_type.png'),
  water(11, 'water', Color(0xFF6790F0), 'assets/images/ic_water_type.png'),
  grass(12, 'grass', Color(0xFF78C750), 'assets/images/ic_grass_type.png'),
  electric(13, 'electric', Color(0xFFF9CF30), 'assets/images/ic_electric_type.png'),
  psychic(14, 'psychic', Color(0xFFF85888), 'assets/images/ic_psychic_type.png'),
  ice(15, 'ice', Color(0xFF98D8D8), 'assets/images/ic_ice_type.png'),
  dragon(16, 'dragon', Color(0xFF7038), 'assets/images/ic_dragon_type.png'),
  dark(17, 'dark', Color(0xFF6F5848), 'assets/images/ic_dark_type.png'),
  fairy(18, 'fairy', Color(0xFFF0B6BC), 'assets/images/ic_fairy_type.png'),
  unknown(10001, 'unknown', Color(0xFFFFFFFF), 'assets/images/pokeball.png'),
  shadow(10002, 'shadow', Color(0xFF6F5848), 'assets/images/ic_dark_type.png');

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
}
