import 'package:flutter/cupertino.dart';

class ChipGroup extends StatefulWidget {
  const ChipGroup({
    required this.chips,
    this.wrapAlignment,
    this.wrapCrossAlignment,
    this.scrollDirection = Axis.vertical,
    this.scrollController,
  });

  final List<Widget> chips;
  final Axis scrollDirection;
  final WrapAlignment? wrapAlignment;
  final WrapCrossAlignment? wrapCrossAlignment;
  final ScrollController? scrollController;

  @override
  State<ChipGroup> createState() => _ChipGroupState();
}

class _ChipGroupState extends State<ChipGroup> {

  @override
  Widget build(BuildContext context) {
    return widget.scrollDirection == Axis.horizontal ? _buildHorizontalChipList() : _buildVerticalChipList();
  }

  Widget _buildVerticalChipList() {
    return Flexible(
      child: SingleChildScrollView(
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
      height: 48,
      child: ListView.builder(
        controller: widget.scrollController,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: const EdgeInsets.only(
          bottom: 16,
          left: 16,
          right: 16,
        ),
        itemCount: widget.chips.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              right: 16,
            ),
            child: widget.chips[index],
          );
        },
      ),
    );
  }
}
