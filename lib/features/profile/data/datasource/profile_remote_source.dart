import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/error/exceptions.dart';
import 'package:skill_swap_bd/features/profile/data/model/request/update_profile_request.dart';
import 'package:skill_swap_bd/features/profile/data/model/response/profile_response.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class ProfileRemoteSource {
  Future<ProfileResponse> getProfile(String userId);
  Future<ProfileResponse> updateProfile(UpdateProfileRequest request);
}

@LazySingleton(as: ProfileRemoteSource)
class ProfileRemoteSourceImpl implements ProfileRemoteSource {
  ProfileRemoteSourceImpl(this._supabase);

  final SupabaseClient _supabase;

  @override
  Future<ProfileResponse> getProfile(String userId) async {
    try {
      final data =
          await _supabase
              .from('profiles')
              .select()
              .eq('id', userId)
              .maybeSingle();

      if (data == null) {
        final user = _supabase.auth.currentUser;
        return ProfileResponse(
          id: userId,
          email: user?.email ?? '',
          fullName: user?.userMetadata?['full_name'] as String? ?? '',
        );
      }

      final email = _supabase.auth.currentUser?.email ?? '';
      final map = Map<String, dynamic>.from(data)..['email'] = email;
      if (map['skills_offered'] is List) {
        map['skills_offered'] =
            (map['skills_offered'] as List).map((e) => e.toString()).toList();
      }
      if (map['skills_learned'] is List) {
        map['skills_learned'] =
            (map['skills_learned'] as List).map((e) => e.toString()).toList();
      }

      return ProfileResponse.fromJson(map);
    } on PostgrestException catch (e) {
      throw ServerException(e.message, statusCode: e.code);
    }
  }

  @override
  Future<ProfileResponse> updateProfile(UpdateProfileRequest request) async {
    try {
      final updateData = {
        'id': request.id,
        'full_name': request.fullName,
        'bio': request.bio,
        'skills_offered': request.skillsOffered,
        'skills_learned': request.skillsLearned,
        'updated_at': DateTime.now().toIso8601String(),
      };

      await _supabase.from('profiles').upsert(updateData);
      return getProfile(request.id);
    } on PostgrestException catch (e) {
      throw ServerException(e.message, statusCode: e.code);
    }
  }
}
