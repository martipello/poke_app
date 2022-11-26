import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../api/models/pokemon/pokemon.dart';
import '../../../extensions/build_context_extension.dart';
import '../../../theme/poke_app_text.dart';
import '../../pokemon_list/pokemon_tile.dart';
import '../../shared_widgets/poke_divider.dart';

class PokemonEvolutionWidget extends StatelessWidget {
  const PokemonEvolutionWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final evolutions = [];//pokemon.evolution();
    if (evolutions.isEmpty) {
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
            childCount: evolutions.length,
            (context, index) {
              final pokemon = evolutions[index];
              return Column(
                children: [
                  if (index != 0)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: _buildDivider(),
                    ),
                  PokemonTile(
                    pokemon: pokemon,
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
        context.strings.evolutions,
        style: PokeAppText.subtitle3Style,
      ),
    );
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

}
