import 'package:barbar_app/core/extensions/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class WCachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const WCachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final image = CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder:
          (context, url) => Center(
            child: CircularProgressIndicator(
              strokeCap: StrokeCap.round,
              color: Colors.indigo,
            ),
          ),
      errorWidget: (context, url, error) {
        print("Image Error: $error");
        return SizedBox(
          width: width,
          height: height,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: Colors.grey.shade300,
            ),
            child: Icon(Icons.error, color: Colors.white),
          ),
        );
      },
    );

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(10.o),
        child: image,
      );
    } else {
      return image;
    }
  }
}
