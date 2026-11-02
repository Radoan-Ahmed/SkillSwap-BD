import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/error/result.dart';
import 'package:skill_swap_bd/features/auth/domain/repository/auth_repository.dart';

@injectable
class SignOutUsecase {
  SignOutUsecase(this._repository);

  final AuthRepository _repository;

  Future<Result<void>> call() => _repository.signOut();
}
