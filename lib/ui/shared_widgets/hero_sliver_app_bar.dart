import 'package:flutter/material.dart';

import 'view_constraint.dart';

class HeroSliverAppBar extends StatelessWidget {
  const HeroSliverAppBar({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: false,
      expandedHeight: 150,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Padding(
          padding: const EdgeInsets.only(top: 32),
          child: ViewConstraint(
            child: child,
          ),
        ),
      ),
    );
  }
}
