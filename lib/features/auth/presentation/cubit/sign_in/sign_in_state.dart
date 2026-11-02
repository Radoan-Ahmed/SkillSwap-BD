part of 'sign_in_cubit.dart';

@freezed
sealed class SignInState with _$SignInState {
  const factory SignInState.initial() = SignInInitial;
  const factory SignInState.loading() = SignInLoading;
  const factory SignInState.success({required AuthUserResponse user}) =
      SignInSuccess;
  const factory SignInState.googleRedirected() = SignInGoogleRedirected;
  const factory SignInState.failure({required Failure failure}) = SignInFailure;
}
