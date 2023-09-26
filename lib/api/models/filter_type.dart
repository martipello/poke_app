import 'dart:ui';

abstract interface class FilterType {
  FilterType(this.id, this.name, this.color, this.image);

  final int id;
  final String name;
  final Color color;
  final String image;
}