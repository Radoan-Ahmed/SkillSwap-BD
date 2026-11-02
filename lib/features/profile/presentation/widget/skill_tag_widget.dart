import 'package:flutter/material.dart';
import 'package:skill_swap_bd/core/extensions/context_extension.dart';
import 'package:skill_swap_bd/core/theme/app_radius.dart';
import 'package:skill_swap_bd/core/theme/app_spacing.dart';

class SkillTagWidget extends StatelessWidget {
  const SkillTagWidget({
    required this.skill,
    super.key,
    this.isOffered = true,
    this.onDeleted,
  });

  final String skill;
  final bool isOffered;
  final VoidCallback? onDeleted;

  @override
  Widget build(BuildContext context) {
    final bgColor = isOffered
        ? context.colorScheme.primaryContainer
        : context.colorScheme.secondaryContainer;
    final textColor = isOffered
        ? context.colorScheme.onPrimaryContainer
        : context.colorScheme.onSecondaryContainer;

    return Chip(
      label: Text(
        skill,
        style: context.textTheme.labelMedium?.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: bgColor,
      side: BorderSide.none,
      shape: const RoundedRectangleBorder(borderRadius: Radii.r16),
      deleteIcon: onDeleted != null
          ? Icon(Icons.close, size: 16, color: textColor)
          : null,
      onDeleted: onDeleted,
      visualDensity: VisualDensity.compact,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
    );
  }
}
