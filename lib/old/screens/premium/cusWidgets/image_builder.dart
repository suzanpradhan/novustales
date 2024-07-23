import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;
import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';

class ImageBuilder extends StatelessWidget {
  final String imageUrl;
  final ImageProvider? imageProvider;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final bool circular;
  final bool showErrorBorder;

  const ImageBuilder({
    super.key,
    this.imageUrl = "",
    this.imageProvider,
    this.width,
    this.height,
    this.fit,
    this.borderRadius,
    this.circular = false,
    this.showErrorBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    late Widget child;

    if (imageUrl.isNotEmpty) {
      child = CachedNetworkImage(
        height: height,
        width: width,
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        placeholder: (context, url) => const CupertinoActivityIndicator(),
        errorWidget: (context, url, error) {
          return Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              border: showErrorBorder ? Border.all(color: storyBrown) : null,
              shape: circular ? BoxShape.circle : BoxShape.rectangle,
            ),
            child: Icon(Icons.error, color: solidRed, size: 12),
          );
        },
      );
    } else if (imageProvider != null) {
      child = Image(
        width: width,
        height: height,
        image: imageProvider!,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return Center(child: CupertinoActivityIndicator());
        },
      );
    } else {
      child = SizedBox(
        width: width,
        height: height,
        child: Center(child: CupertinoActivityIndicator()),
      );
    }

    if (circular) {
      child = ClipOval(
        child: child,
      );
    } else if (borderRadius != null) {
      child = ClipRRect(
        borderRadius: borderRadius!,
        child: child,
      );
    }

    return child;
  }
}
