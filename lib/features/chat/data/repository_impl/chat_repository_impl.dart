import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/error/guard.dart';
import 'package:skill_swap_bd/core/error/result.dart';
import 'package:skill_swap_bd/features/chat/data/datasource/chat_remote_source.dart';
import 'package:skill_swap_bd/features/chat/data/model/request/send_message_request.dart';
import 'package:skill_swap_bd/features/chat/data/model/response/message_response.dart';
import 'package:skill_swap_bd/features/chat/domain/repository/chat_repository.dart';

@LazySingleton(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  ChatRepositoryImpl(this._remote);

  final ChatRemoteSource _remote;

  @override
  Future<Result<List<MessageResponse>>> getMessages({
    required String currentUserId,
    required String peerId,
  }) => guard(
    () => _remote.getMessages(currentUserId: currentUserId, peerId: peerId),
  );

  @override
  Future<Result<MessageResponse>> sendMessage(SendMessageRequest request) =>
      guard(() => _remote.sendMessage(request));

  @override
  Stream<List<MessageResponse>> streamMessages({
    required String currentUserId,
    required String peerId,
  }) => _remote.streamMessages(currentUserId: currentUserId, peerId: peerId);
}
