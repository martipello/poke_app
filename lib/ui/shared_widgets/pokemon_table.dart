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
    required this.pokemonTableRowInfoList,
    this.tableTitle,
    this.tableTitleTextStyle,
    this.padding,
  });

  final String? tableTitle;
  final TextStyle? tableTitleTextStyle;
  final EdgeInsets? padding;
  final List<PokemonTableRowInfo> pokemonTableRowInfoList;

  @override
  Widget build(BuildContext context) {
    return pokemonTableRowInfoList.any(
      (element) => element.value?.isNotEmpty == true || element.child != null,
    )
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (tableTitle != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildBookingSubTitle(
                      context,
                      tableTitle,
                    ),
                    const SizedBox(
                      height: 12,
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
                  ...pokemonTableRowInfoList
                      .where(
                    (element) => element.value?.isNotEmpty == true && element.value != 'null' || element.child != null,
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
                            pokemonTableRowInfoList
                                .where(
                                  (element) => element.value?.isNotEmpty == true || element.child != null,
                                )
                                .first,
                        isLast: e ==
                            pokemonTableRowInfoList
                                .where(
                                  (element) => element.value?.isNotEmpty == true || element.child != null,
                                )
                                .last,
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
    bool isLast = false,
  }) {
    return TableRow(
      children: [
        _buildTableRowIcon(icon, context),
        _buildTableRowText(
          context,
          key,
          isFirst,
          isLast,
        ),
        if (!isConstrained)
          _buildTableRowContent(
            context,
            onPressed,
            borderColor,
            child,
            value,
            labelTextAlign,
            isFirst,
            isLast,
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
            isLast,
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
    bool isLast,
  ) {
    final screenMeasure = (context.screenWidth / 5) * 3;
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: screenMeasure),
        child: _buildTableRowContent(
          context,
          onPressed,
          borderColor,
          child,
          value,
          labelTextAlign,
          isFirst,
          isLast,
        ),
      ),
    );
  }

  GestureDetector _buildTableRowContent(
    BuildContext context,
    VoidCallback? onPressed,
    Color? borderColor,
    Widget? child,
    String? value,
    TextAlign? labelTextAlign,
    bool isFirst,
    bool isLast,
  ) {
    final topPadding = (isFirst ? 0 : padding?.top ?? 8).toDouble();
    final bottomPadding = (isLast ? 0 : padding?.bottom ?? 8).toDouble();
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: borderColor != null
                  ? const EdgeInsets.only(
                      bottom: 16,
                    )
                  : EdgeInsets.zero,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: borderColor ?? Colors.transparent,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: padding?.left ?? 8,
                    right: padding?.right ?? 8,
                    bottom: bottomPadding,
                    top: topPadding,
                  ),
                  child: child ??
                      Text(
                        value ?? '',
                        style: PokeAppText.body4Style.copyWith(
                          color: colors(context).textOnForeground,
                        ),
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

  Widget _buildTableRowText(
    BuildContext context,
    String? key,
    bool isFirst,
    bool isLast,
  ) {
    final topPadding = (isFirst ? 0 : padding?.top ?? 8).toDouble();
    final bottomPadding = (isLast ? 0 : padding?.bottom ?? 8).toDouble();
    return Padding(
      padding: EdgeInsets.only(top: topPadding, right: 8, bottom: bottomPadding),
      child: Row(
        children: [
          Flexible(
            child: Text(
              key?.trim() ?? '',
              style: PokeAppText.body3Style.copyWith(
                color: colors(context).textOnForeground,
              ),
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

  Widget _buildBookingSubTitle(
    BuildContext context,
    String? value,
  ) {
    return Text(
      value ?? '',
      style: tableTitleTextStyle?.copyWith(
            color: colors(context).textOnForeground,
          ) ??
          PokeAppText.subtitle4Style.copyWith(
            color: colors(context).textOnForeground,
          ),
    );
  }
}
