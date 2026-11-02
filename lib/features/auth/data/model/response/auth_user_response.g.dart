// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthUserResponse _$AuthUserResponseFromJson(Map<String, dynamic> json) =>
    _AuthUserResponse(
      id: json['id'] as String,
      email: json['email'] as String,
      fullName: json['full_name'] as String?,
    );

Map<String, dynamic> _$AuthUserResponseToJson(_AuthUserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      if (instance.fullName case final value?) 'full_name': value,
    };
