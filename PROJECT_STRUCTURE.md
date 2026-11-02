# Flutter Project Structure & Coding Rules

> **For AI assistants:** This file is the single source of truth for how code is
> written in this project. Follow it exactly. Do not invent new folders, layers,
> patterns, packages or naming styles. If a task cannot be done within these
> rules, stop and ask the owner instead of improvising.
>
> **Version:** 2.1 — 2026-10-19
> **Owner:** radoan — only the owner changes these rules (see §17).

---

## 1. Stack (non-negotiable)

| Concern | Use | Never use |
|---|---|---|
| Architecture | Feature-first **Clean Architecture** (data / domain / presentation) | MVC, logic in widgets, "god" service classes |
| State management | **Cubit** (`flutter_bloc`). `Bloc` only when event transformers (debounce/throttle) are truly needed | `setState` for business logic, Provider, Riverpod, GetX |
| State & model classes | **freezed** (+ **json_serializable** for models) | Hand-written states, hand-written `fromJson`/`toJson`, Equatable |
| Dependency injection | **get_it + injectable** (code-generated) | Manual `sl.registerXxx(...)` for app classes |
| Networking | **Dio** + interceptors (`core/network`) | `http` package, calling Dio outside a remote source |
| Error handling | Exceptions in data → mapped to sealed **`Failure`** → returned as **`Result<T>`** | `dartz`/`Either`, raw exceptions reaching UI, `null` meaning "error" |
| Navigation | **go_router** | `Navigator.pushNamed`, `onGenerateRoute`, untyped route maps |
| Environments | `--dart-define-from-file` + `AppEnv` | Hard-coded base URLs, commenting/uncommenting URLs |
| Lints | **very_good_analysis** | Disabling lints file-wide to silence warnings |
| Code generation | `build_runner` | Editing any generated file |

**Packages** — `flutter_bloc`, `bloc`, `freezed_annotation`, `json_annotation`,
`get_it`, `injectable`, `dio`, `go_router`, `shared_preferences`,
`flutter_secure_storage`, `intl`, `flutter_localizations`.
**Dev** — `build_runner`, `freezed`, `json_serializable`, `injectable_generator`,
`very_good_analysis`, `bloc_test`, `mocktail`.

**Do not add any other package without the owner's approval.**

---

## 2. Top-level layout

```
<project root>/
├── config/env/               # dev.json, staging.json, prod.json (no secrets committed)
├── assets/                   # images/, icons/, fonts/, animations/
├── l10n.yaml
├── build.yaml                # json_serializable options (§8)
├── analysis_options.yaml     # include: package:very_good_analysis/analysis_options.yaml
├── lib/
│   ├── main.dart             # bootstrap only (§11)
│   ├── app.dart              # MaterialApp.router, theme, localization, global BlocProviders
│   ├── core/                 # shared, feature-agnostic code (§3) — never imports a feature
│   └── features/
│       ├── common/           # cross-feature *business* code: session, user profile, locale, sign-out
│       └── <feature>/        # one folder per business feature (§4)
└── test/                     # mirrors lib/ (§15)
```

---

## 3. `core/` layout (design system + infrastructure)

