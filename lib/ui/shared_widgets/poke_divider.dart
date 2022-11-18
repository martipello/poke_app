import 'package:flutter/material.dart';

import '../../theme/base_theme.dart';

class PokeDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: colors(context).textOnForeground,
    );
  }
}
