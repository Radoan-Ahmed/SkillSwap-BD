import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/error/result.dart';
import 'package:skill_swap_bd/features/chat/data/model/response/message_response.dart';
import 'package:skill_swap_bd/features/chat/domain/repository/chat_repository.dart';

@injectable
class GetMessagesUsecase {
  GetMessagesUsecase(this._repository);

  final ChatRepository _repository;

  Future<Result<List<MessageResponse>>> call({
    required String currentUserId,
    required String peerId,
  }) => _repository.getMessages(currentUserId: currentUserId, peerId: peerId);
}
