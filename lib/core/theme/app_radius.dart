import 'package:flutter/widgets.dart';

abstract final class AppRadius {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double full = 9999;
}

abstract final class Radii {
  static const r4 = BorderRadius.all(Radius.circular(AppRadius.xs));
  static const r8 = BorderRadius.all(Radius.circular(AppRadius.sm));
  static const r12 = BorderRadius.all(Radius.circular(AppRadius.md));
  static const r16 = BorderRadius.all(Radius.circular(AppRadius.lg));
  static const r24 = BorderRadius.all(Radius.circular(AppRadius.xl));
  static const full = BorderRadius.all(Radius.circular(AppRadius.full));
}
