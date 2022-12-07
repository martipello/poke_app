import 'package:flutter/material.dart';

import '../../theme/base_theme.dart';

class PokemonExpansionTile extends StatelessWidget {
  const PokemonExpansionTile({
    Key? key,
    required this.canExpand,
    required this.title,
    this.subtitle,
    required this.children,
    this.tilePadding,
    this.childrenPadding,
  }) : super(key: key);

  final bool canExpand;
  final Widget title;
  final Widget? subtitle;
  final List<Widget> children;
  final EdgeInsetsGeometry? tilePadding;
  final EdgeInsetsGeometry? childrenPadding;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        tilePadding: tilePadding ??
            const EdgeInsets.symmetric(
              horizontal: 8,
            ),
        childrenPadding: childrenPadding ??
            const EdgeInsets.symmetric(
              horizontal: 8,
            ),
        trailing: canExpand ? null : const SizedBox(),
        title: Padding(
          padding: subtitle != null ? const EdgeInsets.only(bottom: 4) : EdgeInsets.zero,
          child: title,
        ),
        collapsedIconColor: colors(context).textOnForeground,
        iconColor: colors(context).textOnForeground,
        subtitle: subtitle,
        children: children,
      ),
    );
  }
}
