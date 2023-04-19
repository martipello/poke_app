import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../api/models/pokemon/evolution_holder.dart';
import '../../../extensions/evolution_extension.dart';
import 'evolution_tile.dart';

class PokemonEvolutionWidget extends StatelessWidget {
  const PokemonEvolutionWidget({
    Key? key,
    required this.evolutionHolder,
  }) : super(key: key);

  final EvolutionHolder evolutionHolder;

  @override
  Widget build(BuildContext context) {
    final evolutions = evolutionHolder.getEvolutions();
    final speciesHolders = evolutionHolder.pokemon_v2_pokemonspecies;
    if (evolutions.isEmpty) {
      return const SliverToBoxAdapter(
        child: SizedBox(),
      );
    }
    return MultiSliver(
      children: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: speciesHolders.length,
            (context, index) {
              final speciesHolder = speciesHolders[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: EvolutionTile(
                  speciesHolder: speciesHolder,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
