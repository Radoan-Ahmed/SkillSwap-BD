// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discovery_filter_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DiscoveryFilterRequest _$DiscoveryFilterRequestFromJson(
  Map<String, dynamic> json,
) => _DiscoveryFilterRequest(
  searchQuery: json['search_query'] as String?,
  currentUserId: json['current_user_id'] as String?,
  skillOffered: json['skill_offered'] as String?,
  skillLearned: json['skill_learned'] as String?,
);

Map<String, dynamic> _$DiscoveryFilterRequestToJson(
  _DiscoveryFilterRequest instance,
) => <String, dynamic>{
  if (instance.searchQuery case final value?) 'search_query': value,
  if (instance.currentUserId case final value?) 'current_user_id': value,
  if (instance.skillOffered case final value?) 'skill_offered': value,
  if (instance.skillLearned case final value?) 'skill_learned': value,
};
