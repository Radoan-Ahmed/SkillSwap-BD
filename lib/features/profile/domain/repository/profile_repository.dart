import 'package:skill_swap_bd/core/error/result.dart';
import 'package:skill_swap_bd/features/profile/data/model/request/update_profile_request.dart';
import 'package:skill_swap_bd/features/profile/data/model/response/profile_response.dart';

abstract interface class ProfileRepository {
  Future<Result<ProfileResponse>> getProfile(String userId);
  Future<Result<ProfileResponse>> updateProfile(UpdateProfileRequest request);
}
