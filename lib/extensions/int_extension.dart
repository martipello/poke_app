import '../ui/locations/map_page.dart';

extension IntExtension on int? {
  String toPercentageDisplayName() {
    final number = this;
    if (number != null) {
      return '${number.toString()} %';
    } else {
      return '';
    }
  }
}
