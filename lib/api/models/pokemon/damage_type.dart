import 'dart:ui';

import '../../../extensions/iterable_extension.dart';
import '../filter_type.dart';

enum DamageType implements FilterType {
  physical(
    2,
    'physical',
    Color(0xFFfe4d01),
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
    return DamageType.values.firstWhere(
      (type) => type.id == id,
      orElse: () => DamageType.unknown,
    );
  }

  static List<FilterType> get filters => DamageType.values
      .whereNot(
        (type) => type == DamageType.unknown,
      )
      .toList();
}
