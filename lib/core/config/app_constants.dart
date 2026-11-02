abstract final class AppConstants {
  static const int pageSize = 20;
  static const int maxUploadSizeInBytes = 5 * 1024 * 1024;
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
}
