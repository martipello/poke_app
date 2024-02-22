import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime? {
  DateTime removeTime() {
    final thisDate = this ?? DateTime.now();
    return DateTime(
      thisDate.year,
      thisDate.month,
      thisDate.day,
    );
  }

  DateTime removeSeconds() {
    final thisDate = this ?? DateTime.now();
    return DateTime(
      thisDate.year,
      thisDate.month,
      thisDate.day,
      thisDate.hour,
      thisDate.minute,
    );
  }

  String dayMonthYearFormat() {
    if (this != null) {
      return DateFormat('dd/MM/yy').format(this!);
    }
    return '';
  }

  bool isToday() {
    final _this = this ?? DateTime.now();
    final _today = DateTime.now();
    return _today.day == _this.day && _today.month == _this.month && _today.year == _this.year;
  }

}
