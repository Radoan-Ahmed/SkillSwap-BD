import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_swap_bd/core/di/injection.dart';
import 'package:skill_swap_bd/core/router/route_names.dart';
import 'package:skill_swap_bd/features/auth/presentation/cubit/sign_in/sign_in_cubit.dart';
import 'package:skill_swap_bd/features/auth/presentation/cubit/sign_in_form/sign_in_form_cubit.dart';
import 'package:skill_swap_bd/features/auth/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'package:skill_swap_bd/features/auth/presentation/cubit/sign_up_form/sign_up_form_cubit.dart';
import 'package:skill_swap_bd/features/auth/presentation/screen/login_screen.dart';
import 'package:skill_swap_bd/features/auth/presentation/screen/register_screen.dart';
import 'package:skill_swap_bd/features/chat/presentation/cubit/chat/chat_cubit.dart';
import 'package:skill_swap_bd/features/chat/presentation/screen/chat_screen.dart';
import 'package:skill_swap_bd/features/common/presentation/cubit/session/session_cubit.dart';
import 'package:skill_swap_bd/features/discovery/presentation/cubit/discovery/discovery_cubit.dart';
import 'package:skill_swap_bd/features/discovery/presentation/screen/discovery_screen.dart';
import 'package:skill_swap_bd/features/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:skill_swap_bd/features/profile/presentation/cubit/profile_form/profile_form_cubit.dart';
import 'package:skill_swap_bd/features/profile/presentation/screen/edit_profile_screen.dart';
import 'package:skill_swap_bd/features/profile/presentation/screen/profile_screen.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

final appRouter = GoRouter(
  initialLocation: RoutePaths.discovery,
  refreshListenable: GoRouterRefreshStream(sl<SessionCubit>().stream),
  redirect: (BuildContext context, GoRouterState state) {
    final sessionState = sl<SessionCubit>().state;
    final isAuthenticated = sessionState is SessionAuthenticated;
    final isLoggingIn =
        state.matchedLocation == RoutePaths.login ||
        state.matchedLocation == RoutePaths.register;

    if (!isAuthenticated && !isLoggingIn) {
      return RoutePaths.login;
    }
    if (isAuthenticated && isLoggingIn) {
      return RoutePaths.discovery;
    }
    return null;
  },
  routes: [
    GoRoute(
      path: RoutePaths.login,
      name: RouteNames.login,
      builder:
          (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => sl<SignInFormCubit>()),
              BlocProvider(create: (_) => sl<SignInCubit>()),
            ],
            child: const LoginScreen(),
          ),
    ),
    GoRoute(
      path: RoutePaths.register,
      name: RouteNames.register,
      builder:
          (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => sl<SignUpFormCubit>()),
              BlocProvider(create: (_) => sl<SignUpCubit>()),
            ],
            child: const RegisterScreen(),
          ),
    ),
    GoRoute(
      path: RoutePaths.discovery,
      name: RouteNames.discovery,
      builder:
          (context, state) => BlocProvider(
            create: (_) => sl<DiscoveryCubit>(),
            child: const DiscoveryScreen(),
          ),
    ),
    GoRoute(
      path: RoutePaths.profile,
      name: RouteNames.profile,
      builder: (context, state) {
        final sessionState = sl<SessionCubit>().state;
        final userId = switch (sessionState) {
          SessionAuthenticated(:final userId) => userId,
          _ => '',
        };
        return BlocProvider(
          create: (_) => sl<ProfileCubit>()..load(userId),
          child: const ProfileScreen(),
        );
      },
      routes: [
        GoRoute(
          path: RoutePaths.editProfile,
          name: RouteNames.editProfile,
          builder: (context, state) {
            final sessionState = sl<SessionCubit>().state;
            final userId = switch (sessionState) {
              SessionAuthenticated(:final userId) => userId,
              _ => '',
            };
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => sl<ProfileFormCubit>()),
                BlocProvider(create: (_) => sl<ProfileCubit>()..load(userId)),
              ],
              child: const EditProfileScreen(),
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: RoutePaths.chat,
      name: RouteNames.chat,
      builder: (context, state) {
        final peerId = state.pathParameters['peerId'] ?? '';
        final peerName = state.extra as String?;
        final sessionState = sl<SessionCubit>().state;
        final currentUserId = switch (sessionState) {
          SessionAuthenticated(:final userId) => userId,
          _ => '',
        };
        return BlocProvider(
          create:
              (_) =>
                  sl<ChatCubit>()
                    ..init(currentUserId: currentUserId, peerId: peerId),
          child: ChatScreen(peerId: peerId, peerName: peerName),
        );
      },
    ),
  ],
);
