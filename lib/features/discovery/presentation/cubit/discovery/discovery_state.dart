part of 'discovery_cubit.dart';

@freezed
sealed class DiscoveryState with _$DiscoveryState {
  const factory DiscoveryState.initial() = DiscoveryInitial;
  const factory DiscoveryState.loading() = DiscoveryLoading;
  const factory DiscoveryState.success({
    required List<UserItemResponse> users,
  }) = DiscoverySuccess;
  const factory DiscoveryState.failure({required Failure failure}) =
      DiscoveryFailure;
}
