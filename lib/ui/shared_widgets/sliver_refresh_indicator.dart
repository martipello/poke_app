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
      child: CustomScrollView(
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
