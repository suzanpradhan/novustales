import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TalesScreen extends StatefulWidget {
  const TalesScreen({super.key});

  @override
  State<TalesScreen> createState() => _TalesScreenState();
}

class _TalesScreenState extends State<TalesScreen> {
  double _bottomSheetHeight = 0.6;
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
            CameraPosition(target: LatLng(myLocation!.latitude, myLocation!.longitude), zoom: 18)));
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
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: constraints.maxHeight - (constraints.maxHeight * _bottomSheetHeight),
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: myLocation != null
                        ? LatLng(myLocation!.latitude, myLocation!.longitude)
                        : LatLng(37.7749, -122.4194),
                    zoom: 18),
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                compassEnabled: false,
                indoorViewEnabled: false,
                buildingsEnabled: false,
                mapToolbarEnabled: false,
                zoomControlsEnabled: false,
                markers: const {},
                onMapCreated: (controller) {
                  _mapController = controller;
                  if (myLocation != null) {
                    _mapController?.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
                        target: LatLng(myLocation!.latitude, myLocation!.longitude), zoom: 18)));
                  }
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: NotificationListener<DraggableScrollableNotification>(
              onNotification: (notification) {
                setState(() {
                  _bottomSheetHeight = notification.extent;
                });
                return true;
              },
              child: Container(
                color: Colors.red,
                child: DraggableScrollableSheet(
                    initialChildSize: _bottomSheetHeight,
                    minChildSize: 0.1,
                    maxChildSize: 0.9,
                    expand: false,
                    snapSizes: const [0.4, 0.6],
                    builder: (context, scrollController) {
                      return SingleChildScrollView(
                        controller: scrollController,
                        child: Row(
                          children: const [
                            SizedBox(
                              child: Text("Explore"),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          )
        ],
      );
    });
  }
}
