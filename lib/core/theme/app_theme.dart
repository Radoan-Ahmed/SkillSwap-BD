import 'package:flutter/material.dart';
import 'package:skill_swap_bd/core/theme/app_color_scheme.dart';
import 'package:skill_swap_bd/core/theme/app_colors.dart';
import 'package:skill_swap_bd/core/theme/app_text_styles.dart';

abstract final class AppTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    textTheme: AppTextStyles.textTheme,
    extensions: const [AppColorScheme.light],
  );

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
    ),
    textTheme: AppTextStyles.textTheme,
    extensions: const [AppColorScheme.dark],
  );
}
