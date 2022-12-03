import 'package:flutter/material.dart';

import '../../theme/base_theme.dart';

class PokemonExpansionTile extends StatelessWidget {
  const PokemonExpansionTile({
    Key? key,
    required this.canExpand,
    required this.title,
    this.subtitle,
    required this.children,
  }) : super(key: key);

  final bool canExpand;
  final Widget title;
  final Widget? subtitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        childrenPadding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        trailing: canExpand ? null : const SizedBox(),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 4),
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
