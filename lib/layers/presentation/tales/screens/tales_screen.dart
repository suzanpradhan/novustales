import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:storyv2/core/constants/app_colors.dart';
import 'package:storyv2/core/constants/ui_constants.dart';
import 'package:storyv2/layers/domain/usecases/tales/get_near_me_tales.dart';
import 'package:storyv2/layers/presentation/tales/blocs/get_direction/get_direction_bloc.dart';
import 'package:storyv2/layers/presentation/tales/blocs/get_near_me_tales/get_near_me_tales_bloc.dart';
import 'package:storyv2/layers/presentation/tales/blocs/get_tale_intro/get_tale_intro_bloc.dart';
import 'package:storyv2/layers/presentation/tales/blocs/search_tales/search_tales_bloc.dart';
import 'package:storyv2/layers/presentation/tales/screens/all_tales_page.dart';
import 'package:storyv2/layers/presentation/tales/screens/near_me_page.dart';
import 'package:storyv2/layers/presentation/tales/screens/popular_page.dart';
import 'package:storyv2/layers/presentation/tales/screens/tale_intro_page.dart';

import '../../../../core/presentation/ui/spacer.dart';
import 'filtered_tales_page.dart';

class TalesScreen extends StatefulWidget {
  const TalesScreen({super.key});

  @override
  State<TalesScreen> createState() => _TalesScreenState();
}