```
core/
├── config/
│   ├── app_env.dart              # String.fromEnvironment values: baseUrl, flavor, …
│   └── app_constants.dart        # page size, max upload size, … (non-UI constants)
├── di/
│   ├── injection.dart            # configureDependencies()
│   ├── injection.config.dart     # GENERATED
│   └── register_module.dart      # @module: Dio, SharedPreferences, FlutterSecureStorage
├── network/
│   ├── api_endpoints.dart        # every endpoint path, nothing else
│   └── interceptors/
│       ├── auth_interceptor.dart         # adds token, handles 401 → session expired
│       ├── api_response_interceptor.dart # body {status:false} / code != 200 → ServerException
│       ├── error_interceptor.dart        # DioException → typed AppException
│       └── logging_interceptor.dart      # debug builds only
├── error/
│   ├── exceptions.dart           # AppException + subclasses (data layer only)
│   ├── failures.dart             # sealed Failure (domain/presentation)
│   ├── result.dart               # sealed Result<T> = Ok | Err
│   ├── guard.dart                # guard(): runs a call, maps exceptions → Err(Failure)
│   └── failure_message.dart      # extension Failure.toMessage(context) → localized text
├── router/
│   ├── app_router.dart           # GoRouter + auth redirect
│   └── route_names.dart          # RouteNames + RoutePaths
├── theme/
│   ├── app_colors.dart           # raw palette — used ONLY inside core/theme
│   ├── app_color_scheme.dart     # ThemeExtension: semantic custom colors (success, warning…), light + dark
│   ├── app_text_styles.dart      # font family, sizes, weights → builds TextTheme
│   ├── app_spacing.dart          # AppSpacing values + Gaps (SizedBox constants)
│   ├── app_radius.dart           # corner radii + BorderRadius constants
│   ├── app_sizes.dart            # icon sizes, button heights, avatar sizes
│   ├── app_durations.dart        # animation durations
│   └── app_theme.dart            # ThemeData light() / dark()
├── l10n/
│   ├── app_en.arb
│   ├── app_bn.arb
│   └── generated/                # GENERATED by gen-l10n
├── storage/
│   ├── storage_keys.dart         # every SharedPreferences / secure-storage key
│   ├── local_storage.dart        # typed wrapper over SharedPreferences
│   └── token_storage.dart        # access/refresh token in FlutterSecureStorage
├── constants/
│   └── app_assets.dart           # every asset path
├── extensions/
│   ├── context_extension.dart    # context.colorScheme, .textTheme, .appColors, .tr, .screenSize
│   ├── string_extension.dart
│   ├── datetime_extension.dart
│   └── num_extension.dart
├── utils/
│   ├── validators.dart           # phone, email, amount, required…
│   ├── formatters/
│   │   ├── date_formatter.dart
│   │   ├── money_formatter.dart
│   │   └── number_formatter.dart # Bangla ⇄ English digits
│   ├── enums/                    # app-wide enums (RoleType, Flavor…)
│   ├── debouncer.dart
│   └── app_logger.dart           # logDebug / logError — silent in release
├── services/
│   ├── permission_service.dart
│   ├── location_service.dart
│   └── notification_service.dart
└── widgets/                      # generic, reusable UI (no business logic)
    ├── app_button.dart
    ├── app_text_field.dart
    ├── app_dropdown.dart
    ├── app_app_bar.dart
    ├── app_loader.dart
    ├── empty_state_widget.dart
    ├── error_state_widget.dart   # message + retry button
    └── feedback/
        ├── app_snackbar.dart     # AppSnackbar.success / error / info
        ├── app_dialog.dart       # AppDialog.confirm → Future<bool>
        └── app_loading_dialog.dart
```

Rules:
- A widget used by **2+ features** moves to `core/widgets/`. A widget used by one feature stays in that feature.
- `features/common/` holds shared **business** logic (session, profile, locale cubit). Generic UI never goes there.

---

## 4. Feature layout (copy this exactly)

```
features/<feature>/
├── data/
│   ├── datasource/
│   │   ├── <feature>_remote_source.dart     # abstract interface + Impl
│   │   └── <feature>_local_source.dart      # only if the feature caches locally
│   ├── model/
│   │   ├── request/<action>_request.dart
│   │   └── response/<thing>_response.dart
│   ├── repository_impl/<feature>_repository_impl.dart
│   └── mock/<thing>_mock_data.dart          # optional, offline dev only
├── domain/
│   ├── repository/<feature>_repository.dart # abstract contract
│   └── usecase/<action>_usecase.dart        # ONE use case per action
└── presentation/
    ├── cubit/<action>/                      # ONE folder per cubit
    │   ├── <action>_cubit.dart
    │   ├── <action>_state.dart              # part of the cubit
    │   └── <action>_cubit.freezed.dart      # GENERATED
    ├── screen/<name>_screen.dart
    ├── widget/<name>_widget.dart | _sheet.dart | _dialog.dart
    └── util/                                # optional feature-only helpers
```

Rules:
- Folder names are **singular**: `screen`, `widget`, `usecase`, `model`, `datasource`. Never `screens`, `widgets`, `pages`, `views`, `usecases`, `models`.
- **One repository + one remote source per feature.** Split only for very large features, with the owner's approval.
- **One use case per action. One cubit per action** (list, details, create, update, delete), plus at most one **form cubit** per form.
- A feature with no API (e.g. `splash`, `calculator`) has only `presentation/`.
- **No `entities/` folder.** This project uses pragmatic clean architecture: domain contracts and use cases work with the freezed data models directly. Do not add entity classes or mappers.

---

## 5. Naming

| Item | File | Class |
|---|---|---|
| Remote source | `leave_remote_source.dart` | `LeaveRemoteSource`, `LeaveRemoteSourceImpl` |
| Repository | `leave_repository.dart` / `leave_repository_impl.dart` | `LeaveRepository` / `LeaveRepositoryImpl` |
| Use case | `apply_leave_usecase.dart` | `ApplyLeaveUsecase` |
| Request / response | `apply_leave_request.dart` / `leave_list_response.dart` | `ApplyLeaveRequest` / `LeaveListResponse` |
| Cubit / state | `apply_leave_cubit.dart` / `apply_leave_state.dart` | `ApplyLeaveCubit` / `ApplyLeaveState` |
| State variants | — | `ApplyLeaveInitial`, `ApplyLeaveLoading`, `ApplyLeaveSuccess`, `ApplyLeaveFailure` |
| Form cubit | `apply_leave_form_cubit.dart` | `ApplyLeaveFormCubit` / `ApplyLeaveFormState` |
| Screen / widget | `apply_leave_screen.dart` / `leave_list_item_widget.dart` | `ApplyLeaveScreen` / `LeaveListItemWidget` |
| Route | `route_names.dart` | `RouteNames.applyLeave`, `RoutePaths.applyLeave` |

