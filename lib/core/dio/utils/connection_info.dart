import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class IConnectionInfo {
  Future<bool> get isConnected;
}

class ConnectionInfo implements IConnectionInfo {
  final Connectivity _connectivity;
  final InternetConnectionChecker _connectionChecker;

  ConnectionInfo(
      {required Connectivity connectivity,
      required InternetConnectionChecker connectionChecker})
      : _connectivity = connectivity,
        _connectionChecker = connectionChecker;

  @override
  Future<bool> get isConnected async {
    final result = await _connectivity.checkConnectivity();
    //with connectivity we can check our data use mobile data or wifi or ethernet or none
    if (result != ConnectivityResult.bluetooth &&
        result != ConnectivityResult.none) {
      // with DataConnectionChecker we can check clear connection with internet
      if (await _connectionChecker.hasConnection) {
        // device is connected to the internet
        return true;
      } else {
        // device connected wifi or mobile data or ethernet, but doesn't have connection with internet
        return false;
      }
    } else {
      // device not connected any of mobile data or wifi or ethernet.
      return false;
    }
  }
}
