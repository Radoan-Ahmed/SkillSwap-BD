import 'package:freezed_annotation/freezed_annotation.dart';

part 'discovery_filter_request.freezed.dart';
part 'discovery_filter_request.g.dart';

@freezed
abstract class DiscoveryFilterRequest with _$DiscoveryFilterRequest {
  const factory DiscoveryFilterRequest({
    String? searchQuery,
    String? currentUserId,
    String? skillOffered,
    String? skillLearned,
  }) = _DiscoveryFilterRequest;

  factory DiscoveryFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$DiscoveryFilterRequestFromJson(json);
}