class _TalesScreenState extends State<TalesScreen> {
  double _bottomSheetHeight = 0.6;
  Position? myLocation;
  GoogleMapController? _mapController;
  final DraggableScrollableController _draggableController = DraggableScrollableController();
  String currentTab = "all";

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
        if (mounted) {
          context.read<GetNearMeTalesBloc>().add(GetNearMeTalesEvent.request(
              params: NearMeTalesParams(
                  latitude: myLocation!.latitude.toString(),
                  longitude: myLocation!.longitude.toString(),
                  radius: "5")));
        }
      }
      setState(() {});
    });
    Geolocator.getPositionStream().listen((Position position) {
      myLocation = position;
    });
    super.initState();
  }

  changeTab(String tab) {
    setState(() {
      currentTab = tab;
    });
  }

  @override
  void dispose() {
    _draggableController.dispose();
    super.dispose();
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
            child: Stack(
              children: [
                SizedBox(
                  height:
                      (constraints.maxHeight - (constraints.maxHeight * _bottomSheetHeight)) + 20,
                  child: BlocBuilder<GetNearMeTalesBloc, GetNearMeTalesState>(
                    builder: (context, state) {
                      return BlocBuilder<GetDirectionBloc, GetDirectionState>(
                        builder: (context, getDirectionState) {
                          return LayoutBuilder(builder: (context, constraints) {
                            return GoogleMap(
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
                              onCameraIdle: () async {
                                if (_mapController == null) return;
                                LatLng center = await _mapController!.getLatLng(ScreenCoordinate(
                                  x: constraints.maxWidth ~/ 2,
                                  y: constraints.maxHeight ~/ 2,
                                ));
                                if (mounted) {
                                  context.read<GetNearMeTalesBloc>().add(
                                      GetNearMeTalesEvent.request(
                                          params: NearMeTalesParams(
                                              latitude: center.latitude.toString(),
                                              longitude: center.longitude.toString(),
                                              radius: "5")));
                                }
                              },
                              markers: state.whenOrNull(
                                    success: (tales) {
                                      return tales
                                          .map((tale) => Marker(
                                              markerId: MarkerId(tale.id.toString()),
                                              position: LatLng(tale.latitude!, tale.longitude!)))
                                          .toSet();
                                    },
                                  ) ??
                                  {},
                              polylines: getDirectionState.whenOrNull(
                                    success: (polylinePoints) {
                                      return {
                                        Polyline(
                                            polylineId: PolylineId("router"),
                                            points: polylinePoints,
                                            color: AppColors.purpleAccent,
                                            width: 5)
                                      };
                                    },
                                  ) ??
                                  {},
                              onMapCreated: (controller) {
                                _mapController = controller;
                                if (myLocation != null) {
                                  _mapController?.moveCamera(CameraUpdate.newCameraPosition(
                                      CameraPosition(
                                          target:
                                              LatLng(myLocation!.latitude, myLocation!.longitude),
                                          zoom: 18)));
                                }
                              },
                            );
                          });
                        },
                      );
                    },
                  ),
                ),
                Positioned.fill(
                    child: Transform.translate(
                  offset: Offset(0, -5),
                  child: Icon(
                    Icons.location_on,
                    color: Colors.blueAccent,
                  ),
                )),
                Positioned(
                    right: 10,
                    bottom: 30,
                    child: InkWell(
                      onTap: () {
                        if (myLocation != null) {
                          _mapController?.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
                              target: LatLng(myLocation!.latitude, myLocation!.longitude),
                              zoom: 18)));
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(UIConstants.xminPadding)),
                        padding: EdgeInsets.all(UIConstants.minPadding),
                        child: Icon(Icons.my_location),
                      ),
                    ))
              ],
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
                color: AppColors.white,
                child: DraggableScrollableSheet(
                    initialChildSize: _bottomSheetHeight,
                    minChildSize: 0.1,
                    snap: true,
                    maxChildSize: 0.9,
                    expand: false,
                    snapSizes: const [0.4, 0.6],
                    controller: _draggableController,
                    builder: (context, scrollController) {
                      return Column(
                        children: [
                          GestureDetector(
                            onVerticalDragUpdate: (details) {
                              final newSize = _draggableController.size -
                                  (details.primaryDelta! / MediaQuery.of(context).size.height);
                              _draggableController.jumpTo(newSize);
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: UIConstants.padding,
                                      vertical: UIConstants.minPadding),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: 120,
                                      height: 8,
                                      decoration: BoxDecoration(
                                          color: AppColors.whiteShade,
                                          borderRadius:
                                              BorderRadius.circular(UIConstants.minBorderRadius)),
                                    ),
                                  ),
                                ),
                                TabsWidget(
                                  changeTab: changeTab,
                                  currentTab: currentTab,
                                ),
                                // Gapper.vGap(),
                              ],
                            ),
                          ),
                          Flexible(
                            child: BlocBuilder<GetTaleIntroBloc, GetTaleIntroState>(
                                builder: (context, state) {
                              return state.whenOrNull(
                                    success: (tale) {
                                      if (tale == null) return null;
                                      return TaleIntroPage(
                                        currentLocation: myLocation,
                                        scrollController: scrollController,
                                        tale: tale,
                                      );
                                    },
                                  ) ??
                                  (currentTab == "all"
                                      ? AllTalesPage(scrollController: scrollController)
                                      : currentTab == "search"
                                          ? FilteredTalesPage(
                                              scrollController: scrollController,
                                              tabKey: currentTab,
                                            )
                                          : currentTab == "near_me"
                                              ? NearMePage(scrollController: scrollController)
                                              : currentTab == "popular"
                                                  ? PopularPage(scrollController: scrollController)
                                                  : Column(
                                                      children: [
                                                        Gapper.vmxGap(),
                                                        Text(
                                                          "No results",
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .bodyMedium
                                                              ?.copyWith(color: AppColors.grayDark),
                                                        ),
                                                      ],
                                                    ));
                            }),
                          )
                          // Flexible(
                          //     child: IndexedStack(
                          //   sizing: StackFit.expand,
                          //   index: currentTab == "all" ? 0 : 1,
                          //   children: [
                          //     AllTalesPage(scrollController: scrollController),
                          //     FilteredTalesPage(scrollController: scrollController),
                          //   ],
                          // )),
                        ],
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

class TalesTabWidget extends StatelessWidget {
  final String currentTab;
  final String tabKey;
  final Function(String)? onChange;
  const TalesTabWidget(
      {super.key, required this.currentTab, required this.tabKey, required this.onChange});

