import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../core/constant/assets.dart';

class MovieImageNetwork extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  const MovieImageNetwork({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(4)),
      child: imageUrl.isEmpty
          ? Image.asset(
              imageNotFound,
              fit: fit ?? BoxFit.fill,
              width: height,
              height: width,
            )
          : CachedNetworkImage(
              width: width,
              height: height,
              imageUrl: imageUrl,
              fit: fit ?? BoxFit.fill,
              errorWidget: (context, url, error) {
                return Image.asset(
                  imageNotFound,
                  fit: fit ?? BoxFit.fill,
                  width: height,
                  height: width,
                );
              },
              placeholder: (context, url) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.grey,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
