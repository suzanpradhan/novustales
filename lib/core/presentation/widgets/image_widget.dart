import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:shimmer/shimmer.dart';

import '../../api/api_paths.dart';
import '../../constants/app_colors.dart';

class ImageWidget extends StatelessWidget {
  final String? imageUrl;
  final String? blurhash;
  final Color? placeholderColor;
  final bool hasShimmer;
  final Widget? overlay;
  final Widget? placeholder;
  final BoxFit fit;
  const ImageWidget(
      {super.key,
      this.imageUrl,
      this.placeholder,
      this.overlay,
      this.placeholderColor,
      this.blurhash,
      this.fit = BoxFit.cover,
      this.hasShimmer = false});

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return placeholder ??
          ((blurhash != null)
              ? BlurHash(hash: blurhash!)
              : hasShimmer
                  ? Container(
                      color: placeholderColor ?? AppColors.whiteShade,
                    )
                  : const SizedBox());
    }
    return CachedNetworkImage(
      imageUrl: imageUrl!.startsWith("http")
          ? imageUrl!
          : "${ApiPaths.storageUrl}$imageUrl",
      fit: fit,
      imageBuilder: (overlay == null)
          ? null
          : (context, imageProvider) {
              if (kDebugMode) {
                try {
                  CachedNetworkImage.evictFromCache(imageUrl!.startsWith("http")
                      ? imageUrl!
                      : "${ApiPaths.storageUrl}$imageUrl");
                } catch (e) {}
              }
              return Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: imageProvider, fit: fit),
                  ),
                  child: overlay);
            },
      placeholder: (context, url) {
        return placeholder ??
            ((blurhash != null)
                ? Image(
                    image: BlurHashImage(
                      blurhash!,
                    ),
                    fit: BoxFit.cover,
                  )
                : (hasShimmer
                    ? Shimmer.fromColors(
                        baseColor: placeholderColor != null
                            ? placeholderColor!.withOpacity(0.5)
                            : AppColors.whiteShade.withOpacity(0.5),
                        highlightColor:
                            placeholderColor ?? AppColors.whiteShade,
                        child: Container(
                          color: Colors.white,
                        ))
                    : const SizedBox()));
      },
      errorWidget: (context, url, error) {
        return placeholder ??
            ((blurhash != null)
                ? BlurHash(hash: blurhash!)
                : hasShimmer
                    ? Container(
                        color: placeholderColor ?? AppColors.whiteShade,
                      )
                    : const SizedBox());
      },
    );
  }
}
