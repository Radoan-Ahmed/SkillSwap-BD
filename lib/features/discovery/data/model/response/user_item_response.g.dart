// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserItemResponse _$UserItemResponseFromJson(Map<String, dynamic> json) =>
    _UserItemResponse(
      id: json['id'] as String,
      fullName: json['full_name'] as String? ?? '',
      bio: json['bio'] as String? ?? '',
      skillsOffered:
          (json['skills_offered'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      skillsLearned:
          (json['skills_learned'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      avatarUrl: json['avatar_url'] as String?,
      isMutualMatch: json['is_mutual_match'] as bool? ?? false,
    );

Map<String, dynamic> _$UserItemResponseToJson(_UserItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'bio': instance.bio,
      'skills_offered': instance.skillsOffered,
      'skills_learned': instance.skillsLearned,
      if (instance.avatarUrl case final value?) 'avatar_url': value,
      'is_mutual_match': instance.isMutualMatch,
    };
