import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:marketplace/core/dio/singletons/dio_settings.dart';
import 'package:marketplace/core/dio/utils/connection_info.dart';
import 'package:marketplace/features/cart/data/datasource/cart_datasource.dart';
import 'package:marketplace/features/cart/data/repositories/cart_repositories.dart';

final serviceLocator = GetIt.I;

void setupLocator() {
  serviceLocator.registerFactory(DioSettings.new);

  serviceLocator.registerLazySingleton<Connectivity>(() => Connectivity());

  serviceLocator.registerLazySingleton<ConnectionInfo>(
    () => ConnectionInfo(connectivity: serviceLocator.get<Connectivity>(), connectionChecker: InternetConnectionChecker()),
  );

  repository();
}

Future resetLocator() async {
  await serviceLocator.reset();
  setupLocator();
}

void repository(){
  serviceLocator.registerSingleton(
    CartRepoImpl(dataSource: CartDataSourceImpl()),
  );
}
