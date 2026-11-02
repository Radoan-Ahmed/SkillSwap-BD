import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/error/failures.dart';
import 'package:skill_swap_bd/core/error/result.dart';
import 'package:skill_swap_bd/features/auth/data/model/request/sign_up_request.dart';
import 'package:skill_swap_bd/features/auth/data/model/response/auth_user_response.dart';
import 'package:skill_swap_bd/features/auth/domain/usecase/sign_up_usecase.dart';

part 'sign_up_cubit.freezed.dart';
part 'sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._signUp) : super(const SignUpState.initial());

  final SignUpUsecase _signUp;

  Future<void> signUp(SignUpRequest request) async {
    if (state is SignUpLoading) return;
    emit(const SignUpState.loading());
    final result = await _signUp(request);
    switch (result) {
      case Ok(:final data):
        emit(SignUpState.success(user: data));
      case Err(:final failure):
        emit(SignUpState.failure(failure: failure));
    }
  }
}
