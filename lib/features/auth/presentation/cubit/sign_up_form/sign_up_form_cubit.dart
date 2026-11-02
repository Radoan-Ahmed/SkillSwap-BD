import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/utils/validators.dart';
import 'package:skill_swap_bd/features/auth/data/model/request/sign_up_request.dart';

part 'sign_up_form_cubit.freezed.dart';
part 'sign_up_form_state.dart';

@injectable
class SignUpFormCubit extends Cubit<SignUpFormState> {
  SignUpFormCubit() : super(const SignUpFormState());

  void fullNameChanged(String value) =>
      emit(state.copyWith(fullName: value, fullNameError: null));

  void emailChanged(String value) =>
      emit(state.copyWith(email: value, emailError: null));

  void passwordChanged(String value) =>
      emit(state.copyWith(password: value, passwordError: null));

  bool validate() {
    final fullNameError = Validators.required(state.fullName);
    final emailError = Validators.email(state.email);
    final passwordError = Validators.password(state.password);
    emit(
      state.copyWith(
        fullNameError: fullNameError,
        emailError: emailError,
        passwordError: passwordError,
      ),
    );
    return fullNameError == null && emailError == null && passwordError == null;
  }

  SignUpRequest buildRequest() => SignUpRequest(
    fullName: state.fullName?.trim() ?? '',
    email: state.email?.trim() ?? '',
    password: state.password ?? '',
  );
}
