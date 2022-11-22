import 'package:flutter/material.dart';

import '../../../api/models/pokemon/pokemon_move_holder.dart';
import '../../shared_widgets/rounded_card.dart';

class PokemonMoveTile extends StatelessWidget {
  const PokemonMoveTile({
    Key? key,
    required this.move,
  }) : super(key: key);

  final PokemonMoveHolder move;

  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      child: _buildPokemonCardBody(),
    );
  }

  Widget _buildPokemonCardBody() {
    return const SizedBox();
  }

}
