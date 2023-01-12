import 'package:flutter/cupertino.dart';

import 'type_chip.dart';

class ChipGroup extends StatefulWidget {
  const ChipGroup({
    required this.chips,
    this.wrapAlignment,
    this.wrapCrossAlignment,
    this.scrollDirection = Axis.vertical,
    this.scrollController,
    this.padding,
    this.scrollPhysics,
  });

  final List<Widget> chips;
  final Axis scrollDirection;
  final ScrollPhysics? scrollPhysics;
  final EdgeInsets? padding;
  final WrapAlignment? wrapAlignment;
  final WrapCrossAlignment? wrapCrossAlignment;
  final ScrollController? scrollController;

  @override
  State<ChipGroup> createState() => _ChipGroupState();
}

class _ChipGroupState extends State<ChipGroup> {

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return widget.scrollDirection == Axis.horizontal ? _buildHorizontalChipList() : _buildVerticalChipList();
  }

  Widget _buildVerticalChipList() {
    return Flexible(
      child: SingleChildScrollView(
        padding: widget.padding,
        physics: widget.scrollPhysics,
        controller: widget.scrollController ?? scrollController,
        child: Wrap(
          alignment: widget.wrapAlignment ?? WrapAlignment.start,
          crossAxisAlignment: widget.wrapCrossAlignment ?? WrapCrossAlignment.start,
          spacing: 8,
          runSpacing: 8,
          children: widget.chips.toList(),
        ),
      ),
    );
  }

  Widget _buildHorizontalChipList() {
    return SizedBox(
      height: kChipHeight,
      child: ListView.builder(
        controller: widget.scrollController ?? scrollController,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: widget.scrollPhysics,
        padding: widget.padding ??
            const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
        itemCount: widget.chips.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: index == widget.chips.length - 1 ? 0 : 8,
            ),
            child: widget.chips[index],
          );
        },
      ),
    );
  }
}