  String tabKeyToTitle(String text) {
    return text
        .split('_')
        .map((word) =>
            word.isNotEmpty ? word[0].toUpperCase() + word.substring(1).toLowerCase() : '')
        .join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onChange != null) {
          onChange!(tabKey);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: UIConstants.maxPadding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(42),
            color: currentTab == tabKey ? AppColors.dark : null,
            border: Border.all(color: currentTab == tabKey ? AppColors.dark : AppColors.gray)),
        child: Center(
            child: Text(
          tabKeyToTitle(tabKey),
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: currentTab == tabKey ? AppColors.white : null),
        )),
      ),
    );
  }
}

class TabsWidget extends StatefulWidget {
  final Function(String) changeTab;
  final String currentTab;
  const TabsWidget({super.key, required this.changeTab, required this.currentTab});

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: BlocBuilder<GetTaleIntroBloc, GetTaleIntroState>(
        builder: (context, state) {
          return ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: UIConstants.screenPadding),
            children: [
              BlocBuilder<GetTaleIntroBloc, GetTaleIntroState>(
                builder: (context, state) {
                  return state.whenOrNull(
                        success: (tale) {
                          return Padding(
                            padding: const EdgeInsets.only(right: UIConstants.minPadding),
                            child: InkWell(
                              onTap: () {
                                context
                                    .read<GetTaleIntroBloc>()
                                    .add(GetTaleIntroEvent.reInitiate());
                              },
                              child: Container(
                                  padding: EdgeInsets.only(
                                      left: UIConstants.maxPadding, right: UIConstants.maxPadding),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(42),
                                      border: Border.all(color: AppColors.gray)),
                                  child: Icon(Icons.arrow_back)),
                            ),
                          );
                        },
                      ) ??
                      SizedBox();
                },
              ),
              InkWell(
                onTap: () {
                  widget.changeTab("search");
                },
                child: AnimatedContainer(
                  width: (widget.currentTab == "search")
                      ? (MediaQuery.of(context).size.width - (UIConstants.screenPadding * 2))
                      : null,
                  duration: Duration(seconds: 300),
                  padding:
                      EdgeInsets.only(left: UIConstants.maxPadding, right: UIConstants.maxPadding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(42),
                      border: Border.all(color: AppColors.gray)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.search),
                      if (widget.currentTab == "search")
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(left: UIConstants.xminPadding),
                          child: BlocBuilder<SearchTalesBloc, SearchTalesState>(
                            builder: (context, state) {
                              return TextField(
                                controller: _controller,
                                onEditingComplete: () {
                                  context
                                      .read<SearchTalesBloc>()
                                      .add(SearchTalesEvent.request(searchText: _controller.text));
                                  FocusScope.of(context).unfocus();
                                },
                                decoration: InputDecoration(
                                    hintText: "Search", isDense: true, border: InputBorder.none),
                              );
                            },
                          ),
                        )),
                      if (widget.currentTab == "search")
                        InkWell(
                          onTap: () {
                            widget.changeTab("all");
                          },
                          child: SizedBox(width: 38, height: 38, child: Icon(Icons.close)),
                        )
                    ],
                  ),
                ),
              ),
              if (widget.currentTab != "search") ...[
                Gapper.hmGap(),
                TalesTabWidget(
                  onChange: widget.changeTab,
                  currentTab: widget.currentTab,
                  tabKey: "all",
                ),
                Gapper.hmGap(),
                TalesTabWidget(
                  onChange: widget.changeTab,
                  currentTab: widget.currentTab,
                  tabKey: "near_me",
                ),
                Gapper.hmGap(),
                TalesTabWidget(
                  onChange: widget.changeTab,
                  currentTab: widget.currentTab,
                  tabKey: "visited",
                ),
                Gapper.hmGap(),
                TalesTabWidget(
                  onChange: widget.changeTab,
                  currentTab: widget.currentTab,
                  tabKey: "popular",
                ),
                Gapper.hmGap(),
                TalesTabWidget(
                  onChange: widget.changeTab,
                  currentTab: widget.currentTab,
                  tabKey: "music",
                ),
                Gapper.hmGap(),
                TalesTabWidget(
                  onChange: widget.changeTab,
                  currentTab: widget.currentTab,
                  tabKey: "food",
                ),
              ]
            ],
          );
        },
      ),
    );
  }
}
