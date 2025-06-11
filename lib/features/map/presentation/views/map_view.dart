import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:marketplace/assets/app_colors.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late YandexMapController _mapController;

  final List<Point> _locations = [
    Point(latitude: 41.311081, longitude: 69.240562), // Amir Temur xiyoboni
    Point(latitude: 41.338525, longitude: 69.334053), // Tashkent City Park
    Point(latitude: 41.299496, longitude: 69.240074), // Alisher Navoiy teatri
    Point(latitude: 41.327546, longitude: 69.281380), // Minor masjidi
    Point(latitude: 41.344701, longitude: 69.256272), // TV minorasi (Tower)
  ];


  List<MapObject> _mapObjects = [];
  late Future<BitmapDescriptor> _icon;

  @override
  void initState() {
    super.initState();
    _icon = _createMapIconFromFlutterIcon(Icons.shopping_cart, AppColors.primaryColor, 56);
  }

  Future<BitmapDescriptor> _createMapIconFromFlutterIcon(
      IconData icon, Color color, double size) async {
    final pictureRecorder = ui.PictureRecorder();
    final canvas = Canvas(pictureRecorder);
    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    final iconStr = String.fromCharCode(icon.codePoint);
    textPainter.text = TextSpan(
      text: iconStr,
      style: TextStyle(
        fontSize: size,
        fontFamily: icon.fontFamily,
        package: icon.fontPackage,
        color: color,
      ),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset.zero);

    final picture = pictureRecorder.endRecording();
    final image = await picture.toImage(size.toInt(), size.toInt());
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
  }

  void _onMapCreated(YandexMapController controller) async {
    _mapController = controller;

    // Move camera to Tashkent
    await _mapController.moveCamera(
      CameraUpdate.newCameraPosition(
        const CameraPosition(
          target: Point(latitude: 41.3111, longitude: 69.2797),
          zoom: 12,
        ),
      ),
    );

    final icon = await _icon;

    final placemarks = _locations
        .map((point) => PlacemarkMapObject(
      mapId: MapObjectId('branch_${point.latitude}_${point.longitude}'),
      point: point,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: icon,
          scale: 1.2,
        ),
      ),
    ))
        .toList();

    setState(() {
      _mapObjects = placemarks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: FutureBuilder<BitmapDescriptor>(
        future: _icon,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return YandexMap(
            onMapCreated: _onMapCreated,
            mapObjects: _mapObjects,
          );
        },
      ),
    );
  }
}
