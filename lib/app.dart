import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:skill_swap_bd/core/di/injection.dart';
import 'package:skill_swap_bd/core/l10n/generated/app_localizations.dart';
import 'package:skill_swap_bd/core/router/app_router.dart';
import 'package:skill_swap_bd/core/theme/app_theme.dart';
import 'package:skill_swap_bd/features/common/presentation/cubit/session/session_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<SessionCubit>.value(value: sl<SessionCubit>())],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Skill Swap BD',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        routerConfig: appRouter,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
