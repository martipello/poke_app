extension DoubleExtension on double {

  String removeTrailingZero(){
    final regex = RegExp(r'([.]*0)(?!.*\d)');
    return toString().replaceAll(regex, '');
  }
}