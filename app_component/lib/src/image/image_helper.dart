import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

///
/// @date: 2022/8/2 17:11
/// @author: Sensi
/// @remark:
///

/// Builder function to create an image widget. The function is called after
/// the ImageProvider completes the image loading.
typedef ImageWidgetBuilder = Widget Function(
  BuildContext context,
  ImageProvider imageProvider,
);

/// Builder function to create a placeholder widget. The function is called
/// once while the ImageProvider is loading the image.
typedef PlaceholderWidgetBuilder = Widget Function(
  BuildContext context,
  String url,
);

/// Builder function to create an error widget. This builder is called when
/// the image failed loading, for example due to a 404 NotFound exception.
typedef LoadingErrorWidgetBuilder = Widget Function(
  BuildContext context,
  String url,
  dynamic error,
);

class ImageHelper {
  static Widget load(
    String value, {
    Key? key,
    double? width,
    double? height,
    double? size,
    BoxFit fit = BoxFit.contain,
    Color? color,
    BlendMode? colorBlendMode,
    Widget? errorPlaceholder,
    AlignmentGeometry alignment = Alignment.center,
    String? package,

    /// The following is about cache configuration
    bool enableCache = false,
    PlaceholderWidgetBuilder? placeholderBuilder,
    ImageWidgetBuilder? imageBuilder,
  }) {
    if (value.lastIndexOf('.svg') != -1) {
      return SvgPicture.asset(
        value,
        key: key,
        width: size ?? width,
        height: size ?? height,
        fit: fit,
        color: color,
        colorBlendMode: colorBlendMode ?? BlendMode.srcIn,
        alignment: alignment,
        package: package,
      );
    } else if (value.startsWith('http')) {
      if (enableCache) {
        return CachedNetworkImage(
            key: key,
            imageUrl: value,
            height: height,
            width: width,
            fit: fit,
            color: color,
            colorBlendMode: colorBlendMode,
            alignment: alignment is Alignment ? alignment : Alignment.center,

            /// Optional builder to further customize the display of the image.
            imageBuilder: imageBuilder,

            /// Widget displayed while the target [imageUrl] is loading
            placeholder: placeholderBuilder,

            /// Widget displayed while the target [imageUrl] failed loading.
            errorWidget: errorPlaceholder == null ? null : (context, url, error) => errorPlaceholder);
      }
      return Image.network(
        value,
        key: key,
        width: size ?? width,
        height: size ?? height,
        fit: fit,
        color: color,
        colorBlendMode: colorBlendMode,
        errorBuilder: (context, error, stack) => SizedBox(height: height, width: width, child: errorPlaceholder),
        alignment: alignment,
      );
    } else if (value.startsWith('assets')) {
      return Image.asset(
        value,
        key: key,
        width: size ?? width,
        height: size ?? height,
        fit: fit,
        color: color,
        colorBlendMode: colorBlendMode,
        errorBuilder: (context, error, stack) => SizedBox(height: height, width: width, child: errorPlaceholder),
        alignment: alignment,
        package: package,
      );
    } else {
      return Image.file(File(value),
          key: key,
          width: size ?? width,
          height: size ?? height,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode,
          errorBuilder: (context, error, stack) => SizedBox(height: height, width: width, child: errorPlaceholder),
          alignment: alignment);
    }
  }

  static Widget actionLoad(
    String assetName, {
    Key? key,
    Function? onPressed,
    double? width,
    double? height,
    double? size,
    BoxFit fit = BoxFit.contain,
    Color? color,
    BlendMode? colorBlendMode,
    AlignmentGeometry alignment = Alignment.center,
    String? package,
  }) {
    return GestureDetector(
        onTap: () => onPressed?.call(),
        child: load(
          assetName,
          key: key,
          width: size ?? width,
          height: size ?? height,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode,
          alignment: alignment,
          package: package,
        ));
  }
}
