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