- Files `snake_case.dart`, classes `PascalCase`, members `lowerCamelCase`, private `_underscore`.
- Spell correctly (no `respository`, `sorce`, `formater`).
- **Package imports** only (`package:<app>/...`), never `../../../../`.

---

## 6. Layer responsibilities & dependency rule

```
presentation ──► domain ◄── data
  (Cubit)      (UseCase,    (RepositoryImpl, RemoteSource,
               Repository    Models, Dio)
               contract)
```

| Layer | May use | Must NOT |
|---|---|---|
| `screen`, `widget` | cubits, models, `core/theme`, `core/widgets`, `core/extensions`, `core/l10n` | call use cases, repositories, remote sources |
| `cubit` | use cases, models, `Failure`, `Result` | import `datasource`, `repository_impl`, Dio, or take a `BuildContext` |
| `usecase` | repository contract, models, `Result` | import `datasource` / `repository_impl` |
| `repository` (contract) | models, `Result` | contain implementation |
| `repository_impl` | contract, datasource, `guard()` | contain UI or parsing |
| `datasource` | Dio, `ApiEndpoints`, models, `AppException` | know about cubits, widgets, `Failure` |

**Error flow:** remote source throws `AppException` → repository wraps the call in
`guard()` → returns `Result<T>` (`Ok` / `Err(Failure)`) → cubit emits
`success` / `failure` → UI shows `failure.toMessage(context)`.

---

## 7. Templates

Example feature `leave`, action `apply_leave`. Replace names accordingly.

### 7.1 Core error types

`core/error/exceptions.dart`
```dart
sealed class AppException implements Exception {
  const AppException(this.message);
  final String message;
}

final class NetworkException extends AppException {
  const NetworkException([super.message = 'No internet connection']);
}

final class RequestTimeoutException extends AppException {
  const RequestTimeoutException([super.message = 'Request timed out']);
}

final class UnauthorizedException extends AppException {
  const UnauthorizedException([super.message = 'Session expired']);
}

final class ServerException extends AppException {
  const ServerException(super.message, {this.statusCode});
  final Object? statusCode;
}

final class CacheException extends AppException {
  const CacheException([super.message = 'Local storage error']);
}
```

`core/error/failures.dart`
```dart
sealed class Failure {
  const Failure(this.message);
  final String message;
}

final class NetworkFailure extends Failure { const NetworkFailure(super.message); }
final class TimeoutFailure extends Failure { const TimeoutFailure(super.message); }
final class UnauthorizedFailure extends Failure { const UnauthorizedFailure(super.message); }
final class ServerFailure extends Failure {
  const ServerFailure(super.message, {this.statusCode});
  final Object? statusCode;
}
final class CacheFailure extends Failure { const CacheFailure(super.message); }
final class UnknownFailure extends Failure { const UnknownFailure(super.message); }
```

`core/error/result.dart`
```dart
sealed class Result<T> {
  const Result();
}

final class Ok<T> extends Result<T> {
  const Ok(this.data);
  final T data;
}

final class Err<T> extends Result<T> {
  const Err(this.failure);
  final Failure failure;
}
```

`core/error/guard.dart`
```dart
Future<Result<T>> guard<T>(Future<T> Function() call) async {
  try {
    return Ok(await call());
  } on DioException catch (e, s) {
    final error = e.error;
    if (error is AppException) return Err(_toFailure(error));
    logError('Unmapped DioException', e, s);
    return Err(UnknownFailure(e.message ?? 'Something went wrong'));
  } on AppException catch (e) {
    return Err(_toFailure(e));
  } catch (e, s) {
    logError('Unexpected error', e, s);
    return const Err(UnknownFailure('Something went wrong'));
  }
}

Failure _toFailure(AppException e) => switch (e) {
      NetworkException() => NetworkFailure(e.message),
      RequestTimeoutException() => TimeoutFailure(e.message),
      UnauthorizedException() => UnauthorizedFailure(e.message),
      ServerException(:final statusCode) => ServerFailure(e.message, statusCode: statusCode),
      CacheException() => CacheFailure(e.message),
    };
```

