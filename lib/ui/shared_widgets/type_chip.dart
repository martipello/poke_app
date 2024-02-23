import 'package:flutter/material.dart';

import '../../api/models/filter_type.dart';
import '../../extensions/build_context_extension.dart';
import '../../extensions/string_extension.dart';
import '../../theme/poke_app_text.dart';

typedef OnSelected = void Function(bool selected);

const double kChipHeight = 36;

enum ChipType { filter, normal, expansion }

class TypeChip extends StatelessWidget {
  const TypeChip({
    this.isSelected = false,
    this.onSelected,
    this.onDelete,
    required this.chipType,
    required this.filterType,
    this.labelSuffix = '',
    this.isExpanded,
  });

  final ChipType chipType;
  final FilterType filterType;
  final bool isSelected;
  final bool? isExpanded;
  final OnSelected? onSelected;
  final VoidCallback? onDelete;
  final String labelSuffix;

  @override
  Widget build(BuildContext context) {
    switch (chipType) {
      case ChipType.filter:
        return _buildFilterChip(context);
      case ChipType.normal:
        return _buildChip(context);
      case ChipType.expansion:
        return _buildExpansionChip(context);
    }
  }

  Widget _buildChip(BuildContext context) {
    final label = filterType.name;
    final color = filterType.color;
    final image = filterType.image;
    return SizedBox(
      height: kChipHeight + 16,
      child: Chip(
        avatar: Image.asset(
          image,
          height: kChipHeight - 6,
          width: kChipHeight - 6,
        ),
        label: Text(
          '${label.capitalize()}$labelSuffix',
          style: PokeAppText.body4Style,
        ),
        side: BorderSide(
          width: 1,
          color: color,
        ),
        backgroundColor: color,
        padding: const EdgeInsets.only(
          right: 8,
        ),
        labelStyle: PokeAppText.body4Style,
        deleteButtonTooltipMessage: context.strings.delete,
        onDeleted: isSelected ? onDelete : null,
        deleteIcon: Icon(
          Icons.close,
          color: context.colors.onSurface,
        ),
      ),
    );
  }

  Widget _buildFilterChip(BuildContext context) {
    final label = filterType.name;
    final color = filterType.color;
    final image = filterType.image;
    return SizedBox(
      height: kChipHeight,
      child: FilterChip(
        avatar: isSelected
            ? null
            : Image.asset(
                image,
                height: kChipHeight - 6,
                width: kChipHeight - 6,
              ),
        backgroundColor: color,
        disabledColor: context.colors.surface,
        side: onSelected != null
            ? BorderSide(
                width: 1,
                color: color,
              )
            : null,
        label: Padding(
          padding: const EdgeInsets.only(
            bottom: 3,
          ),
          child: Text(
            '${label.capitalize()}$labelSuffix',
            style: PokeAppText.body4Style.copyWith(
              color: isSelected ? context.colors.onSurface : context.colors.surface,
            ),
          ),
        ),
        padding: const EdgeInsets.only(
          right: 8,
        ),
        labelStyle: PokeAppText.body4Style,
        onSelected: onSelected,
        selected: isSelected,
        showCheckmark: isSelected,
        selectedColor: context.colors.surface,
        checkmarkColor: context.colors.onSurface,
      ),
    );
  }

  Widget _buildExpansionChip(BuildContext context) {
    final label = filterType.name;
    final color = filterType.color;
    final image = filterType.image;
    return Container(
      height: kChipHeight,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            8,
          ),
        ),
      ),
      padding: const EdgeInsets.all(4),
      child: AnimatedSize(
        duration: const Duration(
          milliseconds: 200,
        ),
        child: Row(
          children: [
            Image.asset(
              image,
              height: kChipHeight - 6,
              width: kChipHeight - 6,
            ),
            if (isExpanded == true)
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  bottom: 2,
                ),
                child: Text(
                  label.capitalize(),
                  style: PokeAppText.body3Style,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
