import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:storyv2/layers/data/near_me_mocks.dart';
import 'package:storyv2/layers/presentation/feed/screens/ar_view_screen.dart';
import 'package:storyv2/layers/presentation/feed/screens/story_view_screen.dart';

import '../widgets/google_tile_layer.dart';

class NearMeOpenStreet extends StatefulWidget {
  const NearMeOpenStreet({super.key});

  @override
  State<NearMeOpenStreet> createState() => _NearMeOpenStreetState();
}

class _NearMeOpenStreetState extends State<NearMeOpenStreet> {
  int viewIndex = 0;
  Position? myLocation;
  final MapController _mapController = MapController();

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
        _mapController.move(
            LatLng(myLocation!.latitude, myLocation!.longitude), 18);
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
    return Stack(
      children: [
        IndexedStack(
          index: viewIndex,
          children: [
            FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  maxZoom: 19,
                  onMapEvent: (event) {
                    if (event is MapEventMove) {}
                  },
                ),
                children: [
                  GoogleMapTileLayer(mapType: MapType.normal),
                  // TileLayer(
                  //   urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  // ),
                  // TileLayer(
                  //   urlTemplate:
                  //       'https://mt0.google.com/vt/lyrs=m@221097413&x={x}&y={y}&z={z}',
                  // ),

                  MarkerLayer(
                      markers: nearMeMockedItems.map((item) {
                    if (item.mediaType == MediaType.profile) {
                      return Marker(
                          point: item.latLng,
                          width: 80,
                          height: 60,
                          child: Column(
                            children: [
                              Container(
                                width: 42,
                                height: 42,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(item.thumbnail)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          offset: Offset(0, 2),
                                          blurRadius: 4)
                                    ],
                                    border: Border.all(
                                        width: 2, color: Colors.white),
                                    borderRadius: BorderRadius.circular(24),
                                    color: Colors.blue),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                item.title,
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              )
                            ],
                          ));
                    } else {
                      return Marker(
                          width: 80,
                          height: 80,
                          point: item.latLng,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return StoryViewScreen(nearMeItem: item);
                              }));
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 40,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: Colors.white, width: 3),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 4,
                                            offset: Offset(0, 4))
                                      ],
                                      color: Colors.black,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(item.thumbnail))),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  item.title,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                )
                              ],
                            ),
                          ));
                    }
                  }).toList()),
                  MarkerLayer(
                    markers: [
                      if (myLocation != null)
                        Marker(
                            point: LatLng(
                                myLocation!.latitude, myLocation!.longitude),
                            width: 80,
                            height: 80,
                            child: Center(
                              child: Container(
                                width: 42,
                                height: 42,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/person.png')),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color.fromARGB(255, 50, 190, 255)
                                                  .withOpacity(0.6),
                                          offset: Offset(0, 2),
                                          blurRadius: 4)
                                    ],
                                    border: Border.all(
                                        width: 3,
                                        color: Colors.blueAccent.shade200),
                                    borderRadius: BorderRadius.circular(24),
                                    color: Colors.blue),
                              ),
                            )),
                    ],
                  ),
                ]),
            if (myLocation != null)
              ARViewScreen(
                position: myLocation!,
              )
          ],
        ),
        Positioned(
          bottom: 14,
          right: 14,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  if (myLocation != null) {
                    _mapController.move(
                        LatLng(myLocation!.latitude, myLocation!.longitude),
                        18);
                  }
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(0, 4))
                      ],
                      shape: BoxShape.circle),
                  child: Icon(Icons.my_location),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    viewIndex = viewIndex == 1 ? 0 : 1;
                  });
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(0, 4))
                      ],
                      shape: BoxShape.circle),
                  child: Icon(Icons.view_in_ar),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
