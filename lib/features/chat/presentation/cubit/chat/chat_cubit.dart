import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/error/failures.dart';
import 'package:skill_swap_bd/core/error/result.dart';
import 'package:skill_swap_bd/features/chat/data/model/request/send_message_request.dart';
import 'package:skill_swap_bd/features/chat/data/model/response/message_response.dart';
import 'package:skill_swap_bd/features/chat/domain/usecase/get_messages_usecase.dart';
import 'package:skill_swap_bd/features/chat/domain/usecase/send_message_usecase.dart';
import 'package:skill_swap_bd/features/chat/domain/usecase/stream_messages_usecase.dart';

part 'chat_cubit.freezed.dart';
part 'chat_state.dart';

@injectable
class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this._getMessages, this._sendMessage, this._streamMessages)
    : super(const ChatState.initial());

  final GetMessagesUsecase _getMessages;
  final SendMessageUsecase _sendMessage;
  final StreamMessagesUsecase _streamMessages;

  StreamSubscription<List<MessageResponse>>? _subscription;

  Future<void> init({
    required String currentUserId,
    required String peerId,
  }) async {
    emit(const ChatState.loading());
    final result = await _getMessages(
      currentUserId: currentUserId,
      peerId: peerId,
    );
    switch (result) {
      case Ok(:final data):
        emit(ChatState.success(messages: data));
      case Err(:final failure):
        emit(ChatState.failure(failure: failure));
    }

    await _subscription?.cancel();
    _subscription = _streamMessages(
      currentUserId: currentUserId,
      peerId: peerId,
    ).listen((messages) {
      emit(ChatState.success(messages: messages));
    });
  }

  Future<void> send({
    required String currentUserId,
    required String peerId,
    required String content,
  }) async {
    final text = content.trim();
    if (text.isEmpty) return;

    await _sendMessage(
      SendMessageRequest(
        senderId: currentUserId,
        receiverId: peerId,
        content: text,
      ),
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
