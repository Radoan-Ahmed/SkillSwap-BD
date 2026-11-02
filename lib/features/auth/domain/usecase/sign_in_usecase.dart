import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/error/result.dart';
import 'package:skill_swap_bd/features/auth/data/model/request/sign_in_request.dart';
import 'package:skill_swap_bd/features/auth/data/model/response/auth_user_response.dart';
import 'package:skill_swap_bd/features/auth/domain/repository/auth_repository.dart';

@injectable
class SignInUsecase {
  SignInUsecase(this._repository);

  final AuthRepository _repository;

  Future<Result<AuthUserResponse>> call(SignInRequest request) =>
      _repository.signIn(request);
}
