import '../ui/locations/map_page.dart';

extension DoubleExtension on double? {
  String removeTrailingZero() {
    final regex = RegExp(r'([.]*0)(?!.*\d)');
    return toString().replaceAll(regex, '');
  }

  String calculateDamageFactor() {
    final damageFactor = this ?? 0;
    if (damageFactor == 0) {
      return '0';
    } else {
      return (damageFactor / 10000).removeTrailingZero();
    }
  }

  int scaleToZoom() {
    final scale = this ?? 1.0;
    final zoom = scale * 100;
    return zoom.clamp(kMinZoom, kMaxZoom).toInt();
  }

}
