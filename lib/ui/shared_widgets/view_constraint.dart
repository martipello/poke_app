import 'package:flutter/material.dart';

import '../../extensions/build_context_extension.dart';
import '../../extensions/media_query_context_extension.dart';

class ViewConstraint extends StatelessWidget {
  ViewConstraint({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(),
        constraints: const BoxConstraints(
          maxWidth: kMaxScreenWidth,
        ),
        child: child,
      ),
    );
  }
}
