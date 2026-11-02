import 'package:flutter/widgets.dart';
import 'package:skill_swap_bd/core/extensions/context_extension.dart';

enum ValidationError {
  required,
  invalidPhone,
  invalidEmail,
  invalidAmount,
  passwordTooShort,
}

abstract final class Validators {
  static ValidationError? required(String? v) =>
      (v == null || v.trim().isEmpty) ? ValidationError.required : null;

  static ValidationError? phone(String? v) =>
      RegExp(r'^01[3-9]\d{8}$').hasMatch(v ?? '')
          ? null
          : ValidationError.invalidPhone;

  static ValidationError? email(String? v) =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(v ?? '')
          ? null
          : ValidationError.invalidEmail;

  static ValidationError? amount(String? v) {
    if (v == null || v.trim().isEmpty) return ValidationError.required;
    final val = double.tryParse(v);
    if (val == null || val <= 0) return ValidationError.invalidAmount;
    return null;
  }

  static ValidationError? password(String? v) =>
      (v == null || v.length < 6) ? ValidationError.passwordTooShort : null;
}

extension ValidationErrorText on ValidationError {
  String toMessage(BuildContext context) => switch (this) {
    ValidationError.required => context.tr.validationRequired,
    ValidationError.invalidPhone => context.tr.validationInvalidPhone,
    ValidationError.invalidEmail => context.tr.validationInvalidEmail,
    ValidationError.invalidAmount => context.tr.validationInvalidAmount,
    ValidationError.passwordTooShort => context.tr.validationPasswordTooShort,
  };
}
