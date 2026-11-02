import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_swap_bd/core/di/injection.dart';
import 'package:skill_swap_bd/core/error/failure_message.dart';
import 'package:skill_swap_bd/core/extensions/context_extension.dart';
import 'package:skill_swap_bd/core/router/route_names.dart';
import 'package:skill_swap_bd/core/theme/app_spacing.dart';
import 'package:skill_swap_bd/core/widgets/app_app_bar.dart';
import 'package:skill_swap_bd/core/widgets/app_button.dart';
import 'package:skill_swap_bd/core/widgets/app_loader.dart';
import 'package:skill_swap_bd/core/widgets/empty_state_widget.dart';
import 'package:skill_swap_bd/core/widgets/error_state_widget.dart';
import 'package:skill_swap_bd/features/auth/domain/usecase/sign_out_usecase.dart';
import 'package:skill_swap_bd/features/common/presentation/cubit/session/session_cubit.dart';
import 'package:skill_swap_bd/features/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:skill_swap_bd/features/profile/presentation/widget/skill_tag_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sessionState = context.watch<SessionCubit>().state;
    final currentUserId = switch (sessionState) {
      SessionAuthenticated(:final userId) => userId,
      _ => '',
    };

    return Scaffold(
      appBar: AppAppBar(
        title: context.tr.profileTitle,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () async {
              final updated = await context.pushNamed(RouteNames.editProfile);
              if (updated == true && context.mounted) {
                await context.read<ProfileCubit>().load(currentUserId);
              }
            },
          ),
        ],
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) => switch (state) {
          ProfileInitial() ||
          ProfileLoading() ||
          ProfileUpdating() => const AppLoader(),
          ProfileFailure(:final failure) => ErrorStateWidget(
              message: failure.toMessage(context),
              onRetry: () =>
                  context.read<ProfileCubit>().load(currentUserId),
            ),
          ProfileSuccess(:final profile) ||
          ProfileUpdateSuccess(:final profile) => SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 48,
                      backgroundColor: context.colorScheme.primaryContainer,
                      child: Text(
                        profile.fullName.isNotEmpty
                            ? profile.fullName[0].toUpperCase()
                            : '?',
                        style: context.textTheme.headlineLarge?.copyWith(
                          color: context.colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                  ),
                  Gaps.v16,
                  Center(
                    child: Text(
                      profile.fullName.isNotEmpty
                          ? profile.fullName
                          : 'SkillSwap User',
                      style: context.textTheme.headlineSmall,
                    ),
                  ),
                  if (profile.bio.isNotEmpty) ...[
                    Gaps.v8,
                    Center(
                      child: Text(
                        profile.bio,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                  Gaps.v24,
                  const Divider(),
                  Gaps.v16,
                  Text(
                    context.tr.profileSkillsOfferedLabel,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v8,
                  if (profile.skillsOffered.isEmpty)
                    const EmptyStateWidget(
                      message: 'No offering skills added yet.',
                    )
                  else
                    Wrap(
                      spacing: AppSpacing.sm,
                      runSpacing: AppSpacing.xs,
                      children: profile.skillsOffered
                          .map((s) => SkillTagWidget(skill: s))
                          .toList(),
                    ),
                  Gaps.v24,
                  Text(
                    context.tr.profileSkillsLearnedLabel,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v8,
                  if (profile.skillsLearned.isEmpty)
                    const EmptyStateWidget(
                      message: 'No learning skills added yet.',
                    )
                  else
                    Wrap(
                      spacing: AppSpacing.sm,
                      runSpacing: AppSpacing.xs,
                      children: profile.skillsLearned
                          .map(
                            (s) => SkillTagWidget(skill: s, isOffered: false),
                          )
                          .toList(),
                    ),
                  Gaps.v32,
                  AppButton(
                    label: context.tr.authSignOutButton,
                    isFullWidth: true,
                    onPressed: () async {
                      await sl<SignOutUsecase>()();
                      if (context.mounted) {
                        context.goNamed(RouteNames.login);
                      }
                    },
                  ),
                ],
              ),
            ),
        },
      ),
    );
  }
}
