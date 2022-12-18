import 'dart:math' as math;

import 'package:flutter/material.dart';

const double kMaxScreenWidth = 700;
const double kMediumScreenWidth = 960;

extension MediaQueryDataExtension on MediaQueryData {
  bool get isLargeScreen => size.width > kMediumScreenWidth;

  double get fullSizeImageScreenWidth => math.min(size.width, kMediumScreenWidth) / 1.3;
}
