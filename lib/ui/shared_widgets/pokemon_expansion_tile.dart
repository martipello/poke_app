import 'package:flutter/material.dart';

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
        title: title,
        subtitle: subtitle,
        children: children,
      ),
    );
  }
}
