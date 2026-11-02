import 'package:skill_swap_bd/core/error/result.dart';
import 'package:skill_swap_bd/features/auth/data/model/request/sign_in_request.dart';
import 'package:skill_swap_bd/features/auth/data/model/request/sign_up_request.dart';
import 'package:skill_swap_bd/features/auth/data/model/response/auth_user_response.dart';

abstract interface class AuthRepository {
  Future<Result<AuthUserResponse>> signIn(SignInRequest request);
  Future<Result<AuthUserResponse>> signUp(SignUpRequest request);
  Future<Result<void>> signInWithGoogle();
  Future<Result<void>> signOut();
  Future<Result<AuthUserResponse?>> getCurrentUser();
}
