import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  /// Call this on app start or when theme changes
  static bool isDarkMode = false;

  static Color get navBarColor => const Color(0xFF8B9099);
  static Color get primaryColor => const Color(0xFF0ABAB5);
  static Color get bgColor => isDarkMode
      ? Color(0xFF1F242F)
      : const Color(0xFFF2F4F8);
  static Color get cardColor => isDarkMode
      ? const Color(0xFF000000)
      : const Color(0xFFFFFFFF);
  static Color get textColor => isDarkMode
      ? const Color(0xFFEEEEF0)
      : const Color(0xFF161B26);
  static Color get transparent => Colors.transparent;
}
