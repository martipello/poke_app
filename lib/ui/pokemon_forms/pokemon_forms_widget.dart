import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../api/models/pokemon/pokemon.dart';
import '../../../extensions/pokemon_extension.dart';
import 'form_tile.dart';

class PokemonFormsWidget extends StatelessWidget {
  const PokemonFormsWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final pokemonFormHolder = pokemon.getFormHolders();
    if (pokemonFormHolder.isEmpty) {
      return const SliverToBoxAdapter(
        child: SizedBox(),
      );
    }
    return MultiSliver(
      children: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: pokemonFormHolder.length,
            (context, index) {
              final pokemonFormWithVersionGroup = pokemonFormHolder[index];
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 8,
                ),
                child: FormTile(
                  pokemonFormWithVersionGroup: pokemonFormWithVersionGroup,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
