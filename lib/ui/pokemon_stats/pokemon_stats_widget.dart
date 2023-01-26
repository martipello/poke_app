import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../api/models/pokemon/pokemon.dart';
import '../../../api/models/pokemon/pokemon_stat.dart';
import '../../../extensions/build_context_extension.dart';
import '../../../extensions/iterable_extension.dart';
import '../../../extensions/stat_extension.dart';
import '../../../theme/poke_app_text.dart';
import '../shared_widgets/poke_divider.dart';
import '../shared_widgets/pokemon_table.dart';
import 'stat_bar.dart';

class PokemonStatsWidget extends StatelessWidget {
  const PokemonStatsWidget({
    Key? key,
    required this.pokemon,
    required this.primaryColor,
    required this.secondaryColor,
  }) : super(key: key);

  final Pokemon pokemon;
  final Color primaryColor;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    final pokemonStats = _createNotNullPokemonStatList();
    if (pokemonStats.isNullOrEmpty()) {
      return const SizedBox();
    }
    final total = _createTotal(pokemonStats);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.strings.baseStats,
            style: PokeAppText.subtitle3Style,
          ),
          _buildMediumMargin(),
          _buildPokemonStatTable(pokemonStats),
          _buildSmallMargin(),
          Text(
            '${context.strings.total} : $total',
            style: PokeAppText.body3Style,
          ),
          _buildMediumMargin(),
          PokeDivider(),
        ],
      ),
    );
  }

  Widget _buildPokemonStatTable(
    List<PokemonStat> pokemonStats,
  ) {
    return PokemonTable(
      pokemonTableRowInfoList: pokemonStats
          .mapIndexed(
            _statBarTableRow,
          )
          .toList(),
    );
  }

  PokemonTableRowInfo _statBarTableRow(
    int index,
    PokemonStat pokemonStat,
  ) {
    return PokemonTableRowInfo(
      pokemonStat.displayName(),
      child: StatBar(
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
        index: index,
        pokemonStat: pokemonStat,
      ),
    );
  }

  Widget _buildSmallMargin() => const SizedBox(
        height: 8,
      );

  Widget _buildMediumMargin() => const SizedBox(
        height: 16,
      );

  int _createTotal(
    List<PokemonStat> pokemonStats,
  ) =>
      pokemonStats.map((e) => e.base_stat).whereType<int>().toList().sum;

  List<PokemonStat> _createNotNullPokemonStatList() =>
      pokemon.pokemon_v2_pokemonstats.whereType<PokemonStat>().toList();
}
