// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    _ProfileResponse(
      id: json['id'] as String,
      email: json['email'] as String? ?? '',
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
    );

Map<String, dynamic> _$ProfileResponseToJson(_ProfileResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'full_name': instance.fullName,
      'bio': instance.bio,
      'skills_offered': instance.skillsOffered,
      'skills_learned': instance.skillsLearned,
      if (instance.avatarUrl case final value?) 'avatar_url': value,
    };
