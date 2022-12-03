import 'package:flutter/material.dart';

import '../../theme/base_theme.dart';

class PokeDivider extends StatelessWidget {
  PokeDivider({
    super.key,
    this.indent,
  });

  final double? indent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      indent: indent,
      color: colors(context).textOnForeground,
    );
  }
}
