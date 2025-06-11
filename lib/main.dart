import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:marketplace/core/dio/singletons/service_locator.dart';
import 'package:marketplace/core/services/connectivity_service/connectivity_service.dart';
import 'package:marketplace/core/services/local_storage/storage_repository.dart';
import 'package:marketplace/my_app.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/services/theme_service/theme_service.dart';
import 'features/home/domain/entity/product_entity.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await Hive.initFlutter();
  await StorageRepository.getInstance();
  Hive.registerAdapter(ProductEntityAdapter());
  await Hive.openBox<ProductEntity>('productBox');
  debugRepaintRainbowEnabled = false;
  final themeProvider = ThemeProvider();
  await themeProvider.loadTheme();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: themeProvider),
      ],
      child: ChangeNotifierProvider(
          create: (_) => ConnectivityService(),
          child: const MyApp()
      ),
    ),
  );
}
