import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

import '../../../api/models/pokemon/pokemon.dart';
import '../../../api/models/pokemon/pokemon_stat.dart';
import '../../../extensions/build_context_extension.dart';
import '../../../extensions/iterable_extension.dart';
import '../../../extensions/stat_extension.dart';
import '../../../theme/base_theme.dart';
import '../../../theme/poke_app_text.dart';
import '../../shared_widgets/poke_divider.dart';
import '../../shared_widgets/pokemon_table.dart';

class PokemonStatsWidget extends StatelessWidget {
  const PokemonStatsWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

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
      child: _buildStatBarDelay(
        index,
        pokemonStat,
      ),
    );
  }

  Widget _buildStatBarDelay(
    int index,
    PokemonStat pokemonStat,
  ) {
    return FutureBuilder<dynamic>(
      future: Future<dynamic>.delayed(
        Duration(
          milliseconds: index * 50,
        ),
      ),
      builder: (context, snapshot) {
        final value = snapshot.connectionState == ConnectionState.waiting ? 0 : pokemonStat.base_stat;
        return _buildStatBar(
          context,
          value?.toDouble() ?? 0,
        );
      },
    );
  }

  Widget _buildStatBar(
    BuildContext context,
    double value,
  ) {
    return FAProgressBar(
      displayText: '',
      displayTextStyle: PokeAppText.body3Style.copyWith(
        color: colors(context).textOnPrimary,
      ),
      currentValue: value.toDouble(),
      size: 22,
      backgroundColor: Colors.green,
      progressGradient: const LinearGradient(
        colors: [
          Colors.yellow,
          Colors.red,
        ],
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
