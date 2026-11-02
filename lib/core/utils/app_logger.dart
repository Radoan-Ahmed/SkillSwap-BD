import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

void logDebug(String message, [Object? error, StackTrace? stackTrace]) {
  if (kDebugMode) {
    developer.log(message, name: 'DEBUG', error: error, stackTrace: stackTrace);
  }
}

void logError(String message, [Object? error, StackTrace? stackTrace]) {
  if (kDebugMode) {
    developer.log(message, name: 'ERROR', error: error, stackTrace: stackTrace);
  }
}
