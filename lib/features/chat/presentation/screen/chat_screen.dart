import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_swap_bd/core/error/failure_message.dart';
import 'package:skill_swap_bd/core/extensions/context_extension.dart';
import 'package:skill_swap_bd/core/theme/app_spacing.dart';
import 'package:skill_swap_bd/core/widgets/app_app_bar.dart';
import 'package:skill_swap_bd/core/widgets/app_loader.dart';
import 'package:skill_swap_bd/core/widgets/app_text_field.dart';
import 'package:skill_swap_bd/core/widgets/empty_state_widget.dart';
import 'package:skill_swap_bd/core/widgets/error_state_widget.dart';
import 'package:skill_swap_bd/features/chat/presentation/cubit/chat/chat_cubit.dart';
import 'package:skill_swap_bd/features/chat/presentation/widget/chat_bubble_widget.dart';
import 'package:skill_swap_bd/features/common/presentation/cubit/session/session_cubit.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({required this.peerId, super.key, this.peerName});

  final String peerId;
  final String? peerName;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _messageController = TextEditingController();

  void _handleSend(String currentUserId) {
    final text = _messageController.text;
    if (text.trim().isNotEmpty) {
      context.read<ChatCubit>().send(
        currentUserId: currentUserId,
        peerId: widget.peerId,
        content: text,
      );
      _messageController.clear();
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sessionState = context.watch<SessionCubit>().state;
    final currentUserId = switch (sessionState) {
      SessionAuthenticated(:final userId) => userId,
      _ => '',
    };

    return Scaffold(
      appBar: AppAppBar(title: widget.peerName ?? context.tr.chatTitle),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder:
                  (context, state) => switch (state) {
                    ChatInitial() || ChatLoading() => const AppLoader(),
                    ChatFailure(:final failure) => ErrorStateWidget(
                      message: failure.toMessage(context),
                      onRetry:
                          () => context.read<ChatCubit>().init(
                            currentUserId: currentUserId,
                            peerId: widget.peerId,
                          ),
                    ),
                    ChatSuccess(:final messages) when messages.isEmpty =>
                      EmptyStateWidget(message: context.tr.chatEmptyState),
                    ChatSuccess(:final messages) => ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.md,
                      ),
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final msg = messages[index];
                        final isMe = msg.senderId == currentUserId;
                        return ChatBubbleWidget(message: msg, isMe: isMe);
                      },
                    ),
                  },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      controller: _messageController,
                      hint: context.tr.chatMessageHint,
                    ),
                  ),
                  Gaps.h8,
                  IconButton.filled(
                    onPressed: () => _handleSend(currentUserId),
                    icon: const Icon(Icons.send_rounded),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
