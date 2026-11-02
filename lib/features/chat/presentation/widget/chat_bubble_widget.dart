import 'package:flutter/material.dart';
import 'package:skill_swap_bd/core/extensions/context_extension.dart';
import 'package:skill_swap_bd/core/theme/app_radius.dart';
import 'package:skill_swap_bd/core/theme/app_spacing.dart';
import 'package:skill_swap_bd/core/utils/formatters/date_formatter.dart';
import 'package:skill_swap_bd/features/chat/data/model/response/message_response.dart';

class ChatBubbleWidget extends StatelessWidget {
  const ChatBubbleWidget({
    required this.message,
    required this.isMe,
    super.key,
  });

  final MessageResponse message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    final bgColor =
        isMe
            ? context.colorScheme.primary
            : context.colorScheme.surfaceContainerHighest;
    final textColor =
        isMe ? context.colorScheme.onPrimary : context.colorScheme.onSurface;

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: AppSpacing.xxs,
          horizontal: AppSpacing.md,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.sm,
          horizontal: AppSpacing.md,
        ),
        constraints: BoxConstraints(maxWidth: context.screenSize.width * 0.75),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(AppRadius.md),
            topRight: const Radius.circular(AppRadius.md),
            bottomLeft:
                isMe ? const Radius.circular(AppRadius.md) : Radius.zero,
            bottomRight:
                isMe ? Radius.zero : const Radius.circular(AppRadius.md),
          ),
        ),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              message.content,
              style: context.textTheme.bodyMedium?.copyWith(color: textColor),
            ),
            Gaps.v4,
            Text(
              DateFormatter.formatTime(message.createdAt),
              style: context.textTheme.labelSmall?.copyWith(
                color: textColor.withValues(alpha: 0.7),
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
