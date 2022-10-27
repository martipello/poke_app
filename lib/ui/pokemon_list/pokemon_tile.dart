import 'package:flutter/material.dart';

import '../../api/models/pokemon/pokemon.dart';
import '../shared_widgets/rounded_card.dart';

class PokemonTile extends StatelessWidget {
  const PokemonTile({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(pokemon.name),
          Text(pokemon.id.toString()),
        ],
      ),
    );
  }
}
