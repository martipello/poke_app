import 'package:flutter/material.dart';

import '../../../api/models/pokemon/pokemon_ability_holder.dart';
import '../../../extensions/build_context_extension.dart';
import '../../../extensions/pokemon_ability_holder_extension.dart';
import '../../../theme/base_theme.dart';
import '../../../theme/poke_app_text.dart';
import '../../shared_widgets/pokemon_expansion_tile.dart';
import '../../shared_widgets/pokemon_table.dart';

class AbilityTile extends StatelessWidget {
  const AbilityTile({
    Key? key,
    required this.ability,
  }) : super(key: key);

  final PokemonAbilityHolder ability;

  @override
  Widget build(BuildContext context) {
    return PokemonExpansionTile(
      canExpand: true,
      title: _buildExpansionTileTitle(
        context,
        ability.title(),
        ability.is_hidden == true,
      ),
      subtitle: _buildExpansionTileSubtitle(
        context,
        ability,
      ),
      children: _buildPokemonAbilityDetail(
        context,
        ability,
      ),
    );
  }

  List<Widget> _buildPokemonAbilityDetail(
    BuildContext context,
    PokemonAbilityHolder abilityHolder,
  ) {
    final generation = abilityHolder.pokemon_v2_ability?.generation_id?.toString() ?? '';
    final versionDisplayName = abilityHolder.versionDisplayName();
    final shortEffect = abilityHolder.shortEffect();
    final mainSeries = abilityHolder.mainSeries();
    return [
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: PokemonTable(
          pokemonTableRowInfoList: [
            if (shortEffect.isNotEmpty)
              PokemonTableRowInfo(
                context.strings.effect,
                value: shortEffect,
              ),
            if (generation.isNotEmpty)
              PokemonTableRowInfo(
                context.strings.generation,
                value: '$generation',
              ),
            if (versionDisplayName.isNotEmpty)
              PokemonTableRowInfo(
                context.strings.version,
                value: versionDisplayName,
              ),
            if (mainSeries.isNotEmpty)
              PokemonTableRowInfo(
                context.strings.mainSeries,
                value: mainSeries,
              ),
          ],
        ),
      ),
    ];
  }

  Widget _buildExpansionTileTitle(
    BuildContext context,
    String title,
    bool isHidden,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 4,
        bottom: 4,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: PokeAppText.body3Style.copyWith(
              color: colors(context).textOnForeground,
            ),
          ),
          if (isHidden)
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
              ),
              child: Text(
                context.strings.hidden,
                style: PokeAppText.body3Style.copyWith(
                  color: colors(context).textOnForeground,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildExpansionTileSubtitle(
    BuildContext context,
    PokemonAbilityHolder pokemonAbilityHolder,
  ) {
    return Text(
      pokemonAbilityHolder.description(),
      style: PokeAppText.body4Style.copyWith(
        color: colors(context).textOnForeground,
      ),
    );
  }
}
