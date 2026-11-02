import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/utils/app_logger.dart';

@lazySingleton
class ShorebirdService {
  Future<void> checkForUpdates() async {
    try {
      logDebug('ShorebirdService: Checking for OTA code push patches...');
    } on Object catch (e, s) {
      logError('ShorebirdService error checking patches', e, s);
    }
  }
}
