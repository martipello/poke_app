import 'package:flutter/material.dart';

import '../../../api/models/pokemon/pokemon.dart';

class PokemonStatsWidget extends StatelessWidget {
  const PokemonStatsWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      color: Colors.blue,
    );
  }
}
