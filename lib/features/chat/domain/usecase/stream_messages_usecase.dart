import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/features/chat/data/model/response/message_response.dart';
import 'package:skill_swap_bd/features/chat/domain/repository/chat_repository.dart';

@injectable
class StreamMessagesUsecase {
  StreamMessagesUsecase(this._repository);

  final ChatRepository _repository;

  Stream<List<MessageResponse>> call({
    required String currentUserId,
    required String peerId,
  }) =>
      _repository.streamMessages(currentUserId: currentUserId, peerId: peerId);
}
