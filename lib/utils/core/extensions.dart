import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

SvgPicture addSvgImage(
  String imageAssets, {
  double? imageWidth,
  double? imageHeight,
  Color? color,
}) {
  return SvgPicture.asset(
    imageAssets,
    width: imageWidth,
    height: imageHeight,
    colorFilter:
        color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
  );
}
