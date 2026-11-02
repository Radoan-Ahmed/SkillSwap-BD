import 'package:flutter/material.dart';
import 'package:skill_swap_bd/core/extensions/context_extension.dart';
import 'package:skill_swap_bd/core/theme/app_radius.dart';
import 'package:skill_swap_bd/core/theme/app_spacing.dart';
import 'package:skill_swap_bd/core/widgets/app_button.dart';
import 'package:skill_swap_bd/features/discovery/data/model/response/user_item_response.dart';
import 'package:skill_swap_bd/features/profile/presentation/widget/skill_tag_widget.dart';

class DiscoveryUserCardWidget extends StatelessWidget {
  const DiscoveryUserCardWidget({
    required this.user,
    required this.onConnect,
    super.key,
  });

  final UserItemResponse user;
  final VoidCallback onConnect;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      shape: const RoundedRectangleBorder(borderRadius: Radii.r12),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: context.colorScheme.primaryContainer,
                  child: Text(
                    user.fullName.isNotEmpty
                        ? user.fullName[0].toUpperCase()
                        : '?',
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Gaps.h12,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.fullName.isNotEmpty
                            ? user.fullName
                            : 'Skill Seeker',
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (user.bio.isNotEmpty)
                        Text(
                          user.bio,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
              ],
            ),
            if (user.skillsOffered.isNotEmpty) ...[
              Gaps.v12,
              Text(
                context.tr.discoveryOfferingFilter,
                style: context.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.colorScheme.primary,
                ),
              ),
              Gaps.v4,
              Wrap(
                spacing: AppSpacing.xs,
                runSpacing: AppSpacing.xxs,
                children:
                    user.skillsOffered
                        .map((s) => SkillTagWidget(skill: s))
                        .toList(),
              ),
            ],
            if (user.skillsLearned.isNotEmpty) ...[
              Gaps.v8,
              Text(
                context.tr.discoveryLearningFilter,
                style: context.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.colorScheme.secondary,
                ),
              ),
              Gaps.v4,
              Wrap(
                spacing: AppSpacing.xs,
                runSpacing: AppSpacing.xxs,
                children:
                    user.skillsLearned
                        .map((s) => SkillTagWidget(skill: s, isOffered: false))
                        .toList(),
              ),
            ],
            Gaps.v16,
            AppButton(
              label: context.tr.discoveryConnectButton,
              isFullWidth: true,
              onPressed: onConnect,
            ),
          ],
        ),
      ),
    );
  }
}
