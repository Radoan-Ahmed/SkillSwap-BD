import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String format([String pattern = 'dd MMM yyyy']) =>
      DateFormat(pattern).format(this);

  bool isSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;
}
