import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

extension LottieExt on String {
  LottieBuilder lottie({
    double? width = 100,
    double? height = 100,
    bool repeat = true,
    bool reverse = false,
    bool animate = true,
    BoxFit fit = BoxFit.contain,
  }) {
    return Lottie.asset(
      this,
      width: width,
      height: height,
      repeat: repeat,
      reverse: reverse,
      animate: animate,
      fit: fit,
    );
  }
}
