import 'package:flutter/material.dart';
import 'package:skill_swap_bd/core/l10n/generated/app_localizations.dart';
import 'package:skill_swap_bd/core/theme/app_color_scheme.dart';

extension ContextX on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  AppColorScheme get appColors => Theme.of(this).extension<AppColorScheme>()!;
  AppLocalizations get tr => AppLocalizations.of(this)!;
  Size get screenSize => MediaQuery.sizeOf(this);
}
