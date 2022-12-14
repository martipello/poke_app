import 'package:flutter/material.dart';

const double kMaxScreenWidth = 900;
const double kMediumScreenWidth = 960;

extension MediaQueryDataExtension on MediaQueryData {
  bool get isLargeScreen => size.width > kMediumScreenWidth;
}

class ViewConstraints extends StatelessWidget {
  ViewConstraints({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kMaxScreenWidth,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(),
      constraints: const BoxConstraints(
        maxWidth: kMaxScreenWidth,
      ),
      child: child,
    );
  }
}
