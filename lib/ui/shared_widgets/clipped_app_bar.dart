import 'dart:io';

import 'package:flutter/material.dart';

import '../../extensions/build_context_extension.dart';
import '../../utils/irregular_trapezium_clipper.dart';

class ClippedAppBar extends StatelessWidget {
  const ClippedAppBar({
    Key? key,
    this.clipColor,
    this.menuButton,
    this.onBackTap,
  }) : super(key: key);

  final Color? clipColor;
  final Widget? menuButton;
  final VoidCallback? onBackTap;

  @override
  Widget build(BuildContext context) {
    return _buildEmbeddedAppBar(context);
  }

  Widget _buildEmbeddedAppBar(
    BuildContext context,
  ) {
    return Stack(
      children: [
        _buildAppBarClip(),
        _buildAppBarBackButton(context),
        _buildAppBarMenuButton(context),
      ],
    );
  }

  Widget _buildAppBarClip() {
    return ClipPath(
      clipper: IrregularTrapeziumClipper(),
      child: Container(
        height: kToolbarHeight,
        decoration: BoxDecoration(
          color: clipColor ?? Colors.red,
        ),
      ),
    );
  }

  Widget _buildAppBarBackButton(
    BuildContext context,
  ) {
    if (onBackTap == null) {
      return const SizedBox();
    }
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: Icon(
          Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
          color: context.colors.surface,
        ),
        onPressed: onBackTap,
      ),
    );
  }

  Widget _buildAppBarMenuButton(
    BuildContext context,
  ) {
    return Align(
      alignment: Alignment.centerRight,
      child: menuButton,
    );
  }
}
