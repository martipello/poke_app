extension intExtension on int? {
  String toPercentageDisplayName() {
    final number = this;
    if (number != null) {
      return '${number.toString()} %';
    } else {
      return '';
    }
  }
}
