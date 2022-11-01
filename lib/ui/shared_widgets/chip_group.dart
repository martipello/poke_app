import 'package:flutter/cupertino.dart';

class ChipGroup extends StatelessWidget {
  const ChipGroup({
    required this.chips,
    this.wrapAlignment,
    this.wrapCrossAlignment,
  });

  final List<Widget> chips;
  final WrapAlignment? wrapAlignment;
  final WrapCrossAlignment? wrapCrossAlignment;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: wrapAlignment ?? WrapAlignment.start,
      crossAxisAlignment: wrapCrossAlignment ?? WrapCrossAlignment.start,
      spacing: 8,
      runSpacing: 8,
      children: chips.toList(),
    );
  }
}
