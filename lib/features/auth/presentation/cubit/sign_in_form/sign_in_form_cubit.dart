import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/utils/validators.dart';
import 'package:skill_swap_bd/features/auth/data/model/request/sign_in_request.dart';

part 'sign_in_form_cubit.freezed.dart';
part 'sign_in_form_state.dart';

@injectable
class SignInFormCubit extends Cubit<SignInFormState> {
  SignInFormCubit() : super(const SignInFormState());

  void emailChanged(String value) =>
      emit(state.copyWith(email: value, emailError: null));

  void passwordChanged(String value) =>
      emit(state.copyWith(password: value, passwordError: null));

  bool validate() {
    final emailError = Validators.email(state.email);
    final passwordError = Validators.password(state.password);
    emit(state.copyWith(emailError: emailError, passwordError: passwordError));
    return emailError == null && passwordError == null;
  }

  SignInRequest buildRequest() => SignInRequest(
    email: state.email?.trim() ?? '',
    password: state.password ?? '',
  );
}
