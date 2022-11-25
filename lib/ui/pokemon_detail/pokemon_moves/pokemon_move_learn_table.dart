import 'package:flutter/material.dart';

import '../../../theme/base_theme.dart';
import '../../../theme/poke_app_text.dart';

class PokemonMoveLearnTableRow {
  PokemonMoveLearnTableRow({
    required this.generation,
    required this.level,
    required this.learnMethod,
  });

  final String generation;
  final String level;
  final String learnMethod;
}

class PokemonMoveLearnTable extends StatelessWidget {
  const PokemonMoveLearnTable({
    required this.pokemonMoveLearnTableRows,
    this.tableTitle,
    this.padding,
  });

  final String? tableTitle;
  final EdgeInsets? padding;
  final List<PokemonMoveLearnTableRow> pokemonMoveLearnTableRows;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (tableTitle != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildBookingSubTitle(
                context,
                tableTitle,
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        Table(
          columnWidths: {
            0: const FlexColumnWidth(1),
            1: const IntrinsicColumnWidth(),
            2: const IntrinsicColumnWidth(),
          },
          children: [
            ...pokemonMoveLearnTableRows.map(
              (e) {
                return _buildTableRow(
                  context,
                  generation: e.generation,
                  level: e.level,
                  learnMethod: e.learnMethod,
                  isFirst: e == pokemonMoveLearnTableRows.first,
                  isLast: e == pokemonMoveLearnTableRows.last,
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  TableRow _buildTableRow(
    BuildContext context, {
    required String generation,
    required String level,
    required String learnMethod,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return TableRow(
      children: [
        _buildTableRowText(
          context,
          generation,
          isFirst,
          isLast,
        ),
        _buildTableRowText(
          context,
          level,
          isFirst,
          isLast,
        ),
        _buildTableRowText(
          context,
          learnMethod,
          isFirst,
          isLast,
        ),
      ],
    );
  }

  Widget _buildTableRowText(
    BuildContext context,
    String? key,
    bool isFirst,
    bool isLast,
  ) {
    final topPadding = (isFirst ? 0 : padding?.top ?? 8).toDouble();
    final bottomPadding = (isLast ? 0 : padding?.bottom ?? 8).toDouble();
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding,
        right: 8,
        bottom: bottomPadding,
      ),
      child: Row(
        children: [
          Flexible(
            child: Text(
              key?.trim() ?? '',
              style: PokeAppText.body3Style.copyWith(
                color: colors(context).textOnForeground,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookingSubTitle(
    BuildContext context,
    String? value,
  ) {
    return Text(
      value ?? '',
      style: PokeAppText.subtitle4Style.copyWith(
        color: colors(context).textOnForeground,
      ),
    );
  }
}
