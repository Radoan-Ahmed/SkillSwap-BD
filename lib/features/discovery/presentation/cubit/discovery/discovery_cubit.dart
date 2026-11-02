import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/error/failures.dart';
import 'package:skill_swap_bd/core/error/result.dart';
import 'package:skill_swap_bd/features/discovery/data/model/request/discovery_filter_request.dart';
import 'package:skill_swap_bd/features/discovery/data/model/response/user_item_response.dart';
import 'package:skill_swap_bd/features/discovery/domain/usecase/get_discovery_feed_usecase.dart';

part 'discovery_cubit.freezed.dart';
part 'discovery_state.dart';

@injectable
class DiscoveryCubit extends Cubit<DiscoveryState> {
  DiscoveryCubit(this._getFeed) : super(const DiscoveryState.initial());

  final GetDiscoveryFeedUsecase _getFeed;

  Future<void> load({String? currentUserId, String? searchQuery}) async {
    emit(const DiscoveryState.loading());
    final result = await _getFeed(
      DiscoveryFilterRequest(
        currentUserId: currentUserId,
        searchQuery: searchQuery,
      ),
    );
    switch (result) {
      case Ok(:final data):
        emit(DiscoveryState.success(users: data));
      case Err(:final failure):
        emit(DiscoveryState.failure(failure: failure));
    }
  }
}
