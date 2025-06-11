import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class ConnectivityService with ChangeNotifier {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _subscription;
  bool _hasConnection = true;

  bool get hasConnection => _hasConnection;

  ConnectivityService() {
    _initConnectivity();
  }

  void _initConnectivity() {
    _subscription = _connectivity.onConnectivityChanged.listen((resultList) {
      final isConnected = resultList.any((r) => r != ConnectivityResult.none);
      if (_hasConnection != isConnected) {
        _hasConnection = isConnected;
        notifyListeners();
      }
    });
  }

  void disposeService() {
    _subscription.cancel();
  }
}
