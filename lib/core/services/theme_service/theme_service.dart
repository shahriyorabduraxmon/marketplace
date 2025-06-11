import 'package:flutter/material.dart';
import 'package:marketplace/core/services/local_storage/storage_keys.dart';
import 'package:marketplace/core/services/local_storage/storage_repository.dart';
import 'package:marketplace/core/services/system_bar_service/system_bar.dart';

enum AppThemeMode { light, dark }

class ThemeProvider with ChangeNotifier {
  AppThemeMode _appThemeMode = AppThemeMode.light;

  AppThemeMode get appThemeMode => _appThemeMode;

  ThemeMode get themeMode {
    if(_appThemeMode == AppThemeMode.dark){
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  Future<void> loadTheme() async {
    final index = StorageRepository.getInt(StorageKeys.mode, defValue: 0);
    _appThemeMode = AppThemeMode.values[index];
    notifyListeners();
  }

  Future<void> setTheme(AppThemeMode mode) async {
    _appThemeMode = mode;
    StorageRepository.putInt(StorageKeys.mode, mode.index);
    notifyListeners();
    await Future.delayed((Duration(milliseconds: 500)));
    SystemBar.setOverlayStyle();
  }
}
