import 'package:skill_swap_bd/core/error/result.dart';
import 'package:skill_swap_bd/features/discovery/data/model/request/discovery_filter_request.dart';
import 'package:skill_swap_bd/features/discovery/data/model/response/user_item_response.dart';

abstract interface class DiscoveryRepository {
  Future<Result<List<UserItemResponse>>> getUsers(
    DiscoveryFilterRequest request,
  );
  Future<Result<UserItemResponse?>> getUserById(String id);
}
