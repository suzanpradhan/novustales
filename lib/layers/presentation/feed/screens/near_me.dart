import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:latlong2/latlong.dart';

import '../widgets/google_tile_layer.dart';

class NearMeScreen extends StatefulWidget {
  const NearMeScreen({super.key});

  @override
  State<NearMeScreen> createState() => _NearMeScreenState();
}

class _NearMeScreenState extends State<NearMeScreen> {
  Position? myLocation;
  GoogleMapController? _mapController;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      myLocation = await _determinePosition();
      if (myLocation != null) {
        _mapController?.moveCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(myLocation!.latitude, myLocation!.longitude),
                zoom: 18)));
      }
      setState(() {});
    });
    Geolocator.getPositionStream().listen((Position position) {
      myLocation = position;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
          target: myLocation != null
              ? LatLng(myLocation!.latitude, myLocation!.longitude)
              : LatLng(37.7749, -122.4194),
          zoom: 18),
      myLocationEnabled: true,
      compassEnabled: false,
      indoorViewEnabled: false,
      buildingsEnabled: false,
      mapToolbarEnabled: false,
      markers: const {},
      onMapCreated: (controller) {
        _mapController = controller;
        if (myLocation != null) {
          _mapController?.moveCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(myLocation!.latitude, myLocation!.longitude),
                  zoom: 18)));
        }
      },
    );
  }
}
