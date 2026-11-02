import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/error/result.dart';
import 'package:skill_swap_bd/features/profile/data/model/response/profile_response.dart';
import 'package:skill_swap_bd/features/profile/domain/repository/profile_repository.dart';

@injectable
class GetProfileUsecase {
  GetProfileUsecase(this._repository);

  final ProfileRepository _repository;

  Future<Result<ProfileResponse>> call(String userId) =>
      _repository.getProfile(userId);
}
