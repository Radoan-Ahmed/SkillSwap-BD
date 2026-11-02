part of 'sign_up_form_cubit.dart';

@freezed
abstract class SignUpFormState with _$SignUpFormState {
  const factory SignUpFormState({
    String? fullName,
    String? email,
    String? password,
    ValidationError? fullNameError,
    ValidationError? emailError,
    ValidationError? passwordError,
  }) = _SignUpFormState;
}
