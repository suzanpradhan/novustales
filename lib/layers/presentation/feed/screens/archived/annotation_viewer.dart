import 'package:flutter/material.dart';

import 'annotations.dart';
import 'story_view_screen.dart';

class AnnotationViewer extends StatelessWidget {
  const AnnotationViewer({
    super.key,
    required this.annotation,
  });

  final Annotation annotation;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return StoryViewScreen(nearMeItem: annotation.item);
        }));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 270,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white, width: 3),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 4))
                ],
                color: Colors.black,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(annotation.item.thumbnail))),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            annotation.item.title,
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white),
          ),
          Text(
            '${annotation.distanceFromUser.toInt()} m',
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 14,
                color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget typeFactory(AnnotationType type) {
    IconData iconData = Icons.ac_unit_outlined;
    Color color = Colors.teal;
    switch (type) {
      case AnnotationType.testPin:
        iconData = Icons.location_on;
        color = Colors.red;
        break;
    }
    return Icon(
      iconData,
      size: 40,
      color: color,
    );
  }
}
