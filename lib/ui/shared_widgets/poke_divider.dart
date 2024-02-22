import 'package:flutter/material.dart';

import '../../extensions/build_context_extension.dart';

const kThicknessThick = 0.5;
const kThicknessThin = 0.2;

class PokeDivider extends StatelessWidget {
  PokeDivider({
    super.key,
    this.indent,
    this.thickness,
  });

  final double? indent;
  final double? thickness;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: thickness ?? kThicknessThick,
      indent: indent,
      color: context.colors.onSurface,
    );
  }
}
