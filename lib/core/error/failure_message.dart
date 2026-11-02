import 'package:flutter/widgets.dart';
import 'package:skill_swap_bd/core/error/failures.dart';
import 'package:skill_swap_bd/core/extensions/context_extension.dart';

extension FailureMessage on Failure {
  String toMessage(BuildContext context) => switch (this) {
    NetworkFailure() => context.tr.errorNoInternet,
    TimeoutFailure() => context.tr.errorTimeout,
    UnauthorizedFailure() => context.tr.errorSessionExpired,
    ServerFailure(:final message) => message,
    CacheFailure() || UnknownFailure() => context.tr.errorGeneric,
  };
}
