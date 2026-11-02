import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/error/exceptions.dart';

@lazySingleton
class ApiResponseInterceptor extends Interceptor {
  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final data = response.data;
    if (data is Map<String, dynamic>) {
      final status = data['status'];
      if (status is bool && !status) {
        final message = data['message'] as String? ?? 'Request failed';
        return handler.reject(
          DioException(
            requestOptions: response.requestOptions,
            response: response,
            error: ServerException(message, statusCode: response.statusCode),
          ),
        );
      }
    }
    handler.next(response);
  }
}
