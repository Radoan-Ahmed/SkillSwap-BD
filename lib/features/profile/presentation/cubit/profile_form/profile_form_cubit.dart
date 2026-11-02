import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/utils/validators.dart';
import 'package:skill_swap_bd/features/profile/data/model/request/update_profile_request.dart';
import 'package:skill_swap_bd/features/profile/data/model/response/profile_response.dart';

part 'profile_form_cubit.freezed.dart';
part 'profile_form_state.dart';

@injectable
class ProfileFormCubit extends Cubit<ProfileFormState> {
  ProfileFormCubit() : super(const ProfileFormState());

  void init(ProfileResponse profile) {
    emit(
      state.copyWith(
        userId: profile.id,
        fullName: profile.fullName,
        bio: profile.bio,
        skillsOffered: profile.skillsOffered,
        skillsLearned: profile.skillsLearned,
      ),
    );
  }

  void fullNameChanged(String value) =>
      emit(state.copyWith(fullName: value, fullNameError: null));

  void bioChanged(String value) => emit(state.copyWith(bio: value));

  void addSkillOffered(String skill) {
    final s = skill.trim();
    if (s.isEmpty || state.skillsOffered.contains(s)) return;
    emit(state.copyWith(skillsOffered: [...state.skillsOffered, s]));
  }

  void removeSkillOffered(String skill) {
    emit(
      state.copyWith(
        skillsOffered: state.skillsOffered.where((e) => e != skill).toList(),
      ),
    );
  }

  void addSkillLearned(String skill) {
    final s = skill.trim();
    if (s.isEmpty || state.skillsLearned.contains(s)) return;
    emit(state.copyWith(skillsLearned: [...state.skillsLearned, s]));
  }

  void removeSkillLearned(String skill) {
    emit(
      state.copyWith(
        skillsLearned: state.skillsLearned.where((e) => e != skill).toList(),
      ),
    );
  }

  bool validate() {
    final fullNameError = Validators.required(state.fullName);
    emit(state.copyWith(fullNameError: fullNameError));
    return fullNameError == null;
  }

  UpdateProfileRequest buildRequest() => UpdateProfileRequest(
    id: state.userId ?? '',
    fullName: state.fullName?.trim() ?? '',
    bio: state.bio?.trim(),
    skillsOffered: state.skillsOffered,
    skillsLearned: state.skillsLearned,
  );
}
