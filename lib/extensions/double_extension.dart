

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
}
