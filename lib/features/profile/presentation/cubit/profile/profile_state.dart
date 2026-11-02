part of 'profile_cubit.dart';

@freezed
sealed class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = ProfileInitial;
  const factory ProfileState.loading() = ProfileLoading;
  const factory ProfileState.success({required ProfileResponse profile}) =
      ProfileSuccess;
  const factory ProfileState.updating() = ProfileUpdating;
  const factory ProfileState.updateSuccess({
    required ProfileResponse profile,
  }) = ProfileUpdateSuccess;
  const factory ProfileState.failure({required Failure failure}) =
      ProfileFailure;
}
