import 'dart:ui';

enum Version {
  red(1, 'Red', 'red', '', Color(0xFFC13128)),
  blue(2, 'Blue', 'blue', '', Color(0xFF6790F0)),
  yellow(3, 'Yellow', 'yellow', '', Color(0xFFF9CF30)),
  gold(4, 'Gold', 'gold', '', Color(0xFFFFD700)),
  silver(5, 'Silver', 'silver', '', Color(0xFFC0C0C0)),
  crystal(6, 'Crystal', 'crystal', '', Color(0xFFA7D8DE)),
  ruby(7, 'Ruby', 'ruby', '', Color(0xFF9B111E)),
  sapphire(8, 'Sapphire', 'sapphire', '', Color(0xFF0F52BA)),
  emerald(9, 'Emerald', 'emerald', '', Color(0xFF50C878)),
  firered(10, 'Fire Red', 'firered', '', Color(0xFFC13128)),
  leafgreen(11, 'Leaf Green', 'leafgreen', '', Color(0xFF78C750)),
  diamond(12, 'Diamond', 'diamond', '', Color(0xFFB9F2FF)),
  pearl(13, 'Pearl', 'pearl', '', Color(0xFFE2DFD2)),
  platinum(14, 'Platinum', 'platinum', '', Color(0xFFE5E4E2)),
  heartgold(15, 'Heart Gold', 'heartgold', '', Color(0xFFFFD700)),
  soulsilver(16, 'Soul Silver', 'soulsilver', '', Color(0xFFC0C0C0)),
  black(17, 'Black', 'black', '', Color(0xFF000000)),
  white(18, 'White', 'white', '', Color(0xFFFFFFFF)),
  colosseum(19, 'Collosseum', 'collosseum', '', Color(0xFFFF2400)),
  xd(20, 'XD', 'xd', '', Color(0xFF1C375C)),
  black2(21, 'Black 2', 'black-2', '', Color(0xFF000000)),
  white2(22, 'White 2', 'white-2', '', Color(0xFFFFFFFF)),
  x(23, 'X', 'x', '', Color(0xFF8F00FF)),
  y(24, 'Y', 'y', '', Color(0xFFFF2400)),
  omegaruby(25, 'Omega Ruby', 'omega-ruby', '', Color(0xFF9B111E)),
  alphasapphire(26, 'Alpha Sapphire', 'alpha-sapphire', '', Color(0xFF0F52BA)),
  sun(27, 'Sun', '', '', Color(0xFFE5DE44)),
  moon(28, 'Moon', '', '', Color(0xFF1C375C)),
  ultrasun(29, 'Ultra Sun', 'ultra-sun', '', Color(0xFFE5DE44)),
  ultramoon(30, 'Ultra Moon', 'ultra-moon', '', Color(0xFF1C375C)),
  letsgopikachu(31, 'Lets go Pikachu', 'lets-go-pikachu', '', Color(0xFFF9CF30)),
  letsgoeevee(32, 'Lets go Eevee', 'lets-go-eevee', '', Color(0xFFD8C5A1)),
  sword(33, 'Sword', 'sword', '', Color(0xFF049FED)),
  shield(34, 'Shield', 'shield', '', Color(0xFFE60B5B)),
  theisleofarmor(35, 'Isle of Armor', 'the-isle-of-armor', '', Color(0xFF049FED)),
  thecrowntundra(36, 'Crown Tundra', 'the-crown-tundra', '', Color(0xFFE60B5B)),
  brilliantdiamond(37, 'Brilliant Diamond', 'brilliant-diamond', '', Color(0xFFB9F2FF)),
  shiningpearl(38, 'Shining Pearl', 'shining-pearl', '', Color(0xFFE2DFD2)),
  legendsarceus(39, 'Legends Arceus', 'legends-arceus', '', Color(0xFFA8A878)),
  scarlet(40, 'Scarlet', 'scarlet', '', Color(0xFFFF2400)),
  violet(41, 'Violet', 'violet', '', Color(0xFF8F00FF));

  const Version(
    this.versionId,
    this.displayName,
    this.configName,
    this.image,
    this.color,
  );

  final int versionId;
  final String displayName;
  final String configName;
  final String image;
  final Color color;
}
