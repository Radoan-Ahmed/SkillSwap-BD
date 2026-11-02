// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

import '../../features/auth/data/datasource/auth_remote_source.dart' as _i870;
import '../../features/auth/data/repository_impl/auth_repository_impl.dart'
    as _i954;
import '../../features/auth/domain/repository/auth_repository.dart' as _i961;
import '../../features/auth/domain/usecase/sign_in_usecase.dart' as _i551;
import '../../features/auth/domain/usecase/sign_in_with_google_usecase.dart'
    as _i258;
import '../../features/auth/domain/usecase/sign_out_usecase.dart' as _i331;
import '../../features/auth/domain/usecase/sign_up_usecase.dart' as _i134;
import '../../features/auth/presentation/cubit/sign_in/sign_in_cubit.dart'
    as _i302;
import '../../features/auth/presentation/cubit/sign_in_form/sign_in_form_cubit.dart'
    as _i1039;
import '../../features/auth/presentation/cubit/sign_up/sign_up_cubit.dart'
    as _i781;
import '../../features/auth/presentation/cubit/sign_up_form/sign_up_form_cubit.dart'
    as _i873;
import '../../features/chat/data/datasource/chat_remote_source.dart' as _i889;
import '../../features/chat/data/repository_impl/chat_repository_impl.dart'
    as _i814;
import '../../features/chat/domain/repository/chat_repository.dart' as _i477;
import '../../features/chat/domain/usecase/get_messages_usecase.dart' as _i932;
import '../../features/chat/domain/usecase/send_message_usecase.dart' as _i547;
import '../../features/chat/domain/usecase/stream_messages_usecase.dart'
    as _i966;
import '../../features/chat/presentation/cubit/chat/chat_cubit.dart' as _i541;
import '../../features/common/presentation/cubit/session/session_cubit.dart'
    as _i811;
import '../../features/discovery/data/datasource/discovery_remote_source.dart'
    as _i669;
import '../../features/discovery/data/repository_impl/discovery_repository_impl.dart'
    as _i59;
import '../../features/discovery/domain/repository/discovery_repository.dart'
    as _i240;
import '../../features/discovery/domain/usecase/get_discovery_feed_usecase.dart'
    as _i280;
import '../../features/discovery/presentation/cubit/discovery/discovery_cubit.dart'
    as _i214;
import '../../features/profile/data/datasource/profile_remote_source.dart'
    as _i947;
import '../../features/profile/data/repository_impl/profile_repository_impl.dart'
    as _i187;
import '../../features/profile/domain/repository/profile_repository.dart'
    as _i364;
import '../../features/profile/domain/usecase/get_profile_usecase.dart'
    as _i304;
import '../../features/profile/domain/usecase/update_profile_usecase.dart'
    as _i550;
import '../../features/profile/presentation/cubit/profile/profile_cubit.dart'
    as _i771;
import '../../features/profile/presentation/cubit/profile_form/profile_form_cubit.dart'
    as _i175;
