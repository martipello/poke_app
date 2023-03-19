import 'package:flutter/material.dart';

import '../../theme/base_theme.dart';

class RoundedCard extends StatelessWidget {
  RoundedCard({
    Key? key,
    required this.child,
    this.onTap,
    this.borderColor,
  }) : super(key: key);

  final Widget child;
  final Color? borderColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        cardColor: colors(context).cardBackground,
      ),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: borderColor == null
              ? BorderSide.none
              : BorderSide(
                  color: borderColor!,
                  width: 2,
                ),
        ),
        clipBehavior: Clip.hardEdge,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
