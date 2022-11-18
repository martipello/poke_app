import 'package:flutter/material.dart';

import '../../extensions/build_context_extension.dart';
import '../../theme/base_theme.dart';
import '../../theme/poke_app_text.dart';

class PokemonTableRowInfo {
  PokemonTableRowInfo(
    this.key, {
    this.value,
    this.iconData,
    this.labelTextAlign,
    this.child,
    this.borderColor,
    this.isConstrained = false,
  }) : assert (value != null || child != null);

  final String key;
  final String? value;
  final IconData? iconData;
  final Widget? child;
  final Color? borderColor;
  final TextAlign? labelTextAlign;
  final bool isConstrained;
}

class PokemonTable extends StatelessWidget {
  const PokemonTable({
    required this.wordskiiTableRowInfoList,
    this.tableTitle,
    this.tableTitleTextStyle,
  });

  final String? tableTitle;
  final TextStyle? tableTitleTextStyle;
  final List<PokemonTableRowInfo> wordskiiTableRowInfoList;

  @override
  Widget build(BuildContext context) {
    return wordskiiTableRowInfoList.any((element) => element.value?.isNotEmpty == true || element.child != null)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (tableTitle != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildBookingSubTitle(
                      tableTitle,
                      context,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              Table(
                columnWidths: {
                  0: const IntrinsicColumnWidth(),
                  1: const IntrinsicColumnWidth(),
                  2: const FlexColumnWidth(1),
                },
                children: [
                  ...wordskiiTableRowInfoList.where((element) => element.value?.isNotEmpty == true || element.child != null).map(
                    (e) {
                      return _buildTableRow(
                        context,
                        e.key,
                        value: e.value,
                        icon: e.iconData,
                        child: e.child,
                        borderColor: e.borderColor,
                        labelTextAlign: e.labelTextAlign,
                        isConstrained: e.isConstrained,
                      );
                    },
                  ),
                ],
              ),
            ],
          )
        : const SizedBox();
  }

  TableRow _buildTableRow(
    BuildContext context,
    String? key, {
    String? value,
    IconData? icon,
    VoidCallback? onPressed,
    Widget? child,
    Color? borderColor,
    TextAlign? labelTextAlign,
    bool isConstrained = false,
  }) {
    return TableRow(
      children: [
        _buildTableRowIcon(icon, context),
        _buildTableRowText(key),
        if (!isConstrained)
          _buildTableRowContent(
            onPressed,
            borderColor,
            child,
            value,
            labelTextAlign,
          ),
        if (isConstrained)
          _buildConstrainedTableRowContent(
            context,
            onPressed,
            borderColor,
            child,
            value,
            labelTextAlign,
          ),
      ],
    );
  }

  Widget _buildConstrainedTableRowContent(
    BuildContext context,
    VoidCallback? onPressed,
    Color? borderColor,
    Widget? child,
    String? value,
    TextAlign? labelTextAlign,
  ) {
    final screenMeasure = (context.screenWidth / 5) * 3;
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: screenMeasure),
        child: _buildTableRowContent(
          onPressed,
          borderColor,
          child,
          value,
          labelTextAlign,
        ),
      ),
    );
  }

  GestureDetector _buildTableRowContent(
    VoidCallback? onPressed,
    Color? borderColor,
    Widget? child,
    String? value,
    TextAlign? labelTextAlign,
  ) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: borderColor != null ? const EdgeInsets.only(bottom: 16) : const EdgeInsets.all(0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: borderColor ?? Colors.transparent,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: child ??
                      Text(
                        value ?? '',
                        style: PokeAppText.body4Style,
                        textAlign: labelTextAlign ?? TextAlign.start,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableRowText(String? key) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        right: 8,
      ),
      child: Row(
        children: [
          Flexible(
            child: Text(
              key?.trim() ?? '',
              style: PokeAppText.body3Style,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableRowIcon(
    IconData? icon,
    BuildContext context,
  ) {
    if (icon == null) {
      return const SizedBox();
    }
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        right: 8,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 18,
            color: colors(context).textOnForeground,
          ),
        ],
      ),
    );
  }

  Widget _buildBookingSubTitle(String? value, BuildContext context) {
    return Text(
      value ?? '',
      style: tableTitleTextStyle ??
          PokeAppText.body1Style.copyWith(
            color: colors(context).textOnForeground,
          ),
    );
  }
}
