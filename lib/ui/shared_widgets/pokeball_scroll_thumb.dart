import 'package:flexible_scrollbar/flexible_scrollbar.dart';
import 'package:flutter/material.dart';

import '../../extensions/build_context_extension.dart';

class PokeballScrollThumb extends StatelessWidget {
  const PokeballScrollThumb({Key? key, required this.scrollbarInfo}) : super(key: key);

  final ScrollbarInfo scrollbarInfo;

  @override
  Widget build(BuildContext context) {
    return _buildScrollThumbHolder(
      context,
      scrollbarInfo,
    );
  }

  Widget _buildScrollThumbHolder(
    BuildContext context,
    ScrollbarInfo scrollInfo,
  ) {
    final offsetY = _calculateScrollOffset(
      context,
      scrollInfo,
    );

    return Stack(
      children: [
        SizedBox(
          height: scrollInfo.thumbMainAxisSize,
          width: 24,
        ),
        AnimatedPositioned(
          duration: const Duration(
            milliseconds: 30,
          ),
          top: offsetY,
          child: _buildScrollThumb(
            context,
            scrollInfo,
          ),
        ),
      ],
    );
  }

  Widget _buildScrollThumb(
    BuildContext context,
    ScrollbarInfo scrollInfo,
  ) {
    final turns = scrollInfo.thumbMainAxisOffset.toInt().toDouble();
    return AnimatedRotation(
      duration: const Duration(
        milliseconds: 100,
      ),
      turns: turns > 0 ? -(turns / 100) : -turns,
      child: Image.asset(
        'assets/images/pokeball.png',
        height: 24,
        width: 24,
      ),
    );
  }

  double _calculateScrollOffset(
    BuildContext context,
    ScrollbarInfo scrollInfo,
  ) {
    final thumbMainAxisSize = scrollInfo.thumbMainAxisSize;
    final thumbMainAxisOffset = scrollInfo.thumbMainAxisOffset;
    final screenHeight = context.screenHeight;
    final statusBarHeight = context.statusBarHeight;

    final percentage = (thumbMainAxisOffset / ((screenHeight) - (kToolbarHeight + statusBarHeight + 100))).clamp(
      0.1,
      0.5,
    );
    final offsetY = (thumbMainAxisSize * percentage)
        .clamp(
          kToolbarHeight,
          thumbMainAxisSize,
        )
        .toDouble();
    return offsetY;
  }
}
