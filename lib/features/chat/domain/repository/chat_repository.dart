import 'package:skill_swap_bd/core/error/result.dart';
import 'package:skill_swap_bd/features/chat/data/model/request/send_message_request.dart';
import 'package:skill_swap_bd/features/chat/data/model/response/message_response.dart';

abstract interface class ChatRepository {
  Future<Result<List<MessageResponse>>> getMessages({
    required String currentUserId,
    required String peerId,
  });
  Future<Result<MessageResponse>> sendMessage(SendMessageRequest request);
  Stream<List<MessageResponse>> streamMessages({
    required String currentUserId,
    required String peerId,
  });
}
