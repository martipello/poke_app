import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';

import '../../../api/models/pokemon/pokemon.dart';
import '../../../api/models/pokemon/pokemon_type.dart';
import '../../../api/models/pokemon/type_efficacies.dart';
import '../../../extensions/build_context_extension.dart';
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
    final typeEfficacies = _createNotNullTypeEfficacies();
    final weaknesses = _createWeaknessList(typeEfficacies).toList();
    final resistances = _createResistanceList(typeEfficacies).toList();
    if (weaknesses.isEmpty && resistances.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (weaknesses.isNotEmpty)
            ..._buildWeaknessSection(
              context,
              weaknesses,
            ),
          if (resistances.isNotEmpty)
            ..._buildResistanceSection(
              context,
              resistances,
            ),
          PokeDivider(),
        ],
      ),
    );
  }

  List<Widget> _buildWeaknessSection(
    BuildContext context,
    List<TypeEfficacies> typeEfficacies,
  ) {
    return [
      _buildMediumMargin(),
      Text(
        context.strings.weakness,
        style: PokeAppText.subtitle3Style,
      ),
      _buildMediumMargin(),
      _buildPokemonStatTable(typeEfficacies),
      _buildMediumMargin(),
    ];
  }

  List<Widget> _buildResistanceSection(
    BuildContext context,
    List<TypeEfficacies> typeEfficacies,
  ) {
    return [
      Text(
        context.strings.resistance,
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
      chips: typeEfficacies
          .map(
            (te) => PokemonTypeChip(
              chipType: ChipType.normal,
              type: PokemonType.getTypeForId(
                te.target_type_id ?? 0,
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildMediumMargin() => const SizedBox(height: 16);

  Iterable<TypeEfficacies> _createWeaknessList(
    Iterable<TypeEfficacies> typeEfficacies,
  ) =>
      typeEfficacies.where((te) => (te.damage_factor ?? 0) > 100);

  Iterable<TypeEfficacies> _createResistanceList(
    Iterable<TypeEfficacies> typeEfficacies,
  ) =>
      typeEfficacies.where((te) => (te.damage_factor ?? 0) < 100);

  Iterable<TypeEfficacies> _createNotNullTypeEfficacies() {
    return pokemon.pokemon_v2_pokemontypes
        .map(
          (te) => te.pokemon_v2_type?.pokemon_v2_typeefficacies,
        )
        .whereType<BuiltList<TypeEfficacies>>()
        .expand((element) => element)
        .whereType<TypeEfficacies>();
  }
}
