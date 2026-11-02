import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/error/failures.dart';
import 'package:skill_swap_bd/core/error/result.dart';
import 'package:skill_swap_bd/features/auth/data/model/request/sign_in_request.dart';
import 'package:skill_swap_bd/features/auth/data/model/response/auth_user_response.dart';
import 'package:skill_swap_bd/features/auth/domain/usecase/sign_in_usecase.dart';
import 'package:skill_swap_bd/features/auth/domain/usecase/sign_in_with_google_usecase.dart';

part 'sign_in_cubit.freezed.dart';
part 'sign_in_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this._signIn, this._signInWithGoogle)
    : super(const SignInState.initial());

  final SignInUsecase _signIn;
  final SignInWithGoogleUsecase _signInWithGoogle;

  Future<void> signIn(SignInRequest request) async {
    if (state is SignInLoading) return;
    emit(const SignInState.loading());
    final result = await _signIn(request);
    switch (result) {
      case Ok(:final data):
        emit(SignInState.success(user: data));
      case Err(:final failure):
        emit(SignInState.failure(failure: failure));
    }
  }

  Future<void> signInWithGoogle() async {
    if (state is SignInLoading) return;
    emit(const SignInState.loading());
    final result = await _signInWithGoogle();
    switch (result) {
      case Ok():
        emit(const SignInState.googleRedirected());
      case Err(:final failure):
        emit(SignInState.failure(failure: failure));
    }
  }
}
