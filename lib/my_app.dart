import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/assets/app_colors.dart';
import 'package:marketplace/core/services/theme_service/theme_service.dart';
import 'package:marketplace/features/cart/presentation/controller/bloc/cart_bloc.dart';
import 'assets/app_theme.dart';
import 'core/navigation/app_routs.dart';
import 'core/utils/log_service.dart';
import 'core/utils/size_config.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initial(); // ✅ bu yerda chaqirish kerak
  }

  void initial() {
    SizeConfig().init(context);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartBloc(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Marketplace',
        debugShowCheckedModeBanner: false,
        theme: appThemeData,
        darkTheme: darkThemeData,
        themeMode: themeProvider.themeMode,
        routerConfig: AppRouts.router,
        builder: (context, child) {
          (AppColors.isDarkMode =
              Theme.of(context).brightness == Brightness.dark);
          return child!;
        },
      ),
    );
  }
}
