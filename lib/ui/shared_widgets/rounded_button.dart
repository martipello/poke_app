import 'package:flutter/material.dart';

import '../../extensions/build_context_extension.dart';
import '../../theme/poke_app_text.dart';
import 'loading_widget.dart';
import 'pokeball_loading_widget.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    this.onPressed,
    this.fillColor,
    this.isLoading = false,
    this.usePokeballLoading = false,
    this.isFilled = true,
    this.disableShadow = false,
    required this.label,
    this.leadingIcon,
    this.trailingIcon,
    this.outlineColor,
    this.loadingColor,
    this.textStyle,
    this.elevation,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Color? fillColor;
  final Color? outlineColor;
  final Color? loadingColor;
  final bool isLoading;
  final bool usePokeballLoading;
  final bool isFilled;
  final bool disableShadow;
  final double? elevation;
  final String label;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: TextButton(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.all(
            _getTextStyle(context),
          ),
          elevation: WidgetStateProperty.all(
            onPressed != null && !disableShadow ? elevation ?? 2 : 0,
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(
              horizontal: 16,
            ),
          ),
          backgroundColor: WidgetStateProperty.all(
            _getFillColor(context),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
          side: WidgetStateProperty.all(
            BorderSide(
              color: _getOutlineColor(context),
              width: 2,
            ),
          ),
          overlayColor: WidgetStateProperty.all(Colors.black12),
        ),
        onPressed: _handleOnPressed(),
        child: Builder(
          builder: (context) {
            if (isLoading) return _buildLoading(context);
            return _buildButtonContent(context);
          },
        ),
      ),
    );
  }

  Widget _buildButtonContent(BuildContext context) {
    final textStyle = _getTextStyle(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (leadingIcon != null)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              leadingIcon,
              color: textStyle.color,
              size: textStyle.fontSize! + 2,
            ),
          ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 2,
            ),
            child: Text(
              label,
              style: textStyle,
            ),
          ),
        ),
        if (trailingIcon != null)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(
              trailingIcon,
              color: textStyle.color,
              size: textStyle.fontSize! + 2,
            ),
          ),
      ],
    );
  }

  Color _getFillColor(BuildContext context) {
    if (isFilled && onPressed != null) {
      return fillColor ?? context.colors.secondary;
    } else if (!isFilled && onPressed != null) {
      return context.colors.onSecondary;
    } else if (!isFilled && onPressed == null) {
      return context.colors.onSecondary;
    } else {
      return context.colors.surface;
    }
  }

  Color _getOutlineColor(BuildContext context) {
    if (onPressed != null) {
      return outlineColor ?? fillColor ?? context.colors.secondary;
    } else {
      return context.colors.onSurface;
    }
  }

  TextStyle _getTextStyle(BuildContext context) {
    final myTextStyle = textStyle;
    if (myTextStyle != null) {
      return myTextStyle;
    }
    if (isFilled && onPressed != null) {
      return PokeAppText.subtitle4Style.copyWith(color: context.colors.onSecondary);
    } else if (!isFilled && onPressed != null) {
      return PokeAppText.subtitle4Style.copyWith(color: context.colors.secondary);
    } else if (isFilled && onPressed == null) {
      return PokeAppText.subtitle4Style.copyWith(color: context.colors.onSurface);
    } else {
      return PokeAppText.subtitle4Style.copyWith(color: context.colors.surface);
    }
  }

  Color _getLoadingColor(BuildContext context) {
    if (isFilled && onPressed != null) {
      return context.colors.onSecondary;
    } else if (!isFilled && onPressed != null) {
      return context.colors.secondary;
    } else if (isFilled && onPressed == null) {
      return context.colors.onSurface;
    } else {
      return context.colors.surface;
    }
  }

  Widget _buildLoading(BuildContext context) {
    if(usePokeballLoading) {
      return const SizedBox(
        height: 18,
        width: 18,
        child: PokeballLoadingWidget(),
      );
    }
    return SizedBox(
      height: 16,
      width: 16,
      child: LoadingWidget(
        width: 2,
        valueColor: loadingColor ?? _getLoadingColor(context),
      ),
    );
  }

  VoidCallback? _handleOnPressed() {
    if (!isLoading) {
      return onPressed;
    } else {
      return null;
    }
  }
}
