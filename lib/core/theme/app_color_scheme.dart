import 'package:flutter/material.dart';
import 'package:skill_swap_bd/core/theme/app_colors.dart';

@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  const AppColorScheme({required this.success, required this.warning});

  final Color success;
  final Color warning;

  static const light = AppColorScheme(
    success: AppColors.success,
    warning: AppColors.warning,
  );

  static const dark = AppColorScheme(
    success: Color(0xFF66BB6A),
    warning: Color(0xFFFFD54F),
  );

  @override
  AppColorScheme copyWith({Color? success, Color? warning}) => AppColorScheme(
    success: success ?? this.success,
    warning: warning ?? this.warning,
  );

  @override
  AppColorScheme lerp(AppColorScheme? other, double t) =>
      other == null
          ? this
          : AppColorScheme(
            success: Color.lerp(success, other.success, t)!,
            warning: Color.lerp(warning, other.warning, t)!,
          );
}
