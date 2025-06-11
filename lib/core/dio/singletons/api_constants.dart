import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class ApiConstants {
  static String baseUrl = '';
}

Future<bool> isInternetConnected() async {
  var connectionChecker = InternetConnectionChecker();
  if (await connectionChecker.hasConnection) {
    return true;
  } else {
    return false;
  }
}
