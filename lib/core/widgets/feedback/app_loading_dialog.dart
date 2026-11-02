import 'package:flutter/material.dart';
import 'package:skill_swap_bd/core/widgets/app_loader.dart';

abstract final class AppLoadingDialog {
  static void show(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder:
          (_) =>
              const PopScope(canPop: false, child: Center(child: AppLoader())),
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