`core/error/failure_message.dart`
```dart
extension FailureMessage on Failure {
  String toMessage(BuildContext context) => switch (this) {
        NetworkFailure() => context.tr.errorNoInternet,
        TimeoutFailure() => context.tr.errorTimeout,
        UnauthorizedFailure() => context.tr.errorSessionExpired,
        ServerFailure(:final message) => message,
        CacheFailure() || UnknownFailure() => context.tr.errorGeneric,
      };
}
```

### 7.2 Network

`core/di/register_module.dart`
```dart
@module
abstract class RegisterModule {
  @preResolve
  @lazySingleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @lazySingleton
  Dio dio(
    AuthInterceptor auth,
    ApiResponseInterceptor apiResponse,
    ErrorInterceptor error,
  ) =>
      Dio(
        BaseOptions(
          baseUrl: AppEnv.baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          contentType: Headers.jsonContentType,
        ),
      )..interceptors.addAll([
          auth,
          apiResponse,
          error,
          if (kDebugMode) LoggingInterceptor(),
        ]);
}
```

`core/network/interceptors/error_interceptor.dart`
```dart
@lazySingleton
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.error is AppException) return handler.next(err);
    final AppException mapped = switch (err.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout => const RequestTimeoutException(),
      DioExceptionType.connectionError => const NetworkException(),
      _ when err.response?.statusCode == 401 => const UnauthorizedException(),
      _ => ServerException(
          _messageOf(err.response?.data),
          statusCode: err.response?.statusCode,
        ),
    };
    handler.next(err.copyWith(error: mapped));
  }

  String _messageOf(Object? data) =>
      data is Map ? '${data['message'] ?? 'Something went wrong'}' : 'Something went wrong';
}
```
`ApiResponseInterceptor.onResponse` checks this project's API contract (e.g.
`status == true` / `code == 200`) and, on failure, calls `handler.reject(...)` with a
`ServerException` as the `error`. Remote sources therefore only parse success bodies.

`core/network/api_endpoints.dart`
```dart
abstract final class ApiEndpoints {
  static const leaveList = 'v1/leave/get-list';
  static const applyLeave = 'v1/leave/apply-leave';
}
```

### 7.3 Data layer

`build.yaml` (project root) — snake_case JSON keys automatically:
```yaml
targets:
  $default:
    builders:
      json_serializable:
        options:
          field_rename: snake
          explicit_to_json: true
          include_if_null: false
```

**Request model** — `data/model/request/apply_leave_request.dart`
```dart
part 'apply_leave_request.freezed.dart';
part 'apply_leave_request.g.dart';

@freezed
abstract class ApplyLeaveRequest with _$ApplyLeaveRequest {
  const factory ApplyLeaveRequest({
    required String leaveTypeOid,
    required String startDate,
    required String endDate,
    String? reason,
  }) = _ApplyLeaveRequest;

  factory ApplyLeaveRequest.fromJson(Map<String, dynamic> json) =>
      _$ApplyLeaveRequestFromJson(json);
}
```

**Response model** — `data/model/response/leave_list_response.dart`
```dart
part 'leave_list_response.freezed.dart';
part 'leave_list_response.g.dart';

@freezed
abstract class LeaveListResponse with _$LeaveListResponse {
  const factory LeaveListResponse({
    @Default([]) List<LeaveItem> items,
    @Default(0) int total,
  }) = _LeaveListResponse;

  factory LeaveListResponse.fromJson(Map<String, dynamic> json) =>
      _$LeaveListResponseFromJson(json);
}

@freezed
abstract class LeaveItem with _$LeaveItem {
  const factory LeaveItem({
    required String oid,
    String? leaveTypeName,
    @Default(LeaveStatus.pending) LeaveStatus status,
  }) = _LeaveItem;

  factory LeaveItem.fromJson(Map<String, dynamic> json) => _$LeaveItemFromJson(json);
}
```
- Use `@JsonKey(name: '...')` only when the API key is not the snake_case of the field.
- Use `@Default(...)` for lists and non-null values; nullable only when the API truly may omit it.
- Fixed API values (status, type) are **enums** with `@JsonValue`, never `String`.

**Remote source** — `data/datasource/leave_remote_source.dart`
```dart
abstract interface class LeaveRemoteSource {
  Future<LeaveListResponse> getLeaveList(LeaveListRequest request);
  Future<String> applyLeave(ApplyLeaveRequest request);
}

@LazySingleton(as: LeaveRemoteSource)
class LeaveRemoteSourceImpl implements LeaveRemoteSource {
  LeaveRemoteSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<LeaveListResponse> getLeaveList(LeaveListRequest request) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.leaveList,
      data: request.toJson(),
    );
    return LeaveListResponse.fromJson(response.data!['data'] as Map<String, dynamic>);
  }

  @override
  Future<String> applyLeave(ApplyLeaveRequest request) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.applyLeave,
      data: request.toJson(),
    );
    return '${response.data!['message']}';
  }
}
```

