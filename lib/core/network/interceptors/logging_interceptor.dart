import 'package:dio/dio.dart';
import 'package:skill_swap_bd/core/utils/app_logger.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logDebug('--> ${options.method} ${options.uri}');
    logDebug('Headers: ${options.headers}');
    if (options.data != null) {
      logDebug('Body: ${options.data}');
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final status = response.statusCode;
    final method = response.requestOptions.method;
    final uri = response.requestOptions.uri;
    logDebug('<-- $status $method $uri');
    logDebug('Response: ${response.data}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final status = err.response?.statusCode;
    final method = err.requestOptions.method;
    final uri = err.requestOptions.uri;
    logError('<-- ERROR $status $method $uri', err);
    handler.next(err);
  }
}
