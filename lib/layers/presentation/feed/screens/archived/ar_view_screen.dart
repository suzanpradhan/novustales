import 'package:ar_location_viewer/ar_location_viewer.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:storyv2/layers/data/near_me_mocks.dart';
import 'package:uuid/uuid.dart';

import 'annotation_viewer.dart';
import 'annotations.dart';

class ARViewScreen extends StatefulWidget {
  final Position position;
  const ARViewScreen({super.key, required this.position});

  @override
  State<ARViewScreen> createState() => _ARViewScreenState();
}

class _ARViewScreenState extends State<ARViewScreen> {
  List<Annotation> annotations = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // annotations = [
    //   Annotation(
    //       uid: const Uuid().v1(),
    //       position: getRandomLocation(
    //         widget.position.latitude,
    //         widget.position.longitude,
    //         0.015,
    //         0.015,
    //       ),
    //       type: getRandomAnnotation()),
    //   Annotation(
    //       uid: const Uuid().v1(),
    //       position: getRandomLocation(
    //         27.726368,
    //         85.322031,
    //         0.015,
    //         0.015,
    //       ),
    //       type: getRandomAnnotation())
    // ];
  }

  @override
  Widget build(BuildContext context) {
    return ArLocationWidget(
      annotations: nearMeMockedItems
          .map((item) => Annotation(
              uid: const Uuid().v1(),
              position: getRandomLocation(
                widget.position.latitude,
                widget.position.longitude,
                0.015,
                0.015,
              ),
              item: item))
          .toList(),
      showDebugInfoSensor: false,
      annotationHeight: 320,
      maxVisibleDistance: 20000,
      annotationViewerBuilder: (context, annotation) {
        return AnnotationViewer(
          key: ValueKey(annotation.uid),
          annotation: annotation as Annotation,
        );
      },
      onLocationChange: (Position position) {
        // Future.delayed(const Duration(seconds: 5), () {
        //   annotations = fakeAnnotation(position: position, numberMaxPoi: 50);
        //   setState(() {});
        // });
      },
    );
  }
}