**Repository contract** — `domain/repository/leave_repository.dart`
```dart
abstract interface class LeaveRepository {
  Future<Result<LeaveListResponse>> getLeaveList(LeaveListRequest request);
  Future<Result<String>> applyLeave(ApplyLeaveRequest request);
}
```

**Repository impl** — `data/repository_impl/leave_repository_impl.dart`
```dart
@LazySingleton(as: LeaveRepository)
class LeaveRepositoryImpl implements LeaveRepository {
  LeaveRepositoryImpl(this._remote);

  final LeaveRemoteSource _remote;

  @override
  Future<Result<LeaveListResponse>> getLeaveList(LeaveListRequest request) =>
      guard(() => _remote.getLeaveList(request));

  @override
  Future<Result<String>> applyLeave(ApplyLeaveRequest request) =>
      guard(() => _remote.applyLeave(request));
}
```
Every repository method returns `Result<T>` via `guard()`. No try/catch elsewhere.

### 7.4 Domain layer

```dart
@injectable
class ApplyLeaveUsecase {
  ApplyLeaveUsecase(this._repository);

  final LeaveRepository _repository;

  Future<Result<String>> call(ApplyLeaveRequest request) => _repository.applyLeave(request);
}
```
Multi-step business rules (e.g. upload document → then apply) live **in the use case**:
```dart
final upload = await _repository.uploadDocument(file);
if (upload case Err(:final failure)) return Err(failure);
```

### 7.5 Presentation layer

**API cubit** — `presentation/cubit/apply_leave/apply_leave_cubit.dart`
```dart
part 'apply_leave_cubit.freezed.dart';
part 'apply_leave_state.dart';

@injectable
class ApplyLeaveCubit extends Cubit<ApplyLeaveState> {
  ApplyLeaveCubit(this._applyLeave) : super(const ApplyLeaveState.initial());

  final ApplyLeaveUsecase _applyLeave;

  Future<void> applyLeave(ApplyLeaveRequest request) async {
    if (state is ApplyLeaveLoading) return; // block double taps
    emit(const ApplyLeaveState.loading());
    final result = await _applyLeave(request);
    switch (result) {
      case Ok(:final data):
        emit(ApplyLeaveState.success(message: data));
      case Err(:final failure):
        emit(ApplyLeaveState.failure(failure: failure));
    }
  }
}
```

**API state** — `presentation/cubit/apply_leave/apply_leave_state.dart`
```dart
part of 'apply_leave_cubit.dart';

@freezed
sealed class ApplyLeaveState with _$ApplyLeaveState {
  const factory ApplyLeaveState.initial() = ApplyLeaveInitial;
  const factory ApplyLeaveState.loading() = ApplyLeaveLoading;
  const factory ApplyLeaveState.success({required String message}) = ApplyLeaveSuccess;
  const factory ApplyLeaveState.failure({required Failure failure}) = ApplyLeaveFailure;
}
```
- Every API cubit has exactly `initial`, `loading`, `success`, `failure`.
- Variant classes are **public** (`ApplyLeaveSuccess`, not `_Success`) so UI can use Dart 3 `switch`.
- Paginated lists: `success` carries `items` + `hasMore`; load-more is a method flag, not a new state.

**Form cubit** — `presentation/cubit/apply_leave_form/`
```dart
part 'apply_leave_form_cubit.freezed.dart';
part 'apply_leave_form_state.dart';

@injectable
class ApplyLeaveFormCubit extends Cubit<ApplyLeaveFormState> {
  ApplyLeaveFormCubit() : super(const ApplyLeaveFormState());

  void reasonChanged(String value) => emit(state.copyWith(reason: value, reasonError: null));

  /// Returns true when the form is valid. Errors are l10n *keys*, resolved in the UI.
  bool validate() {
    final reasonError = Validators.required(state.reason);
    emit(state.copyWith(reasonError: reasonError));
    return reasonError == null;
  }

  ApplyLeaveRequest buildRequest() => ApplyLeaveRequest(
        leaveTypeOid: state.leaveTypeOid ?? '',
        startDate: state.startDate ?? '',
        endDate: state.endDate ?? '',
        reason: state.reason,
      );
}
```
```dart
part of 'apply_leave_form_cubit.dart';

@freezed
abstract class ApplyLeaveFormState with _$ApplyLeaveFormState {
  const factory ApplyLeaveFormState({
    String? leaveTypeOid,
    String? startDate,
    String? endDate,
    String? reason,
    ValidationError? reasonError,
    @Default(false) bool isHalfDay,
  }) = _ApplyLeaveFormState;
}
```
Form cubit = field values + validation errors + `buildRequest()`. It never calls an API and never takes a `BuildContext`.

