import 'package:geolocator/geolocator.dart';

class LocationServicePermission {
  static Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // GPS xizmati yoqilganini tekshirish
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Ro'xsat berilmagan");
    }

    // Ruxsatni tekshirish
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("Ro'xsat berilmagan");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception("Ro'xsat berilmagan");
    }
  }

}