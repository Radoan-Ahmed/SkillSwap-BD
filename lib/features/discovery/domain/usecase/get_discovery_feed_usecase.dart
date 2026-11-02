import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/error/result.dart';
import 'package:skill_swap_bd/features/discovery/data/model/request/discovery_filter_request.dart';
import 'package:skill_swap_bd/features/discovery/data/model/response/user_item_response.dart';
import 'package:skill_swap_bd/features/discovery/domain/repository/discovery_repository.dart';

@injectable
class GetDiscoveryFeedUsecase {
  GetDiscoveryFeedUsecase(this._repository);

  final DiscoveryRepository _repository;

  Future<Result<List<UserItemResponse>>> call(DiscoveryFilterRequest request) =>
      _repository.getUsers(request);
}
