part of 'session_cubit.dart';

@freezed
sealed class SessionState with _$SessionState {
  const factory SessionState.initial() = SessionInitial;
  const factory SessionState.authenticated({required String userId}) =
      SessionAuthenticated;
  const factory SessionState.unauthenticated() = SessionUnauthenticated;
}
