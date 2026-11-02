import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/error/guard.dart';
import 'package:skill_swap_bd/core/error/result.dart';
import 'package:skill_swap_bd/features/profile/data/datasource/profile_remote_source.dart';
import 'package:skill_swap_bd/features/profile/data/model/request/update_profile_request.dart';
import 'package:skill_swap_bd/features/profile/data/model/response/profile_response.dart';
import 'package:skill_swap_bd/features/profile/domain/repository/profile_repository.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._remote);

  final ProfileRemoteSource _remote;

  @override
  Future<Result<ProfileResponse>> getProfile(String userId) =>
      guard(() => _remote.getProfile(userId));

  @override
  Future<Result<ProfileResponse>> updateProfile(UpdateProfileRequest request) =>
      guard(() => _remote.updateProfile(request));
}
