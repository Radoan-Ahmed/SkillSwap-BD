part of 'sign_up_cubit.dart';

@freezed
sealed class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = SignUpInitial;
  const factory SignUpState.loading() = SignUpLoading;
  const factory SignUpState.success({required AuthUserResponse user}) =
      SignUpSuccess;
  const factory SignUpState.failure({required Failure failure}) = SignUpFailure;
}
