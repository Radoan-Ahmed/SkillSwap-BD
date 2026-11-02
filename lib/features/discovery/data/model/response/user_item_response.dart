import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_item_response.freezed.dart';
part 'user_item_response.g.dart';

@freezed
abstract class UserItemResponse with _$UserItemResponse {
  const factory UserItemResponse({
    required String id,
    @Default('') String fullName,
    @Default('') String bio,
    @Default([]) List<String> skillsOffered,
    @Default([]) List<String> skillsLearned,
    String? avatarUrl,
    @Default(false) bool isMutualMatch,
  }) = _UserItemResponse;

  factory UserItemResponse.fromJson(Map<String, dynamic> json) =>
      _$UserItemResponseFromJson(json);
}
