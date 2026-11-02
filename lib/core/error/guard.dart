import 'package:dio/dio.dart';
import 'package:skill_swap_bd/core/error/exceptions.dart';
import 'package:skill_swap_bd/core/error/failures.dart';
import 'package:skill_swap_bd/core/error/result.dart';
import 'package:skill_swap_bd/core/utils/app_logger.dart';

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
  } on Object catch (e, s) {
    logError('Unexpected error', e, s);
    return const Err(UnknownFailure('Something went wrong'));
  }
}

Failure _toFailure(AppException e) => switch (e) {
  NetworkException() => NetworkFailure(e.message),
  RequestTimeoutException() => TimeoutFailure(e.message),
  UnauthorizedException() => UnauthorizedFailure(e.message),
  ServerException(:final statusCode) => ServerFailure(
    e.message,
    statusCode: statusCode,
  ),
  CacheException() => CacheFailure(e.message),
};
