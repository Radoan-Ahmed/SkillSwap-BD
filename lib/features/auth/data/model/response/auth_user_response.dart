import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user_response.freezed.dart';
part 'auth_user_response.g.dart';

@freezed
abstract class AuthUserResponse with _$AuthUserResponse {
  const factory AuthUserResponse({
    required String id,
    required String email,
    String? fullName,
  }) = _AuthUserResponse;

  factory AuthUserResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthUserResponseFromJson(json);
}
