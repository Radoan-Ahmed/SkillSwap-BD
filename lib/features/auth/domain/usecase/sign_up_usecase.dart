import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/error/result.dart';
import 'package:skill_swap_bd/features/auth/data/model/request/sign_up_request.dart';
import 'package:skill_swap_bd/features/auth/data/model/response/auth_user_response.dart';
import 'package:skill_swap_bd/features/auth/domain/repository/auth_repository.dart';

@injectable
class SignUpUsecase {
  SignUpUsecase(this._repository);

  final AuthRepository _repository;

  Future<Result<AuthUserResponse>> call(SignUpRequest request) =>
      _repository.signUp(request);
}
