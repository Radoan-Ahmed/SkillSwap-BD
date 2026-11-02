import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skill_swap_bd/core/config/app_constants.dart';
import 'package:skill_swap_bd/core/config/app_env.dart';
import 'package:skill_swap_bd/core/network/interceptors/api_response_interceptor.dart';
import 'package:skill_swap_bd/core/network/interceptors/auth_interceptor.dart';
import 'package:skill_swap_bd/core/network/interceptors/error_interceptor.dart';
import 'package:skill_swap_bd/core/network/interceptors/logging_interceptor.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@module
abstract class RegisterModule {
  @preResolve
  @lazySingleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @lazySingleton
  SupabaseClient get supabaseClient => Supabase.instance.client;

  @lazySingleton
  Dio dio(
    AuthInterceptor auth,
    ApiResponseInterceptor apiResponse,
    ErrorInterceptor error,
  ) => Dio(
      BaseOptions(
        baseUrl: AppEnv.baseUrl,
        connectTimeout: AppConstants.connectTimeout,
        receiveTimeout: AppConstants.receiveTimeout,
      ),
    )
    ..interceptors.addAll([
      auth,
      apiResponse,
      error,
      if (kDebugMode) LoggingInterceptor(),
    ]);
}
