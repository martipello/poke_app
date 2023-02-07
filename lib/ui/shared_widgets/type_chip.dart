import 'package:flutter/material.dart';

import '../../api/models/pokemon/damage_type.dart';
import '../../api/models/pokemon/pokemon_type.dart';
import '../../extensions/build_context_extension.dart';
import '../../extensions/string_extension.dart';
import '../../theme/base_theme.dart';
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
      height: kChipHeight + 16,
      child: Chip(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            360,
          ),
        ),
        avatar: Image.asset(
          image!,
          height: kChipHeight - 6,
          width: kChipHeight - 6,
        ),
        label: Text(
          '${label.capitalize()}$labelSuffix',
          style: PokeAppText.body4Style.copyWith(
            color: colors(context).cardBackground,
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
          color: colors(context).cardBackground,
        ),
        deleteButtonTooltipMessage: context.strings.delete,
        deleteIconColor: colors(context).cardBackground,
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
      height: kChipHeight,
      child: FilterChip(
        avatar: isSelected
            ? null
            : Image.asset(
                image!,
                height: kChipHeight - 6,
                width: kChipHeight - 6,
              ),
        backgroundColor: color,
        disabledColor: colors(context).cardBackground,
        side: onSelected != null
            ? BorderSide(
                width: 1,
                color: color!,
              )
            : null,
        label: Padding(
          padding: const EdgeInsets.only(
            bottom: 3,
          ),
          child: Text(
            '${label.capitalize()}$labelSuffix',
            style: PokeAppText.body4Style.copyWith(
              color: isSelected ? colors(context).textOnForeground : colors(context).cardBackground,
            ),
          ),
        ),
        padding: const EdgeInsets.only(
          right: 8,
        ),
        labelStyle: PokeAppText.body4Style.copyWith(
          color: isSelected ? colors(context).textOnForeground : colors(context).cardBackground,
        ),
        onSelected: onSelected,
        selected: isSelected,
        showCheckmark: isSelected,
        selectedColor: colors(context).cardBackground,
        checkmarkColor: colors(context).textOnForeground,
      ),
    );
  }

  Widget _buildExpansionChip(BuildContext context) {
    final label = damageType?.name ?? pokemonType?.name;
    final color = damageType?.color ?? pokemonType?.color;
    final image = damageType?.image ?? pokemonType?.image;
    return Container(
      height: kChipHeight,
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
                  label!.capitalize(),
                  style: PokeAppText.body3Style.copyWith(
                    color: colors(context).cardBackground,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
