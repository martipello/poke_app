import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

import '../../api/models/pokemon/pokemon_stat.dart';
import '../../extensions/build_context_extension.dart';
import '../../theme/poke_app_text.dart';

class StatBar extends StatefulWidget {
  const StatBar({
    super.key,
    required this.pokemonStat,
    required this.index,
    required this.primaryColor,
    required this.secondaryColor,
  });

  final PokemonStat pokemonStat;
  final int index;

  final Color primaryColor;
  final Color secondaryColor;

  @override
  State<StatBar> createState() => _StatBarState();
}

class _StatBarState extends State<StatBar> {
  late Future delay;

  @override
  void initState() {
    super.initState();
    delay = Future.delayed(
      Duration(
        milliseconds: widget.index * 50,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildStatBarDelay(
      widget.index,
      widget.pokemonStat,
    );
  }

  Widget _buildStatBarDelay(
    int index,
    PokemonStat pokemonStat,
  ) {
    return FutureBuilder(
      future: delay,
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
        color: context.colors.onPrimary,
      ),
      currentValue: value.toDouble(),
      size: 22,
      backgroundColor: widget.secondaryColor,
      progressGradient: LinearGradient(
        colors: [
          context.colors.surface.withOpacity(0.8),
          widget.primaryColor,
        ],
      ),
    );
  }
}
