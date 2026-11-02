import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/error/guard.dart';
import 'package:skill_swap_bd/core/error/result.dart';
import 'package:skill_swap_bd/features/auth/data/datasource/auth_remote_source.dart';
import 'package:skill_swap_bd/features/auth/data/model/request/sign_in_request.dart';
import 'package:skill_swap_bd/features/auth/data/model/request/sign_up_request.dart';
import 'package:skill_swap_bd/features/auth/data/model/response/auth_user_response.dart';
import 'package:skill_swap_bd/features/auth/domain/repository/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._remote);

  final AuthRemoteSource _remote;

  @override
  Future<Result<AuthUserResponse>> signIn(SignInRequest request) =>
      guard(() => _remote.signIn(request));

  @override
  Future<Result<AuthUserResponse>> signUp(SignUpRequest request) =>
      guard(() => _remote.signUp(request));

  @override
  Future<Result<void>> signInWithGoogle() => guard(_remote.signInWithGoogle);

  @override
  Future<Result<void>> signOut() => guard(_remote.signOut);

  @override
  Future<Result<AuthUserResponse?>> getCurrentUser() =>
      guard(_remote.getCurrentUser);
}
