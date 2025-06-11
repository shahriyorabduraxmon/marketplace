import 'package:flutter/services.dart';
import 'package:marketplace/assets/app_colors.dart';

class SystemBar{
  static void setOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        /// Navigation Bar
          systemNavigationBarColor: AppColors.transparent,
          systemNavigationBarDividerColor: AppColors.transparent,
          systemNavigationBarIconBrightness: AppColors.isDarkMode
              ? Brightness.light
              : Brightness.dark,
          systemNavigationBarContrastEnforced: true,
          /// Status bar
          statusBarColor: AppColors.transparent,
          statusBarBrightness: AppColors.isDarkMode
              ? Brightness.light
              : Brightness.dark,
          statusBarIconBrightness: AppColors.isDarkMode
              ? Brightness.light
              : Brightness.dark,
          systemStatusBarContrastEnforced: false
      ),
    );
  }
}