import 'package:flutter/material.dart';

import '../../../api/models/pokemon/pokemon.dart';
import '../../../api/models/pokemon/pokemon_type.dart';
import '../../../api/models/pokemon/type_efficacies.dart';
import '../../../extensions/build_context_extension.dart';
import '../../../extensions/type_efficacy_extension.dart';
import '../../../extensions/type_list_extension.dart';
import '../../../theme/poke_app_text.dart';
import '../../shared_widgets/chip_group.dart';
import '../../shared_widgets/poke_divider.dart';
import '../../shared_widgets/pokemon_type_chip.dart';

class PokemonWeaknessResistanceWidget extends StatelessWidget {
  const PokemonWeaknessResistanceWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final weaknesses = pokemon.pokemon_v2_pokemontypes.calculateTypeEfficacies();
    if (weaknesses.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (weaknesses.isNotEmpty)
            ..._buildTypeEffectivenessSection(
              context,
              weaknesses,
            ),
          PokeDivider(),
        ],
      ),
    );
  }

  List<Widget> _buildTypeEffectivenessSection(
    BuildContext context,
    List<TypeEfficacies> typeEfficacies,
  ) {
    return [
      _buildMediumMargin(),
      Text(
        context.strings.typeEffectiveness,
        style: PokeAppText.subtitle3Style,
      ),
      _buildMediumMargin(),
      _buildPokemonStatTable(typeEfficacies),
      _buildMediumMargin(),
    ];
  }

  Widget _buildPokemonStatTable(
    List<TypeEfficacies> typeEfficacies,
  ) {
    return ChipGroup(
      chips: typeEfficacies.map(
        (te) {
          final damageFactor = te.calculateDamageFactor();
          return PokemonTypeChip(
            chipType: ChipType.normal,
            type: PokemonType.getTypeForId(
              te.damage_type_id ?? 0,
            ),
            labelSuffix: ' x$damageFactor',
          );
        },
      ).toList(),
    );
  }

  Widget _buildMediumMargin() => const SizedBox(height: 16);

}
