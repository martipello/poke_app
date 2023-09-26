import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RedShimmerBackground extends StatelessWidget {
  const RedShimmerBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: double.infinity,
    )
        .animate(
          onPlay: (controller) => controller.repeat(),
        )
        .shimmer(
          angle: 2,
          duration: 800.ms,
          color: Colors.white.withOpacity(0.2),
          size: 0.2,
        )
        .animate(
          onPlay: (controller) => controller.repeat(),
        )
        .shimmer(
          angle: 2,
          duration: 1600.ms,
          color: Colors.white.withOpacity(0.2),
          size: 0.4,
        )
        .animate(
          onPlay: (controller) => controller.repeat(),
        )
        .shimmer(
          angle: 2,
          duration: 2400.ms,
          color: Colors.yellow.withOpacity(0.2),
          size: 0.6,
        )
        .animate(
          onPlay: (controller) => controller.repeat(),
        )
        .shimmer(
          angle: 2,
          duration: 3200.ms,
          color: Colors.yellow.withOpacity(0.2),
          size: 0.8,
        );
  }
}
