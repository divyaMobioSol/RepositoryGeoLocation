import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Gmap extends StatelessWidget {
  final double lat;
  final double long;

  Gmap({required this.lat, required this.long});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        initialCameraPosition: CameraPosition(
      target: LatLng(lat, long),
      zoom: 10,
    ));
  }
}
