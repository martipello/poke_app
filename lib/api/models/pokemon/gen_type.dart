import 'dart:ui';

import '../../../extensions/iterable_extension.dart';
import '../filter_type.dart';

enum GenType implements FilterType {
  one(1, 'Generation-I', Color(0xFFA8A878), 'assets/images/normal_type_icon.png'),
  two(2, 'Generation-II', Color(0xFFC13128), 'assets/images/fighting_type_icon.png'),
  three(3, 'Generation-III', Color(0xFFA791F0), 'assets/images/flying_type_icon.png'),
  four(4, 'Generation-IV', Color(0xFFA040A0), 'assets/images/poison_type_icon.png'),
  five(5, 'Generation-V', Color(0xFFE1C068), 'assets/images/ground_type_icon.png'),
  six(6, 'Generation-VI', Color(0xFFB8A038), 'assets/images/rock_type_icon.png'),
  seven(7, 'Generation-VII', Color(0xFFA8B720), 'assets/images/bug_type_icon.png'),
  eight(8, 'Generation-VIII', Color(0xFF705898), 'assets/images/ghost_type_icon.png'),
  nine(9, 'Generation-IX', Color(0xFFB8B7D0), 'assets/images/steel_type_icon.png'),
  unknown(1001, 'Generation-MI', Color(0xFFB8B7D0), 'assets/images/steel_type_icon.png');

  const GenType(
    this.id,
    this.name,
    this.color,
    this.image,
  );

  final int id;
  final String name;
  final Color color;
  final String image;

  static GenType getTypeForId(int id) {
    return GenType.values.firstWhere(
      (type) => type.id == id,
      orElse: () => GenType.unknown,
    );
  }

  static List<FilterType> get filters => GenType.values
      .whereNot(
        (type) => type == GenType.unknown,
      )
      .toList();
}
