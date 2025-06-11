import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension SvgExt on String {
  SvgPicture svg({
    Color? color,
    double? width=20,
    double? height=20,
  }) {
    return SvgPicture.asset(
      this,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }
}
