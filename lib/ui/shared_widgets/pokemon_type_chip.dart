import 'package:flutter/material.dart';

import '../../api/models/pokemon/pokemon_type.dart';
import '../../extensions/string_extension.dart';
import '../../theme/base_theme.dart';
import '../../theme/poke_app_text.dart';

typedef OnSelected = void Function(bool selected);

enum ChipType { filter, normal }

class PokemonTypeChip extends StatelessWidget {
  const PokemonTypeChip({
    this.isSelected = false,
    this.onSelected,
    this.onDelete,
    required this.chipType,
    required this.type,
  });

  final ChipType chipType;
  final PokemonType type;
  final bool isSelected;
  final OnSelected? onSelected;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    if (chipType == ChipType.filter) {
      return _buildFilterChip(context);
    } else {
      return _buildChip(context);
    }
  }

  Widget _buildChip(BuildContext context) {
    return SizedBox(
      height: 32,
      child: Chip(
        avatar: Image.asset(
          type.image,
          height: 24,
          width: 24,
        ),
        label: Text(
          type.name.capitalize(),
        ),
        side: BorderSide(
          width: 1,
          color: type.color,
        ),
        backgroundColor: type.color,
        padding: const EdgeInsets.only(bottom: 2),
        labelStyle: PokeAppText.body4Style.copyWith(
          color: colors(context).textOnPrimary,
        ),
        deleteButtonTooltipMessage: 'Delete',
        deleteIconColor: colors(context).textOnPrimary,
        onDeleted: isSelected ? onDelete : null,
        deleteIcon: const Icon(
          Icons.close,
        ),
      ),
    );
  }

  Widget _buildFilterChip(BuildContext context) {
    return SizedBox(
      height: 32,
      child: FilterChip(
        avatar: isSelected
            ? null : Image.asset(
                type.image,
                height: 24,
                width: 24,
              ),
        backgroundColor: type.color,
        disabledColor: colors(context).textOnForeground,
        side: onSelected != null ? BorderSide(
          width: 1,
          color: type.color,
        ) : null,
        label: Text(
          type.name.capitalize(),
          style: PokeAppText.body4Style.copyWith(
            color: colors(context).textOnPrimary,
          ),
        ),
        padding: const EdgeInsets.only(bottom: 2),
        labelStyle: PokeAppText.body4Style.copyWith(
          color: colors(context).textOnPrimary,
        ),
        onSelected: onSelected,
        selected: isSelected,
        showCheckmark: isSelected,
        selectedColor: colors(context).textOnForeground,
        checkmarkColor: colors(context).white,
      ),
    );
  }
}
