part of 'profile_form_cubit.dart';

@freezed
abstract class ProfileFormState with _$ProfileFormState {
  const factory ProfileFormState({
    String? userId,
    String? fullName,
    String? bio,
    @Default([]) List<String> skillsOffered,
    @Default([]) List<String> skillsLearned,
    ValidationError? fullNameError,
  }) = _ProfileFormState;
}
