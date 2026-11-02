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
import 'package:skill_swap_bd/features/auth/presentation/cubit/sign_in/sign_in_cubit.dart';
import 'package:skill_swap_bd/features/auth/presentation/cubit/sign_in_form/sign_in_form_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: BlocConsumer<SignInCubit, SignInState>(
              listener: (context, state) {
                switch (state) {
                  case SignInSuccess():
                    AppSnackbar.success(context, context.tr.authLoginSuccess);
                    context.goNamed(RouteNames.discovery);
                  case SignInFailure(:final failure):
                    AppSnackbar.error(context, failure.toMessage(context));
                  case SignInInitial() ||
                      SignInLoading() ||
                      SignInGoogleRedirected():
                    break;
                }
              },
              builder: (context, signInState) {
                final isLoading = signInState is SignInLoading;
                return BlocBuilder<SignInFormCubit, SignInFormState>(
                  builder: (context, formState) {
                    final formCubit = context.read<SignInFormCubit>();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.swap_horiz_rounded,
                          size: 64,
                          color: context.colorScheme.primary,
                        ),
                        Gaps.v16,
                        Text(
                          context.tr.authLoginTitle,
                          style: context.textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                        Gaps.v8,
                        Text(
                          context.tr.authLoginSubtitle,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Gaps.v32,
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
                          label: context.tr.authSignInButton,
                          isLoading: isLoading,
                          onPressed: () {
                            if (formCubit.validate()) {
                              context.read<SignInCubit>().signIn(
                                formCubit.buildRequest(),
                              );
                            }
                          },
                        ),
                        Gaps.v16,
                        OutlinedButton.icon(
                          onPressed:
                              isLoading
                                  ? null
                                  : () =>
                                      context
                                          .read<SignInCubit>()
                                          .signInWithGoogle(),
                          icon: const Icon(Icons.login),
                          label: Text(context.tr.authGoogleSignInButton),
                        ),
                        Gaps.v24,
                        TextButton(
                          onPressed:
                              () => context.pushNamed(RouteNames.register),
                          child: Text(context.tr.authNoAccount),
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
