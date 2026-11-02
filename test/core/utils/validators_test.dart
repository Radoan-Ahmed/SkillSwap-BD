import 'package:flutter_test/flutter_test.dart';
import 'package:skill_swap_bd/core/utils/validators.dart';

void main() {
  group('Validators', () {
    test('required returns required error when string is empty or null', () {
      expect(Validators.required(null), equals(ValidationError.required));
      expect(Validators.required(''), equals(ValidationError.required));
      expect(Validators.required('   '), equals(ValidationError.required));
      expect(Validators.required('hello'), isNull);
    });

    test('phone validates BD phone number correctly', () {
      expect(Validators.phone('01712345678'), isNull);
      expect(
        Validators.phone('01212345678'),
        equals(ValidationError.invalidPhone),
      );
      expect(Validators.phone('12345'), equals(ValidationError.invalidPhone));
    });

    test('email validates email address correctly', () {
      expect(Validators.email('test@example.com'), isNull);
      expect(
        Validators.email('invalid-email'),
        equals(ValidationError.invalidEmail),
      );
    });
  });
}
