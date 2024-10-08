import 'package:flutter/material.dart';

import '../../extensions/build_context_extension.dart';

class SliverRefreshIndicator extends StatelessWidget {
  const SliverRefreshIndicator({
    required this.onRefresh,
    required this.sliver,
    this.padding,
    this.scrollController,
  });

  final VoidCallback onRefresh;
  final ScrollController? scrollController;
  final Widget sliver;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        onRefresh,
      ),
      color: context.colors.onSurface,
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverPadding(
            padding: padding ?? const EdgeInsets.all(8),
            sliver: sliver,
          ),
        ],
      ),
    );
  }
}
