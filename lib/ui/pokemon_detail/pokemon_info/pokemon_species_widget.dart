import 'package:flutter/material.dart';

import '../../../api/models/pokemon/pokemon.dart';
import '../../../api/models/pokemon/pokemon_resource.dart';
import '../../../api/models/pokemon/pokemon_species_holder.dart';
import '../../../extensions/build_context_extension.dart';
import '../../../extensions/iterable_extension.dart';
import '../../../extensions/pokemon_species_holder_extension.dart';
import '../../../theme/base_theme.dart';
import '../../../theme/poke_app_text.dart';
import '../../shared_widgets/poke_divider.dart';
import '../../shared_widgets/pokemon_expansion_tile.dart';
import '../../shared_widgets/pokemon_table.dart';

class PokemonSpeciesWidget extends StatelessWidget {
  const PokemonSpeciesWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final species = pokemon.pokemon_v2_pokemonspecy;
    if (species == null) {
      return const SizedBox();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildTitle(context),
        PokemonExpansionTile(
          canExpand: true,
          title: _buildPokemonSpeciesExpansionTitle(
            context,
            species,
          ),
          children: [
            _buildPokemonSpeciesDetails(
              context,
              species,
            ),
          ],
        ),
        _buildDivider(
          horizontalPadding: 8,
        ),
      ],
    );
  }

  Widget _buildTitle(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Text(
        context.strings.species,
        style: PokeAppText.subtitle3Style,
      ),
    );
  }

  Widget _buildPokemonSpeciesExpansionTitle(
    BuildContext context,
    PokemonSpeciesHolder speciesHolder,
  ) {
    final shape = speciesHolder.shape();
    final habitat = speciesHolder.habitat();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (shape.isNotEmpty)
          _buildSpeciesTitle(
            context,
            context.strings.shape,
            shape,
          ),
        if (habitat.isNotEmpty)
          _buildSpeciesTitle(
            context,
            context.strings.habitat,
            habitat,
          ),
      ],
    );
  }

  Widget _buildSpeciesTitle(
    BuildContext context,
    String label,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            label,
            style: PokeAppText.body3Style.copyWith(
              color: colors(context).textOnForeground,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            value,
            style: PokeAppText.body4Style.copyWith(
              color: colors(context).textOnForeground,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPokemonSpeciesDetails(
    BuildContext context,
    PokemonSpeciesHolder speciesHolder,
  ) {
    final color = speciesHolder.color();
    final baseHappiness = speciesHolder.baseHappiness().toString();
    final captureRate = speciesHolder.captureRate().toString();
    final genderRate = speciesHolder.genderRate().toString();
    final hatchCounter = speciesHolder.hatchCounter().toString();
    final isLegendary = speciesHolder.isLegendary();
    final isMythical = speciesHolder.isMythical();
    final isBaby = speciesHolder.isBaby();
    final eggGroups = speciesHolder.pokemon_v2_pokemonegggroups.toList();
    return PokemonTable(
      pokemonTableRowInfoList: [
        if (color.isNotEmpty)
          PokemonTableRowInfo(
            context.strings.color,
            value: color,
          ),
        if (baseHappiness.isNotEmpty)
          PokemonTableRowInfo(
            context.strings.baseHappiness,
            value: baseHappiness,
          ),
        if (captureRate.isNotEmpty)
          PokemonTableRowInfo(
            context.strings.captureRate,
            value: captureRate,
          ),
        if (genderRate.isNotEmpty)
          PokemonTableRowInfo(
            context.strings.genderRate,
            value: genderRate,
          ),
        if (eggGroups.isNotEmpty)
          PokemonTableRowInfo(
            context.strings.eggGroup,
            child: _buildEggGroups(
              context,
              eggGroups,
            ),
          ),
        if (hatchCounter.isNotEmpty)
          PokemonTableRowInfo(
            context.strings.hatchCounter,
            value: hatchCounter,
          ),
        if (isLegendary.isNotEmpty)
          PokemonTableRowInfo(
            context.strings.legendary,
            value: isLegendary,
          ),
        if (isMythical.isNotEmpty)
          PokemonTableRowInfo(
            context.strings.mythical,
            value: isMythical,
          ),
        if (isBaby.isNotEmpty)
          PokemonTableRowInfo(
            context.strings.baby,
            value: isBaby,
          ),
      ],
    );
  }

  Widget _buildEggGroups(
    BuildContext context,
    List<PokemonResource> eggGroups,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: eggGroups
          .map(
            (eggGroup) => Padding(
              padding: eggGroup != eggGroups.firstOrNull() ? const EdgeInsets.only(top: 8) : EdgeInsets.zero,
              child: Text(
                eggGroup.pokemon_v2_egggroup?.name ?? '',
                style: PokeAppText.body4Style.copyWith(
                  color: colors(context).textOnForeground,
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildDivider({
    double horizontalPadding = 16,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: horizontalPadding,
      ),
      child: PokeDivider(),
    );
  }
}
