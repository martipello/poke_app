import 'package:flutter/material.dart';

import '../../api/models/pokemon/damage_type.dart';
import '../../api/models/pokemon/pokemon_type.dart';
import '../../extensions/string_extension.dart';
import '../../theme/base_theme.dart';
import '../../theme/poke_app_text.dart';

typedef OnSelected = void Function(bool selected);

enum ChipType { filter, normal, expansion }

class TypeChip extends StatelessWidget {
  const TypeChip({
    this.isSelected = false,
    this.onSelected,
    this.onDelete,
    required this.chipType,
    this.pokemonType,
    this.damageType,
    this.labelSuffix = '',
    this.isExpanded,
  }) : assert(pokemonType != null || damageType != null || (chipType == ChipType.expansion && isExpanded != null));

  final ChipType chipType;
  final PokemonType? pokemonType;
  final DamageType? damageType;
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
        label: Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: Text(
            '${label.capitalize()}$labelSuffix',
          ),
        ),
        side: BorderSide(
          width: 1,
          color: color!,
        ),
        backgroundColor: color,
        padding: const EdgeInsets.only(
          right: 8,
        ),
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
        label: Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: Text(
            '${label.capitalize()}$labelSuffix',
            style: PokeAppText.body4Style.copyWith(
              color: colors(context).textOnPrimary,
            ),
          ),
        ),
        padding: const EdgeInsets.only(
          right: 8,
        ),
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

  Widget _buildExpansionChip(BuildContext context) {
    final label = damageType?.name ?? pokemonType?.name;
    final color = damageType?.color ?? pokemonType?.color;
    final image = damageType?.image ?? pokemonType?.image;
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            90,
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
              image!,
              height: 24,
              width: 24,
            ),
            if (isExpanded == true)
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  bottom: 2,
                ),
                child: Text(
                  label!.capitalize(),
                  style: PokeAppText.body3Style.copyWith(
                    color: colors(context).textOnPrimary,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
