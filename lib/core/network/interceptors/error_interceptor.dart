import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/error/exceptions.dart';

@lazySingleton
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.error is AppException) return handler.next(err);
    final mapped = switch (err.type) {
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
      data is Map
          ? '${data['message'] ?? 'Something went wrong'}'
          : 'Something went wrong';
}
