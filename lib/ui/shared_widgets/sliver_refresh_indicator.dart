import 'package:flutter/material.dart';

class SliverRefreshIndicator extends StatelessWidget {
  const SliverRefreshIndicator({
    required this.onRefresh,
    required this.sliver,
    this.padding,
  });

  final VoidCallback onRefresh;
  final Widget sliver;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        onRefresh,
      ),
      child: SafeArea(
        top: false,
        bottom: false,
        child: Builder(
          builder: (nestedScrollViewContext) {
            return CustomScrollView(
              slivers: [
                SliverOverlapInjector(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                    nestedScrollViewContext,
                  ),
                ),
                SliverPadding(
                  padding: padding ?? const EdgeInsets.all(8),
                  sliver: sliver,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
