import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/error/exceptions.dart';
import 'package:skill_swap_bd/features/chat/data/model/request/send_message_request.dart';
import 'package:skill_swap_bd/features/chat/data/model/response/message_response.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class ChatRemoteSource {
  Future<List<MessageResponse>> getMessages({
    required String currentUserId,
    required String peerId,
  });
  Future<MessageResponse> sendMessage(SendMessageRequest request);
  Stream<List<MessageResponse>> streamMessages({
    required String currentUserId,
    required String peerId,
  });
}

@LazySingleton(as: ChatRemoteSource)
class ChatRemoteSourceImpl implements ChatRemoteSource {
  ChatRemoteSourceImpl(this._supabase);

  final SupabaseClient _supabase;

  @override
  Future<List<MessageResponse>> getMessages({
    required String currentUserId,
    required String peerId,
  }) async {
    try {
      final response = await _supabase
          .from('messages')
          .select()
          .or(
            'and(sender_id.eq.$currentUserId,receiver_id.eq.$peerId),'
            'and(sender_id.eq.$peerId,receiver_id.eq.$currentUserId)',
          )
          .order('created_at', ascending: true);

      return (response as List)
          .map(
            (e) =>
                MessageResponse.fromJson(Map<String, dynamic>.from(e as Map)),
          )
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message, statusCode: e.code);
    }
  }

  @override
  Future<MessageResponse> sendMessage(SendMessageRequest request) async {
    try {
      final response =
          await _supabase
              .from('messages')
              .insert({
                'sender_id': request.senderId,
                'receiver_id': request.receiverId,
                'content': request.content,
                'created_at': DateTime.now().toIso8601String(),
              })
              .select()
              .single();

      return MessageResponse.fromJson(Map<String, dynamic>.from(response));
    } on PostgrestException catch (e) {
      throw ServerException(e.message, statusCode: e.code);
    }
  }

  @override
  Stream<List<MessageResponse>> streamMessages({
    required String currentUserId,
    required String peerId,
  }) {
    return _supabase
        .from('messages')
        .stream(primaryKey: ['id'])
        .order('created_at', ascending: true)
        .map(
          (list) =>
              list
                  .where(
                    (map) =>
                        (map['sender_id'] == currentUserId &&
                            map['receiver_id'] == peerId) ||
                        (map['sender_id'] == peerId &&
                            map['receiver_id'] == currentUserId),
                  )
                  .map(
                    (map) => MessageResponse.fromJson(
                      Map<String, dynamic>.from(map),
                    ),
                  )
                  .toList(),
        );
  }
}
