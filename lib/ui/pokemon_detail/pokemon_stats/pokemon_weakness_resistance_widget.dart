import 'package:flutter/material.dart';

import '../../../api/models/pokemon/pokemon.dart';
import '../../../api/models/pokemon/pokemon_type.dart';
import '../../../api/models/pokemon/type_efficacies.dart';
import '../../../extensions/build_context_extension.dart';
import '../../../extensions/double_extension.dart';
import '../../../extensions/iterable_extension.dart';
import '../../../extensions/type_list_extension.dart';
import '../../../theme/poke_app_text.dart';
import '../../shared_widgets/chip_group.dart';
import '../../shared_widgets/poke_divider.dart';
import '../../shared_widgets/type_chip.dart';

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
          ..._buildTypeEffectiveness(
            context,
            weaknesses,
          ),
          PokeDivider(),
        ],
      ),
    );
  }

  List<Widget> _buildTypeEffectiveness(
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
      ..._buildTypeEffectivenessSections(
        context,
        typeEfficacies,
      ),
    ];
  }

  List<Widget> _buildTypeEffectivenessSections(
    BuildContext context,
    List<TypeEfficacies> typeEfficacies,
  ) {
    final groupTypeEfficacies = typeEfficacies.groupBy((type) => type.damage_factor);
    return groupTypeEfficacies.entries.map<Widget>(
      (te) {
        return _buildTypeEffectivenessSection(
          context,
          te,
          te.key == groupTypeEfficacies.keys.last,
        );
      },
    ).toList();
  }

  Widget _buildTypeEffectivenessSection(
    BuildContext context,
    MapEntry<double?, List<TypeEfficacies>> entry,
    bool isLast,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTypeEffectivenessSectionTitle(
          context,
          entry,
        ),
        _buildSmallMargin(),
        _buildTypeEffectivenessSectionChipGroup(
          entry,
        ),
        if (!isLast) _buildSectionDivider(),
        if (isLast) _buildSmallMargin(),
      ],
    );
  }

  Widget _buildSectionDivider() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: PokeDivider(),
    );
  }

  Widget _buildTypeEffectivenessSectionChipGroup(
    MapEntry<double?, List<TypeEfficacies>> entry,
  ) {
    return ChipGroup(
      chips: entry.value.map(
        (te) {
          final damageFactor = te.damage_factor?.calculateDamageFactor();
          return TypeChip(
            chipType: ChipType.normal,
            pokemonType: PokemonType.getTypeForId(
              te.damage_type_id ?? 0,
            ),
            labelSuffix: ' x$damageFactor',
          );
        },
      ).toList(),
    );
  }

  Widget _buildTypeEffectivenessSectionTitle(
    BuildContext context,
    MapEntry<double?, List<TypeEfficacies>> entry,
  ) {
    return Row(
      children: [
        Text(
          damageFactorLabel(context, entry.key ?? 0),
          style: PokeAppText.subtitle4Style,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          'x${entry.key.calculateDamageFactor()}',
          style: PokeAppText.subtitle4Style,
        ),
      ],
    );
  }

  String damageFactorLabel(
    BuildContext context,
    double damageFactor,
  ) {
    if (damageFactor == 0) {
      return context.strings.normalDamageLabel;
    } else {
      final _damageFactor = double.parse(
        damageFactor.calculateDamageFactor(),
      );
      if (_damageFactor == 1) {
        return context.strings.neutralLabel;
      } else if (_damageFactor > 1) {
        return context.strings.weaknessLabel;
      } else if (_damageFactor < 1) {
        return context.strings.resistantLabel;
      }
    }
    return context.strings.unknownDamageLabel;
  }

  Widget _buildSmallMargin() => const SizedBox(height: 8);

  Widget _buildMediumMargin() => const SizedBox(height: 16);
}