**Screen** — reacting to states
```dart
BlocListener<ApplyLeaveCubit, ApplyLeaveState>(
  listener: (context, state) {
    switch (state) {
      case ApplyLeaveSuccess(:final message):
        AppSnackbar.success(context, message);
        context.pop(true);
      case ApplyLeaveFailure(:final failure):
        AppSnackbar.error(context, failure.toMessage(context));
      case ApplyLeaveInitial() || ApplyLeaveLoading():
        break;
    }
  },
  child: ...,
);

BlocBuilder<LeaveListCubit, LeaveListState>(
  builder: (context, state) => switch (state) {
    LeaveListInitial() || LeaveListLoading() => const AppLoader(),
    LeaveListSuccess(:final data) when data.items.isEmpty =>
        EmptyStateWidget(message: context.tr.leaveEmpty),
    LeaveListSuccess(:final data) => LeaveListView(items: data.items),
    LeaveListFailure(:final failure) => ErrorStateWidget(
        message: failure.toMessage(context),
        onRetry: context.read<LeaveListCubit>().load,
      ),
  },
);
```
- Cubits always come from `sl<...>()`, provided in the route (§10). Never construct use cases by hand.
- `setState` only for purely visual local state (tab index, expanded, controllers).
- `BlocBuilder`/`BlocSelector` for UI, `BlocListener` for navigation/snackbar/dialog, `BlocConsumer` when both, `context.read` for calls.
- Every list screen handles **loading, empty, error (with retry) and data**.
- Keep `build()` small; extract widgets to `presentation/widget/` once a file passes ~300 lines.

---

## 8. Design system rules (colors, text, spacing, strings, assets)

| Need | Use | Never |
|---|---|---|
| Material colors | `context.colorScheme.primary` | `Color(0xFF...)`, `Colors.blue` in widgets |
| Custom colors | `context.appColors.success` (ThemeExtension) | raw `AppColors.xxx` outside `core/theme` |
| Text style | `context.textTheme.titleMedium` (+ `.copyWith(...)`) | `TextStyle(fontSize: 14, ...)` in widgets |
| Spacing | `AppSpacing.md`, `Gaps.v16`, `EdgeInsets.all(AppSpacing.lg)` | magic numbers like `SizedBox(height: 13)` |
| Radius / sizes | `AppRadius.md`, `AppSizes.iconMd` | inline numbers |
| User-visible text | `context.tr.applyLeaveTitle` (ARB) | hard-coded strings, `isEn ? '..' : '..'` |
| Assets | `AppAssets.logo` | `'assets/images/logo.png'` literals |
| Endpoints | `ApiEndpoints.applyLeave` | path strings in remote sources |
| Storage keys | `StorageKeys.accessToken` | key strings in code |
| Fixed values | enums (`LeaveStatus.pending`) | `'Pending'`, `'Active'` strings |
| Dates / money / digits | `DateFormatter`, `MoneyFormatter`, `NumberFormatter` | ad-hoc `DateFormat(...)` in widgets |
| Feedback | `AppSnackbar`, `AppDialog`, `AppLoadingDialog` | raw `ScaffoldMessenger`/`showDialog` in features |

### Templates

`core/theme/app_colors.dart` — raw palette, only referenced inside `core/theme`
```dart
abstract final class AppColors {
  static const primary = Color(0xFF1565C0);
  static const success = Color(0xFF2E7D32);
  static const warning = Color(0xFFF9A825);
  static const error = Color(0xFFC62828);
  static const grey100 = Color(0xFFF5F5F5);
  static const grey900 = Color(0xFF212121);
}
```

`core/theme/app_color_scheme.dart` — semantic custom colors, light + dark
```dart
@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  const AppColorScheme({required this.success, required this.warning});

  final Color success;
  final Color warning;

  static const light = AppColorScheme(success: AppColors.success, warning: AppColors.warning);
  static const dark = AppColorScheme(success: Color(0xFF66BB6A), warning: Color(0xFFFFD54F));

  @override
  AppColorScheme copyWith({Color? success, Color? warning}) =>
      AppColorScheme(success: success ?? this.success, warning: warning ?? this.warning);

  @override
  AppColorScheme lerp(AppColorScheme? other, double t) => other == null
      ? this
      : AppColorScheme(
          success: Color.lerp(success, other.success, t)!,
          warning: Color.lerp(warning, other.warning, t)!,
        );
}
```

`core/theme/app_spacing.dart`
```dart
abstract final class AppSpacing {
  static const double xxs = 2, xs = 4, sm = 8, md = 12, lg = 16, xl = 24, xxl = 32;
}

abstract final class Gaps {
  static const v4 = SizedBox(height: AppSpacing.xs);
  static const v8 = SizedBox(height: AppSpacing.sm);
  static const v16 = SizedBox(height: AppSpacing.lg);
  static const h8 = SizedBox(width: AppSpacing.sm);
  static const h16 = SizedBox(width: AppSpacing.lg);
}
```

