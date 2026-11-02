import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_swap_bd/core/error/failure_message.dart';
import 'package:skill_swap_bd/core/extensions/context_extension.dart';
import 'package:skill_swap_bd/core/router/route_names.dart';
import 'package:skill_swap_bd/core/theme/app_spacing.dart';
import 'package:skill_swap_bd/core/utils/validators.dart';
import 'package:skill_swap_bd/core/widgets/app_button.dart';
import 'package:skill_swap_bd/core/widgets/app_text_field.dart';
import 'package:skill_swap_bd/core/widgets/feedback/app_snackbar.dart';
import 'package:skill_swap_bd/features/auth/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'package:skill_swap_bd/features/auth/presentation/cubit/sign_up_form/sign_up_form_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.tr.authRegisterTitle)),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: BlocConsumer<SignUpCubit, SignUpState>(
              listener: (context, state) {
                switch (state) {
                  case SignUpSuccess():
                    AppSnackbar.success(
                      context,
                      context.tr.authRegisterSuccess,
                    );
                    context.goNamed(RouteNames.discovery);
                  case SignUpFailure(:final failure):
                    AppSnackbar.error(context, failure.toMessage(context));
                  case SignUpInitial() || SignUpLoading():
                    break;
                }
              },
              builder: (context, signUpState) {
                final isLoading = signUpState is SignUpLoading;
                return BlocBuilder<SignUpFormCubit, SignUpFormState>(
                  builder: (context, formState) {
                    final formCubit = context.read<SignUpFormCubit>();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.tr.authRegisterSubtitle,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Gaps.v24,
                        AppTextField(
                          label: context.tr.profileFullNameLabel,
                          errorText: formState.fullNameError?.toMessage(
                            context,
                          ),
                          onChanged: formCubit.fullNameChanged,
                          prefixIcon: const Icon(Icons.person_outline),
                        ),
                        Gaps.v16,
                        AppTextField(
                          label: context.tr.authEmailLabel,
                          keyboardType: TextInputType.emailAddress,
                          errorText: formState.emailError?.toMessage(context),
                          onChanged: formCubit.emailChanged,
                          prefixIcon: const Icon(Icons.email_outlined),
                        ),
                        Gaps.v16,
                        AppTextField(
                          label: context.tr.authPasswordLabel,
                          obscureText: true,
                          errorText: formState.passwordError?.toMessage(
                            context,
                          ),
                          onChanged: formCubit.passwordChanged,
                          prefixIcon: const Icon(Icons.lock_outline),
                        ),
                        Gaps.v24,
                        AppButton(
                          label: context.tr.authSignUpButton,
                          isLoading: isLoading,
                          onPressed: () {
                            if (formCubit.validate()) {
                              context.read<SignUpCubit>().signUp(
                                formCubit.buildRequest(),
                              );
                            }
                          },
                        ),
                        Gaps.v16,
                        TextButton(
                          onPressed: () => context.pop(),
                          child: Text(context.tr.authHaveAccount),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
