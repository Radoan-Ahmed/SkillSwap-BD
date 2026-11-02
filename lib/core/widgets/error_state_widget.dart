import 'package:flutter/material.dart';
import 'package:skill_swap_bd/core/extensions/context_extension.dart';
import 'package:skill_swap_bd/core/theme/app_spacing.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({required this.message, super.key, this.onRetry});

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colorScheme.error,
              ),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              Gaps.v16,
              FilledButton.tonal(
                onPressed: onRetry,
                child: Text(context.tr.commonRetry),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
