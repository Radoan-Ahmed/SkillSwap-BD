import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/error/result.dart';
import 'package:skill_swap_bd/features/profile/data/model/request/update_profile_request.dart';
import 'package:skill_swap_bd/features/profile/data/model/response/profile_response.dart';
import 'package:skill_swap_bd/features/profile/domain/repository/profile_repository.dart';

@injectable
class UpdateProfileUsecase {
  UpdateProfileUsecase(this._repository);

  final ProfileRepository _repository;

  Future<Result<ProfileResponse>> call(UpdateProfileRequest request) =>
      _repository.updateProfile(request);
}
