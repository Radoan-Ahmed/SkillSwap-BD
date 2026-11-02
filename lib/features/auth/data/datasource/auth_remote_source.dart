import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/error/exceptions.dart';
import 'package:skill_swap_bd/features/auth/data/model/request/sign_in_request.dart';
import 'package:skill_swap_bd/features/auth/data/model/request/sign_up_request.dart';
import 'package:skill_swap_bd/features/auth/data/model/response/auth_user_response.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteSource {
  Future<AuthUserResponse> signIn(SignInRequest request);
  Future<AuthUserResponse> signUp(SignUpRequest request);
  Future<void> signInWithGoogle();
  Future<void> signOut();
  Future<AuthUserResponse?> getCurrentUser();
}

@LazySingleton(as: AuthRemoteSource)
class AuthRemoteSourceImpl implements AuthRemoteSource {
  AuthRemoteSourceImpl(this._supabase);

  final SupabaseClient _supabase;

  @override
  Future<AuthUserResponse> signIn(SignInRequest request) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: request.email,
        password: request.password,
      );
      final user = response.user;
      if (user == null) {
        throw const ServerException('Authentication failed: no user returned');
      }
      return AuthUserResponse(
        id: user.id,
        email: user.email ?? '',
        fullName: user.userMetadata?['full_name'] as String?,
      );
    } on AuthException catch (e) {
      throw ServerException(e.message, statusCode: e.statusCode);
    }
  }

  @override
  Future<AuthUserResponse> signUp(SignUpRequest request) async {
    try {
      final response = await _supabase.auth.signUp(
        email: request.email,
        password: request.password,
        data: {'full_name': request.fullName},
      );
      final user = response.user;
      if (user == null) {
        throw const ServerException('Registration failed: no user returned');
      }
      return AuthUserResponse(
        id: user.id,
        email: user.email ?? '',
        fullName: request.fullName,
      );
    } on AuthException catch (e) {
      throw ServerException(e.message, statusCode: e.statusCode);
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      await _supabase.auth.signInWithOAuth(OAuthProvider.google);
    } on AuthException catch (e) {
      throw ServerException(e.message, statusCode: e.statusCode);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _supabase.auth.signOut();
    } on AuthException catch (e) {
      throw ServerException(e.message, statusCode: e.statusCode);
    }
  }

  @override
  Future<AuthUserResponse?> getCurrentUser() async {
    final user = _supabase.auth.currentUser;
    if (user == null) return null;
    return AuthUserResponse(
      id: user.id,
      email: user.email ?? '',
      fullName: user.userMetadata?['full_name'] as String?,
    );
  }
}
