import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../config/preference_utils.dart';
import '../network/api_response.dart';

class LocationProvider with ChangeNotifier {
  LocationModes _locationMode = LocationModes.DEFAULT;
  LocationModes get locationMode => _locationMode;

  final ApiResponse _nearestApiResponse = ApiResponse.initial('Empty data');
  ApiResponse get notificationApiResponse => _nearestApiResponse;
  setLocationMode(LocationModes modes) {
    _locationMode = modes;
    _selectedPin = null;
    notifyListeners();
  }

  final LocationSettings _locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  final SharedPreferences instance = PreferenceUtils.instance;
  void listenToLocationChanges() {
    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: _locationSettings)
            .listen((Position? position) {
      try {
        if (position != null) {
          _currentLocation = LatLng(position.latitude, position.longitude);
          instance.setStringList("CURRENT_LOCATION",
              [position.latitude.toString(), position.longitude.toString()]);

          notifyListeners();
        }
      } catch (e) {}
    });
  }

  CameraPosition? _defaultLocation;
  CameraPosition? get defaultLocation => _defaultLocation;

  LocationPermission? _permission;
  LocationPermission? get permission => _permission;

  LatLng? _currentLocation;
  LatLng? get currentLocation => _currentLocation;

  LatLng? _selectedPin;
  LatLng? get selectedPin => _selectedPin;

  noLocationPermission(LocationPermission? permission) {
    return permission == null ||
        permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever ||
        permission == LocationPermission.unableToDetermine;
  }

  Future<void> forceRequestPermission() async {
    _permission = await Geolocator.checkPermission();
    if (noLocationPermission(permission)) {
      _permission = await Geolocator.requestPermission();
      if (noLocationPermission(_permission)) {
        try {
          await Geolocator.openLocationSettings();
        } catch (e) {
          _permission = LocationPermission.unableToDetermine;
        }
      }
    } else {
      _locationMode = LocationModes.DEFAULT;
    }
    // reposition();
    notifyListeners();
  }

  Future<void> requestPermission() async {
    try {
      _permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      double lat = position.latitude;
      double long = position.longitude;
      _currentLocation = LatLng(lat, long);
      instance.setStringList("CURRENT_LOCATION",
          [position.latitude.toString(), position.longitude.toString()]);
      notifyListeners();
      listenToLocationChanges();
      notifyListeners();
    } catch (e) {
      _defaultLocation = const CameraPosition(
        target: LatLng(26.833254590738573, 87.13561297494543),
        zoom: 14.4746,
      );
    }
  }

  Future<void> init(BuildContext context) async {
    notifyListeners();
    await requestPermission();
    if (noLocationPermission(permission)) {
      _locationMode = LocationModes.NO_PERMISSION_MODE;
    } else {
      _locationMode = LocationModes.DEFAULT;
    }
  }
}

enum LocationModes {
  DEFAULT,
  NO_PERMISSION_MODE,
}
