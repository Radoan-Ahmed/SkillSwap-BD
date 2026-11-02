import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/error/guard.dart';
import 'package:skill_swap_bd/core/error/result.dart';
import 'package:skill_swap_bd/features/discovery/data/datasource/discovery_remote_source.dart';
import 'package:skill_swap_bd/features/discovery/data/model/request/discovery_filter_request.dart';
import 'package:skill_swap_bd/features/discovery/data/model/response/user_item_response.dart';
import 'package:skill_swap_bd/features/discovery/domain/repository/discovery_repository.dart';

@LazySingleton(as: DiscoveryRepository)
class DiscoveryRepositoryImpl implements DiscoveryRepository {
  DiscoveryRepositoryImpl(this._remote);

  final DiscoveryRemoteSource _remote;

  @override
  Future<Result<List<UserItemResponse>>> getUsers(
    DiscoveryFilterRequest request,
  ) => guard(() => _remote.getUsers(request));

  @override
  Future<Result<UserItemResponse?>> getUserById(String id) =>
      guard(() => _remote.getUserById(id));
}
