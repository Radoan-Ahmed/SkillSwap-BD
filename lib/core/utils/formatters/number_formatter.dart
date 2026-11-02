abstract final class NumberFormatter {
  static const _enDigits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  static const _bnDigits = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];

  static String toBangla(String input) {
    var result = input;
    for (var i = 0; i < 10; i++) {
      result = result.replaceAll(_enDigits[i], _bnDigits[i]);
    }
    return result;
  }

  static String toEnglish(String input) {
    var result = input;
    for (var i = 0; i < 10; i++) {
      result = result.replaceAll(_bnDigits[i], _enDigits[i]);
    }
    return result;
  }
}
