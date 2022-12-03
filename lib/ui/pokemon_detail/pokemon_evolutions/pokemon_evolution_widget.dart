import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../api/models/pokemon/evolution_holder.dart';
import '../../../extensions/build_context_extension.dart';
import '../../../theme/poke_app_text.dart';
import '../../shared_widgets/poke_divider.dart';
import 'evolution_tile.dart';

class PokemonEvolutionWidget extends StatelessWidget {
  const PokemonEvolutionWidget({
    Key? key,
    required this.evolutionHolder,
  }) : super(key: key);

  final EvolutionHolder evolutionHolder;

  @override
  Widget build(BuildContext context) {
    final evolutions = evolutionHolder.pokemon_v2_pokemonspecies
        .map(
          (specie) => specie.pokemon_v2_pokemonevolutions,
        )
        .expand(
          (evolutions) => evolutions,
        )
        .toList();
    final speciesHolders = evolutionHolder.pokemon_v2_pokemonspecies;
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