`core/extensions/context_extension.dart`
```dart
extension ContextX on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  AppColorScheme get appColors => Theme.of(this).extension<AppColorScheme>()!;
  AppLocalizations get tr => AppLocalizations.of(this);
  Size get screenSize => MediaQuery.sizeOf(this);
}
```

`core/utils/validators.dart` — returns an error enum; the UI turns it into text
```dart
enum ValidationError { required, invalidPhone, invalidEmail, invalidAmount }

abstract final class Validators {
  static ValidationError? required(String? v) =>
      (v == null || v.trim().isEmpty) ? ValidationError.required : null;

  static ValidationError? phone(String? v) =>
      RegExp(r'^01[3-9]\d{8}$').hasMatch(v ?? '') ? null : ValidationError.invalidPhone;
}
```
with `extension ValidationErrorText on ValidationError { String toMessage(BuildContext c) }` next to it.

Strings:
- Add every key to **both** `app_en.arb` and `app_bn.arb`, in the same commit.
- Key naming: `<feature><Thing>` in lowerCamelCase — `leaveApplyTitle`, `errorNoInternet`, `commonSave`.
- Shared words (`commonSave`, `commonCancel`, `commonRetry`) are reused, not duplicated per feature.

Responsiveness: use `LayoutBuilder`, `Flexible`/`Expanded` and `MediaQuery.sizeOf`. Do not use screen-percentage helpers (`SizeConfig`, `.h`/`.w` extensions).

---

## 9. Dependency injection (injectable)

`core/di/injection.dart`
```dart
final sl = GetIt.instance;

@InjectableInit(initializerName: 'init', preferRelativeImports: true, asExtension: true)
Future<void> configureDependencies() => sl.init();
```

| Class | Annotation |
|---|---|
| Remote source / repository impl | `@LazySingleton(as: Contract)` |
| Interceptors, storages, services | `@lazySingleton` |
| Use case | `@injectable` |
| Cubit | `@injectable` (new instance each time) |
| Third-party objects (Dio, SharedPreferences, secure storage) | `@module` in `register_module.dart` (`@preResolve` for async) |

- Never hand-write `sl.registerXxx(...)` for app classes.
- Use constructor injection with private `final` fields. `sl<...>()` is used **only** in the router, `app.dart` and `main.dart` — never inside data/domain/cubit classes.

---

## 10. Navigation (go_router)

`core/router/route_names.dart`
```dart
abstract final class RouteNames {
  static const leave = 'leave';
  static const applyLeave = 'apply-leave';
}

abstract final class RoutePaths {
  static const leave = '/leave';
  static const applyLeave = 'apply'; // child of /leave → /leave/apply
}
```

`core/router/app_router.dart`
```dart
GoRoute(
  path: RoutePaths.leave,
  name: RouteNames.leave,
  builder: (context, state) => BlocProvider(
    create: (_) => sl<LeaveListCubit>()..load(),
    child: const LeaveScreen(),
  ),
  routes: [
    GoRoute(
      path: RoutePaths.applyLeave,
      name: RouteNames.applyLeave,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => sl<ApplyLeaveFormCubit>()),
          BlocProvider(create: (_) => sl<ApplyLeaveCubit>()),
        ],
        child: const ApplyLeaveScreen(),
      ),
    ),
  ],
),
```
- Navigate with `context.pushNamed(RouteNames.applyLeave)`, `context.goNamed(...)`, `context.pop(result)`.
- IDs go in path/query params; complex objects go in `extra` as a **typed** args class (`ApplyLeaveArgs`).
- Auth guard is a single `redirect` in `app_router.dart` listening to the session state. No per-screen login checks.
- Screen-scoped cubits are provided in the route; only app-wide cubits (session, locale, theme, profile) are global in `app.dart`.

---

## 11. Environments & bootstrap

`config/env/dev.json`
```json
{ "FLAVOR": "dev", "BASE_URL": "https://dev-api.example.com" }
```

`core/config/app_env.dart`
```dart
abstract final class AppEnv {
  static const flavor = String.fromEnvironment('FLAVOR', defaultValue: 'dev');
  static const baseUrl = String.fromEnvironment('BASE_URL');
  static bool get isProd => flavor == 'prod';
}
```

Run / build:
```bash
flutter run --dart-define-from-file=config/env/dev.json
flutter build apk --release --dart-define-from-file=config/env/prod.json
```

`main.dart` does only: `WidgetsFlutterBinding.ensureInitialized()` → Firebase/other SDK init →
`await configureDependencies()` → `runApp(const App())`. No business logic.

---

## 12. Code generation

