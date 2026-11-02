import 'package:flutter/material.dart';
import 'package:skill_swap_bd/app.dart';
import 'package:skill_swap_bd/core/config/app_env.dart';
import 'package:skill_swap_bd/core/di/injection.dart';
import 'package:skill_swap_bd/core/services/shorebird_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: AppEnv.supabaseUrl,
    publishableKey: AppEnv.supabaseAnonKey,
  );

  await configureDependencies();

  await sl<ShorebirdService>().checkForUpdates();

  runApp(const App());
}
