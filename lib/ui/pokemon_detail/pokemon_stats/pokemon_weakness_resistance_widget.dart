import 'package:flutter/material.dart';

import '../../../api/models/pokemon/pokemon.dart';

class PokemonWeaknessResistanceWidget extends StatelessWidget {
  const PokemonWeaknessResistanceWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      color: Colors.red,
    );
  }
}
