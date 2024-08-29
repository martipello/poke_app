import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../api/models/pokemon/pokemon.dart';
import '../../../api/models/pokemon/pokemon_ability_holder.dart';
import '../../../extensions/build_context_extension.dart';
import '../../../extensions/pokemon_extension.dart';
import '../../../theme/poke_app_text.dart';
import '../shared_widgets/poke_divider.dart';
import 'ability_tile.dart';

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
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (index != 0)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: _buildDivider(
                        hasThinDivider: true,
                      ),
                    ),
                  _buildPokemonAbilityTile(ability),
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

  Widget _buildPokemonAbilityTile(
    PokemonAbilityHolder ability,
  ) {
    return AbilityTile(ability: ability);
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

  Widget _buildDivider({
    bool hasThinDivider = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 8,
      ),
      child: PokeDivider(
        thickness: hasThinDivider ? kThicknessThin : kThicknessThick,
      ),
    );
  }
}
