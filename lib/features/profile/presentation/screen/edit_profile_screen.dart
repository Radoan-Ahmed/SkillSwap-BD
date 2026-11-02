import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_swap_bd/core/error/failure_message.dart';
import 'package:skill_swap_bd/core/extensions/context_extension.dart';
import 'package:skill_swap_bd/core/router/route_names.dart';
import 'package:skill_swap_bd/core/theme/app_spacing.dart';
import 'package:skill_swap_bd/core/utils/validators.dart';
import 'package:skill_swap_bd/core/widgets/app_app_bar.dart';
import 'package:skill_swap_bd/core/widgets/app_button.dart';
import 'package:skill_swap_bd/core/widgets/app_text_field.dart';
import 'package:skill_swap_bd/core/widgets/feedback/app_snackbar.dart';
import 'package:skill_swap_bd/features/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:skill_swap_bd/features/profile/presentation/cubit/profile_form/profile_form_cubit.dart';
import 'package:skill_swap_bd/features/profile/presentation/widget/skill_selector_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    super.key,
    this.fromSignUp = false,
  });

  final bool fromSignUp;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _offeredSkillsKey = GlobalKey<SkillSelectorWidgetState>();
  final _learnedSkillsKey = GlobalKey<SkillSelectorWidgetState>();
  late final TextEditingController _nameController;
  late final TextEditingController _bioController;

  @override
  void initState() {
    super.initState();
    final currentProfile = context.read<ProfileCubit>().state;
    final initialName = switch (currentProfile) {
      ProfileSuccess(:final profile) => profile.fullName,
      ProfileUpdateSuccess(:final profile) => profile.fullName,
      _ => '',
    };
    final initialBio = switch (currentProfile) {
      ProfileSuccess(:final profile) => profile.bio,
      ProfileUpdateSuccess(:final profile) => profile.bio,
      _ => '',
    };
    _nameController = TextEditingController(text: initialName);
    _bioController = TextEditingController(text: initialBio);

    if (currentProfile case ProfileSuccess(:final profile)) {
      context.read<ProfileFormCubit>().init(profile);
    } else if (currentProfile case ProfileUpdateSuccess(:final profile)) {
      context.read<ProfileFormCubit>().init(profile);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: widget.fromSignUp
            ? 'Setup Your Profile'
            : context.tr.profileEditTitle,
        leading: widget.fromSignUp ? const SizedBox.shrink() : null,
        actions: [
          if (widget.fromSignUp)
            TextButton(
              onPressed: () => context.goNamed(RouteNames.discovery),
              child: const Text('Skip'),
            ),
        ],
      ),
      body: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          switch (state) {
            case ProfileSuccess(:final profile):
              if (_nameController.text.isEmpty && profile.fullName.isNotEmpty) {
                _nameController.text = profile.fullName;
                _bioController.text = profile.bio;
                context.read<ProfileFormCubit>().init(profile);
              }
            case ProfileUpdateSuccess():
              AppSnackbar.success(context, context.tr.profileSaveSuccess);
              if (widget.fromSignUp) {
                context.goNamed(RouteNames.discovery);
              } else if (context.canPop()) {
                context.pop(true);
              } else {
                context.goNamed(RouteNames.discovery);
              }
            case ProfileFailure(:final failure):
              AppSnackbar.error(context, failure.toMessage(context));
            case ProfileInitial() || ProfileLoading() || ProfileUpdating():
              break;
          }
        },
        child: BlocBuilder<ProfileFormCubit, ProfileFormState>(
          builder: (context, formState) {
            final formCubit = context.read<ProfileFormCubit>();
            final isSaving =
                context.watch<ProfileCubit>().state is ProfileUpdating;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppTextField(
                    controller: _nameController,
                    label: context.tr.profileFullNameLabel,
                    errorText: formState.fullNameError?.toMessage(context),
                    onChanged: formCubit.fullNameChanged,
                  ),
                  Gaps.v16,
                  AppTextField(
                    controller: _bioController,
                    label: context.tr.profileBioLabel,
                    maxLines: 3,
                    onChanged: formCubit.bioChanged,
                  ),
                  Gaps.v24,
                  SkillSelectorWidget(
                    key: _offeredSkillsKey,
                    title: context.tr.profileSkillsOfferedLabel,
                    skills: formState.skillsOffered,
                    onAddSkill: formCubit.addSkillOffered,
                    onRemoveSkill: formCubit.removeSkillOffered,
                  ),
                  Gaps.v24,
                  SkillSelectorWidget(
                    key: _learnedSkillsKey,
                    title: context.tr.profileSkillsLearnedLabel,
                    skills: formState.skillsLearned,
                    isOffered: false,
                    onAddSkill: formCubit.addSkillLearned,
                    onRemoveSkill: formCubit.removeSkillLearned,
                  ),
                  Gaps.v32,
                  AppButton(
                    label: context.tr.commonSave,
                    isLoading: isSaving,
                    onPressed: () {
                      _offeredSkillsKey.currentState?.flushPending();
                      _learnedSkillsKey.currentState?.flushPending();
                      FocusScope.of(context).unfocus();

                      if (formCubit.validate()) {
                        context
                            .read<ProfileCubit>()
                            .update(formCubit.buildRequest());
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