import '../network/interceptors/api_response_interceptor.dart' as _i44;
import '../network/interceptors/auth_interceptor.dart' as _i745;
import '../network/interceptors/error_interceptor.dart' as _i511;
import '../services/location_service.dart' as _i669;
import '../services/notification_service.dart' as _i941;
import '../services/permission_service.dart' as _i165;
import '../services/shorebird_service.dart' as _i1041;
import '../storage/local_storage.dart' as _i329;
import '../storage/token_storage.dart' as _i973;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i1039.SignInFormCubit>(() => _i1039.SignInFormCubit());
    gh.factory<_i873.SignUpFormCubit>(() => _i873.SignUpFormCubit());
    gh.factory<_i175.ProfileFormCubit>(() => _i175.ProfileFormCubit());
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage,
    );
    gh.lazySingleton<_i454.SupabaseClient>(() => registerModule.supabaseClient);
    gh.lazySingleton<_i165.PermissionService>(() => _i165.PermissionService());
    gh.lazySingleton<_i1041.ShorebirdService>(() => _i1041.ShorebirdService());
    gh.lazySingleton<_i941.NotificationService>(
      () => _i941.NotificationService(),
    );
    gh.lazySingleton<_i669.LocationService>(() => _i669.LocationService());
    gh.lazySingleton<_i511.ErrorInterceptor>(() => _i511.ErrorInterceptor());
    gh.lazySingleton<_i44.ApiResponseInterceptor>(
      () => _i44.ApiResponseInterceptor(),
    );
    gh.lazySingleton<_i669.DiscoveryRemoteSource>(
      () => _i669.DiscoveryRemoteSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i329.LocalStorage>(
      () => _i329.LocalStorage(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i947.ProfileRemoteSource>(
      () => _i947.ProfileRemoteSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i889.ChatRemoteSource>(
      () => _i889.ChatRemoteSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i870.AuthRemoteSource>(
      () => _i870.AuthRemoteSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i811.SessionCubit>(
      () => _i811.SessionCubit(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i477.ChatRepository>(
      () => _i814.ChatRepositoryImpl(gh<_i889.ChatRemoteSource>()),
    );
    gh.lazySingleton<_i973.TokenStorage>(
      () => _i973.TokenStorage(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i961.AuthRepository>(
      () => _i954.AuthRepositoryImpl(gh<_i870.AuthRemoteSource>()),
    );
    gh.lazySingleton<_i745.AuthInterceptor>(
      () => _i745.AuthInterceptor(gh<_i973.TokenStorage>()),
    );
    gh.factory<_i932.GetMessagesUsecase>(
      () => _i932.GetMessagesUsecase(gh<_i477.ChatRepository>()),
    );
    gh.factory<_i966.StreamMessagesUsecase>(
      () => _i966.StreamMessagesUsecase(gh<_i477.ChatRepository>()),
    );
    gh.factory<_i547.SendMessageUsecase>(
      () => _i547.SendMessageUsecase(gh<_i477.ChatRepository>()),
    );
    gh.lazySingleton<_i240.DiscoveryRepository>(
      () => _i59.DiscoveryRepositoryImpl(gh<_i669.DiscoveryRemoteSource>()),
    );
    gh.lazySingleton<_i364.ProfileRepository>(
      () => _i187.ProfileRepositoryImpl(gh<_i947.ProfileRemoteSource>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => registerModule.dio(
        gh<_i745.AuthInterceptor>(),
        gh<_i44.ApiResponseInterceptor>(),
        gh<_i511.ErrorInterceptor>(),
      ),
    );
    gh.factory<_i280.GetDiscoveryFeedUsecase>(
      () => _i280.GetDiscoveryFeedUsecase(gh<_i240.DiscoveryRepository>()),
    );
    gh.factory<_i331.SignOutUsecase>(
      () => _i331.SignOutUsecase(gh<_i961.AuthRepository>()),
    );
    gh.factory<_i258.SignInWithGoogleUsecase>(
      () => _i258.SignInWithGoogleUsecase(gh<_i961.AuthRepository>()),
    );
    gh.factory<_i551.SignInUsecase>(
      () => _i551.SignInUsecase(gh<_i961.AuthRepository>()),
    );
    gh.factory<_i134.SignUpUsecase>(
      () => _i134.SignUpUsecase(gh<_i961.AuthRepository>()),
    );
    gh.factory<_i304.GetProfileUsecase>(
      () => _i304.GetProfileUsecase(gh<_i364.ProfileRepository>()),
    );
    gh.factory<_i550.UpdateProfileUsecase>(
      () => _i550.UpdateProfileUsecase(gh<_i364.ProfileRepository>()),
    );
    gh.factory<_i541.ChatCubit>(
      () => _i541.ChatCubit(
        gh<_i932.GetMessagesUsecase>(),
        gh<_i547.SendMessageUsecase>(),
        gh<_i966.StreamMessagesUsecase>(),
      ),
    );
    gh.factory<_i781.SignUpCubit>(
      () => _i781.SignUpCubit(gh<_i134.SignUpUsecase>()),
    );
    gh.factory<_i214.DiscoveryCubit>(
      () => _i214.DiscoveryCubit(gh<_i280.GetDiscoveryFeedUsecase>()),
    );
    gh.factory<_i302.SignInCubit>(
      () => _i302.SignInCubit(
        gh<_i551.SignInUsecase>(),
        gh<_i258.SignInWithGoogleUsecase>(),
      ),
    );
    gh.factory<_i771.ProfileCubit>(
      () => _i771.ProfileCubit(
        gh<_i304.GetProfileUsecase>(),
        gh<_i550.UpdateProfileUsecase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
