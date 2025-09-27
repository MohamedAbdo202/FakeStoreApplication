import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramakerz/core/design_system/extentions.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    required this.height,
    required this.width,
    required this.imageUrl,
    this.fit = BoxFit.scaleDown,
    super.key,
    this.raduis = 0,
  });

  final double height;
  final double width;
  final String imageUrl;
  final BoxFit fit;
  final double raduis;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusDirectional.circular(raduis),
      child: CachedNetworkImage(
        height: height.h,
        width: width.w,
        fit: fit,
        imageUrl: imageUrl,
        placeholder: (context, url) =>
            Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) =>
            Icon(Icons.error, color: context.colorScheme.primary),
      ),
    );
  }
}
