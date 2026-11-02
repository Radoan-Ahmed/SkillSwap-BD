import 'package:intl/intl.dart';

abstract final class DateFormatter {
  static String format(DateTime date, [String pattern = 'dd MMM yyyy']) =>
      DateFormat(pattern).format(date);

  static String formatTime(DateTime date) => DateFormat('hh:mm a').format(date);

  static String formatDateTime(DateTime date) =>
      DateFormat('dd MMM yyyy, hh:mm a').format(date);
}
