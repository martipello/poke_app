import 'package:flutter/material.dart';

import '../../api/models/pokemon/damage_type.dart';
import '../../api/models/pokemon/pokemon_type.dart';
import '../../extensions/string_extension.dart';
import '../../theme/base_theme.dart';
import '../../theme/poke_app_text.dart';

typedef OnSelected = void Function(bool selected);

enum ChipType { filter, normal }

class TypeChip extends StatelessWidget {
  const TypeChip({
    this.isSelected = false,
    this.onSelected,
    this.onDelete,
    required this.chipType,
    this.pokemonType,
    this.damageType,
    this.labelSuffix = '',
  }) : assert (pokemonType != null || damageType != null);

  final ChipType chipType;
  final PokemonType? pokemonType;
  final DamageType? damageType;
  final bool isSelected;
  final OnSelected? onSelected;
  final VoidCallback? onDelete;
  final String labelSuffix;

  @override
  Widget build(BuildContext context) {
    if (chipType == ChipType.filter) {
      return _buildFilterChip(context);
    } else {
      return _buildChip(context);
    }
  }

  Widget _buildChip(BuildContext context) {
    final label = damageType?.name ?? pokemonType?.name;
    final color = damageType?.color ?? pokemonType?.color;
    final image = damageType?.image ?? pokemonType?.image;
    return SizedBox(
      height: 32,
      child: Chip(
        avatar: Image.asset(
          image!,
          height: 24,
          width: 24,
        ),
        label: Text(
          '${label.capitalize()}$labelSuffix',
        ),
        side: BorderSide(
          width: 1,
          color: color!,
        ),
        backgroundColor: color,
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
    final label = damageType?.name ?? pokemonType?.name;
    final color = damageType?.color ?? pokemonType?.color;
    final image = damageType?.image ?? pokemonType?.image;
    return SizedBox(
      height: 32,
      child: FilterChip(
        avatar: isSelected
            ? null
            : Image.asset(
                image!,
                height: 24,
                width: 24,
              ),
        backgroundColor: color,
        disabledColor: colors(context).textOnForeground,
        side: onSelected != null
            ? BorderSide(
                width: 1,
                color: color!,
              )
            : null,
        label: Text(
          '${label.capitalize()}$labelSuffix',
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
