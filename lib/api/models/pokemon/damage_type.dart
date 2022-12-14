import 'dart:ui';

enum DamageType {
  physical(
    2,
    'physical',
    Color(0xFFCA2212),
    'assets/images/physical.png',
  ),
  special(
    3,
    'special',
    Color(0xFF505970),
    'assets/images/special.png',
  ),
  status(
    1,
    'status',
    Color(0xFF8C888C),
    'assets/images/status.png',
  ),
  unknown(
    10001,
    'unknown',
    Color(0xFFFFFFFF),
    'assets/images/pokeball.png',
  );

  const DamageType(
    this.id,
    this.name,
    this.color,
    this.image,
  );

  final int id;
  final String name;
  final Color color;
  final String image;

  static DamageType getTypeForId(int id) {
    switch (id) {
      case 1:
        return DamageType.status;
      case 2:
        return DamageType.physical;
      case 3:
        return DamageType.special;
      default:
        return DamageType.unknown;
    }
  }
}
