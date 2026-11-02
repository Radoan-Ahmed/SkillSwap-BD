// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateProfileRequest _$UpdateProfileRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateProfileRequest(
  id: json['id'] as String,
  fullName: json['full_name'] as String,
  bio: json['bio'] as String?,
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
);

Map<String, dynamic> _$UpdateProfileRequestToJson(
  _UpdateProfileRequest instance,
) => <String, dynamic>{
  'id': instance.id,
  'full_name': instance.fullName,
  if (instance.bio case final value?) 'bio': value,
  'skills_offered': instance.skillsOffered,
  'skills_learned': instance.skillsLearned,
};
