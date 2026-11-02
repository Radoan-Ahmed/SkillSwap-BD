import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/error/exceptions.dart';
import 'package:skill_swap_bd/features/discovery/data/model/request/discovery_filter_request.dart';
import 'package:skill_swap_bd/features/discovery/data/model/response/user_item_response.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class DiscoveryRemoteSource {
  Future<List<UserItemResponse>> getUsers(DiscoveryFilterRequest request);
  Future<UserItemResponse?> getUserById(String id);
}

@LazySingleton(as: DiscoveryRemoteSource)
class DiscoveryRemoteSourceImpl implements DiscoveryRemoteSource {
  DiscoveryRemoteSourceImpl(this._supabase);

  final SupabaseClient _supabase;

  @override
  Future<List<UserItemResponse>> getUsers(
    DiscoveryFilterRequest request,
  ) async {
    try {
      var query = _supabase.from('profiles').select();
      if (request.currentUserId != null && request.currentUserId!.isNotEmpty) {
        query = query.neq('id', request.currentUserId!);
      }

      final response = await query
          .order('updated_at', ascending: false)
          .limit(50);
      final list = response as List;

      final results = <UserItemResponse>[];
      final queryLower = request.searchQuery?.trim().toLowerCase();

      for (final item in list) {
        final map = Map<String, dynamic>.from(item as Map);
        final offered =
            (map['skills_offered'] as List?)
                ?.map((e) => e.toString())
                .toList() ??
            [];
        final learned =
            (map['skills_learned'] as List?)
                ?.map((e) => e.toString())
                .toList() ??
            [];

        map['skills_offered'] = offered;
        map['skills_learned'] = learned;

        final userItem = UserItemResponse.fromJson(map);

        if (queryLower != null && queryLower.isNotEmpty) {
          final matchesName = userItem.fullName.toLowerCase().contains(
            queryLower,
          );
          final matchesOffered = offered.any(
            (s) => s.toLowerCase().contains(queryLower),
          );
          final matchesLearned = learned.any(
            (s) => s.toLowerCase().contains(queryLower),
          );
          if (!matchesName && !matchesOffered && !matchesLearned) {
            continue;
          }
        }

        results.add(userItem);
      }

      return results;
    } on PostgrestException catch (e) {
      throw ServerException(e.message, statusCode: e.code);
    }
  }

  @override
  Future<UserItemResponse?> getUserById(String id) async {
    try {
      final data =
          await _supabase.from('profiles').select().eq('id', id).maybeSingle();
      if (data == null) return null;
      final map = Map<String, dynamic>.from(data);
      map['skills_offered'] =
          (map['skills_offered'] as List?)?.map((e) => e.toString()).toList() ??
          [];
      map['skills_learned'] =
          (map['skills_learned'] as List?)?.map((e) => e.toString()).toList() ??
          [];
      return UserItemResponse.fromJson(map);
    } on PostgrestException catch (e) {
      throw ServerException(e.message, statusCode: e.code);
    }
  }
}
