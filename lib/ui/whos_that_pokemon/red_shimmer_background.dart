import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RedShimmerBackground extends StatelessWidget {
  const RedShimmerBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final white = Colors.white.withOpacity(0.2);
    final yellow = Colors.yellow.withOpacity(0.2);
    return const ColoredBox(
      color: Colors.red,
    )
        .animate(
          onPlay: (controller) => controller.repeat(),
        )
        .shimmer(
          angle: 2,
          duration: 800.ms,
          color: white,
          size: 0.2,
        )
        .animate(
          onPlay: (controller) => controller.repeat(),
        )
        .shimmer(
          angle: 2,
          duration: 1600.ms,
          color: white,
          size: 0.4,
        )
        .animate(
          onPlay: (controller) => controller.repeat(),
        )
        .shimmer(
          angle: 2,
          duration: 2400.ms,
          color: yellow,
          size: 0.6,
        )
        .animate(
          onPlay: (controller) => controller.repeat(),
        )
        .shimmer(
          angle: 2,
          duration: 3200.ms,
          color: yellow,
          size: 0.8,
        );
  }
}
