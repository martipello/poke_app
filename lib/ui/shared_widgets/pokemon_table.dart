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
  }) : assert(value != null || child != null);

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
                  ...wordskiiTableRowInfoList
                      .where(
                    (element) => element.value?.isNotEmpty == true || element.child != null,
                  )
                      .map(
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
                        isFirst: e ==
                            wordskiiTableRowInfoList
                                .where(
                                  (element) => element.value?.isNotEmpty == true || element.child != null,
                                )
                                .first,
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
    bool isFirst = false,
  }) {
    return TableRow(
      children: [
        _buildTableRowIcon(icon, context),
        _buildTableRowText(key, isFirst),
        if (!isConstrained)
          _buildTableRowContent(
            onPressed,
            borderColor,
            child,
            value,
            labelTextAlign,
            isFirst,
          ),
        if (isConstrained)
          _buildConstrainedTableRowContent(
            context,
            onPressed,
            borderColor,
            child,
            value,
            labelTextAlign,
            isFirst,
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
    bool isFirst,
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
          isFirst,
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
    bool isFirst,
  ) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: borderColor != null ? const EdgeInsets.only(bottom: 16) : EdgeInsets.zero,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: borderColor ?? Colors.transparent,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 8,
                    right: 8,
                    bottom: 8,
                    top: isFirst ? 0 : 8,
                  ),
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

  Widget _buildTableRowText(String? key, bool isFirst) {
    return Padding(
      padding: EdgeInsets.only(
        top: isFirst ? 0 : 8.0,
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