After adding/changing any `@freezed`, `@JsonSerializable`, or injectable-annotated class:
```bash
dart run build_runner build --delete-conflicting-outputs
```
After changing ARB files: `flutter gen-l10n`.
Never edit `*.freezed.dart`, `*.g.dart`, `injection.config.dart` or `core/l10n/generated/`.

---

## 13. Core rules (network, storage, logging)

- Only remote sources use Dio, and only via the injected instance. Tokens are added by `AuthInterceptor`, never per request.
- Tokens live in `TokenStorage` (secure storage). Other preferences go through `LocalStorage` with keys from `StorageKeys`.
- Log with `logDebug` / `logError` from `app_logger.dart`. No `print`/`debugPrint`. Never log tokens or passwords.

---

## 14. Lints

`analysis_options.yaml`
```yaml
include: package:very_good_analysis/analysis_options.yaml

analyzer:
  exclude:
    - "**/*.g.dart"
    - "**/*.freezed.dart"
    - "lib/core/di/injection.config.dart"
    - "lib/core/l10n/generated/**"

linter:
  rules:
    public_member_api_docs: false
```
Code must have **zero analyzer warnings** before a task is considered done.

---

## 15. Testing

```
test/
├── core/
└── features/<feature>/
    ├── data/<feature>_repository_impl_test.dart
    ├── domain/<action>_usecase_test.dart
    └── presentation/<action>_cubit_test.dart
```
- Cubits: `bloc_test` + `mocktail`. Cover `[loading, success]` (use case returns `Ok`) and `[loading, failure]` (returns `Err`).
- Repositories: mock the remote source; assert exceptions become the right `Failure`.
- Test names describe behaviour: `'emits [loading, failure] when the use case returns NetworkFailure'`.

---

## 16. Checklists

### New feature / API action
1. Endpoint constant in `ApiEndpoints`.
2. Freezed request/response models (+ enums for fixed values).
3. Remote source method (interface + impl).
4. Repository contract + impl with `guard()`.
5. Use case (`@injectable`, single `call`, returns `Result`).
6. Cubit + freezed state (`initial/loading/success/failure`, public variants), `@injectable`.
7. Form cubit if there is a form.
8. `dart run build_runner build --delete-conflicting-outputs`.
9. Screen + widgets (loading, empty, error+retry, data) using the design system only.
10. Route in `route_names.dart` + `app_router.dart` with `BlocProvider(create: (_) => sl<...>())`.
11. ARB keys in `app_en.arb` and `app_bn.arb`, then `flutter gen-l10n`.
12. Tests.
13. `flutter analyze` clean.

### Hard DON'Ts
- ❌ No folders/layers outside this document (`entities/`, `providers/`, `helpers/`, `pages/`, `views/`, `services/` inside a feature).
- ❌ No API calls, JSON parsing or business rules in widgets or cubits.
- ❌ Cubits never call repositories or remote sources — only use cases.
- ❌ No try/catch in cubits for API calls — repositories already return `Result`.
- ❌ No hand-written states, models, or DI registrations.
- ❌ No raw colors, text styles, spacing numbers, strings, asset paths, endpoints or storage keys outside their `core/` files.
- ❌ No `BuildContext` in cubits, use cases, or repositories.
- ❌ No editing generated files.
- ❌ No new packages, lint changes, or renaming existing files unless asked.
- ❌ No refactoring of unrelated code during a task.
- ❌ No commented-out code, `print`, or unrequested TODOs.

### Legacy code
Existing projects were partly written before these rules (`http` + `Executor`,
hand-written states and models, manual `sl.register...`, `Navigator` named routes,
`screens/` folders). When **editing** such a feature, keep that feature's existing
style unless the owner asks for migration. Every **new** feature follows this
document in full. If a required package/core file (Dio client, `Result`, `guard`,
go_router, design-system files) does not exist yet, **ask the owner before
creating it** — do not silently set up a parallel infrastructure.

---

## 17. Changing these rules

- Only the owner changes this file. AI assistants must not edit it on their own
  initiative; propose the change and wait for approval.
- On every change, bump the **Version** at the top and add a changelog line.

### Changelog
- **2.1 — 2026-10-19** — Renamed `TimeoutException` → `RequestTimeoutException` (clashed with `dart:async`).
- **2.0 — 2026-10-19** — Modernised: sealed `Failure` + `Result<T>` with `guard()`,
  freezed + json_serializable models, Dio with interceptors, go_router,
  `--dart-define-from-file` environments, very_good_analysis, public freezed
  variants with Dart 3 `switch`, full `core/` design-system layout and rules
  (colors, text, spacing, strings, assets, validators, formatters, feedback,
  common widgets), secure token storage.
- **1.0 — 2026-10-19** — Initial version, merged from `07-celac-mobile-app` and `HISAB_GURU`.
