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

  double zoomToScale() {
    final zoom = this ?? 1.0;
    final scale = zoom / 100;
    return scale.clamp(kMinScale, kMaxScale).toDouble();
  }
}
