import 'package:injectable/injectable.dart';

@lazySingleton
class NotificationService {
  Future<void> initialize() async {}

  Future<void> showNotification({
    required String title,
    required String body,
  }) async {}
}
