part of 'chat_cubit.dart';

@freezed
sealed class ChatState with _$ChatState {
  const factory ChatState.initial() = ChatInitial;
  const factory ChatState.loading() = ChatLoading;
  const factory ChatState.success({required List<MessageResponse> messages}) =
      ChatSuccess;
  const factory ChatState.failure({required Failure failure}) = ChatFailure;
}
