import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/error/failures.dart';
import 'package:skill_swap_bd/core/error/result.dart';
import 'package:skill_swap_bd/features/profile/data/model/request/update_profile_request.dart';
import 'package:skill_swap_bd/features/profile/data/model/response/profile_response.dart';
import 'package:skill_swap_bd/features/profile/domain/usecase/get_profile_usecase.dart';
import 'package:skill_swap_bd/features/profile/domain/usecase/update_profile_usecase.dart';

part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._getProfile, this._updateProfile)
    : super(const ProfileState.initial());

  final GetProfileUsecase _getProfile;
  final UpdateProfileUsecase _updateProfile;

  Future<void> load(String userId) async {
    emit(const ProfileState.loading());
    final result = await _getProfile(userId);
    switch (result) {
      case Ok(:final data):
        emit(ProfileState.success(profile: data));
      case Err(:final failure):
        emit(ProfileState.failure(failure: failure));
    }
  }

  Future<void> update(UpdateProfileRequest request) async {
    emit(const ProfileState.updating());
    final result = await _updateProfile(request);
    switch (result) {
      case Ok(:final data):
        emit(ProfileState.updateSuccess(profile: data));
      case Err(:final failure):
        emit(ProfileState.failure(failure: failure));
    }
  }
}
