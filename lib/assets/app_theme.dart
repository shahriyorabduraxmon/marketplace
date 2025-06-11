import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final appThemeData = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF0ABAB5),
    background: Color(0xFFF2F4F8),
    onPrimary: Color(0xFFFFFFFF),
    onBackground: Color(0xFF161B26),
  ),
  scaffoldBackgroundColor: const Color(0xFFF2F4F8),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
);

final darkThemeData = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF0ABAB5),
    background: Color(0xFF1F242F),
    onPrimary: Color(0xFF000000),
    onBackground: Color(0xFFEEEEF0)
  ),
  scaffoldBackgroundColor: const Color(0xFF1F242F),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
);
