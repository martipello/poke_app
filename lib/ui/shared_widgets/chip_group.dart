import 'package:flutter/cupertino.dart';

class ChipGroup extends StatelessWidget {
  const ChipGroup({
    required this.chips,
    this.wrapAlignment,
    this.wrapCrossAlignment,
    this.scrollDirection = Axis.vertical,
  });

  final List<Widget> chips;
  final Axis scrollDirection;
  final WrapAlignment? wrapAlignment;
  final WrapCrossAlignment? wrapCrossAlignment;

  @override
  Widget build(BuildContext context) {
    return scrollDirection == Axis.horizontal
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: Wrap(
              alignment: wrapAlignment ?? WrapAlignment.start,
              crossAxisAlignment: wrapCrossAlignment ?? WrapCrossAlignment.start,
              spacing: 16,
              runSpacing: 8,
              children: chips.toList(),
            ),
          )
        : Wrap(
            alignment: wrapAlignment ?? WrapAlignment.start,
            crossAxisAlignment: wrapCrossAlignment ?? WrapCrossAlignment.start,
            spacing: 8,
            runSpacing: 8,
            children: chips.toList(),
          );
  }
}
