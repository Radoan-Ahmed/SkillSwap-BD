part of 'sign_in_form_cubit.dart';

@freezed
abstract class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    String? email,
    String? password,
    ValidationError? emailError,
    ValidationError? passwordError,
  }) = _SignInFormState;
}
