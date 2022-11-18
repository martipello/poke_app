import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../api/models/pokemon/pokemon.dart';
import '../../api/models/pokemon/pokemon_ability_holder.dart';
import '../../extensions/build_context_extension.dart';
import '../../extensions/pokemon_ability_holder_extension.dart';
import '../../extensions/pokemon_extension.dart';
import '../../theme/poke_app_text.dart';
import '../shared_widgets/poke_divider.dart';
import '../shared_widgets/pokemon_expansion_tile.dart';
import '../shared_widgets/pokemon_table.dart';

class PokemonAbilityWidget extends StatelessWidget {
  const PokemonAbilityWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final abilities = pokemon.abilities();
    if (abilities.isEmpty) {
      return const SliverToBoxAdapter(
        child: SizedBox(),
      );
    }
    return MultiSliver(
      children: [
        SliverToBoxAdapter(
          child: _buildTitle(context),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: abilities.length,
            (context, index) {
              final ability = abilities[index];
              return Column(
                children: [
                  if (index != 0)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: _buildDivider(),
                    ),
                  PokemonExpansionTile(
                    canExpand: true,
                    title: _buildExpansionTileTitle(
                      context,
                      ability.title(),
                      ability.is_hidden == true,
                    ),
                    subtitle: _buildExpansionTileSubtitle(
                      ability,
                    ),
                    children: _buildPokemonAbilityDetail(
                      context,
                      ability,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SliverToBoxAdapter(
          child: _buildDivider(),
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
        context.strings.abilities,
        style: PokeAppText.subtitle3Style,
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
          wordskiiTableRowInfoList: [
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

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 8,
      ),
      child: PokeDivider(),
    );
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
            style: PokeAppText.body3Style,
          ),
          if (isHidden)
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
              ),
              child: Text(
                context.strings.hidden,
                style: PokeAppText.body3Style,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildExpansionTileSubtitle(
    PokemonAbilityHolder pokemonAbilityHolder,
  ) {
    return Text(
      pokemonAbilityHolder.description(),
      style: PokeAppText.body4Style,
    );
  }
}
