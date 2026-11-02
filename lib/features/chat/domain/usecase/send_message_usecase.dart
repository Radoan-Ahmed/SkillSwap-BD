import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/error/result.dart';
import 'package:skill_swap_bd/features/chat/data/model/request/send_message_request.dart';
import 'package:skill_swap_bd/features/chat/data/model/response/message_response.dart';
import 'package:skill_swap_bd/features/chat/domain/repository/chat_repository.dart';

@injectable
class SendMessageUsecase {
  SendMessageUsecase(this._repository);

  final ChatRepository _repository;

  Future<Result<MessageResponse>> call(SendMessageRequest request) =>
      _repository.sendMessage(request);
}
