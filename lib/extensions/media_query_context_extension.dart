import 'dart:math' as math;

import 'package:flutter/material.dart';

const double kMaxScreenWidth = 700;
const double kLargeScreenWidth = 960;
const double kMediumScreenHeight = 720;

extension MediaQueryDataExtension on MediaQueryData {
  bool get isLargeScreen => size.width > kLargeScreenWidth;
  bool get isTallScreen => size.height > kMediumScreenHeight;

  double get fullSizeImageScreenWidth => math.min(size.width, kLargeScreenWidth) / 1.3;

  double get filterBottomSheetHeight => isTallScreen ?  kMediumScreenHeight / 2 : math.min(size.height, kMediumScreenHeight / 2.5) - 32;
}
