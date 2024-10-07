import 'dart:async';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:storyv2/old/config/environment.config.dart';

import 'dependencies_injection.dart';

class GoogleMapsService {
  late PolylinePoints polylinePoints;

  GoogleMapsService() {
    polylinePoints = PolylinePoints();
  }

  Future<List<LatLng>> getDirection({
    required LatLng origin,
    required LatLng destination,
  }) async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: sl<EnvironmentConfig>().googleMapKey,
      request: PolylineRequest(
        origin: PointLatLng(origin.latitude, origin.longitude),
        destination: PointLatLng(destination.latitude, destination.longitude),
        mode: TravelMode.driving,
      ),
    );
    return result.points.map((e) => LatLng(e.latitude, e.longitude)).toList();
  }
}
