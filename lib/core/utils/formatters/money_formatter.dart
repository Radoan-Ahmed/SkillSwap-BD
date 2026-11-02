import 'package:intl/intl.dart';

abstract final class MoneyFormatter {
  static String format(num amount, {String symbol = '৳'}) {
    final formatter = NumberFormat('#,##,##0.00', 'en_US');
    return '$symbol${formatter.format(amount)}';
  }
}
