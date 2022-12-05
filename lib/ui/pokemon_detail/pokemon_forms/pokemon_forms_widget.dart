import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../api/models/pokemon/pokemon.dart';
import '../../../extensions/pokemon_extension.dart';
import '../../shared_widgets/poke_divider.dart';
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
              final pokemonForm = pokemonFormHolder[index];
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 8,
                ),
                child: FormTile(
                  pokemonForm: pokemonForm,
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
