import 'package:flutter/material.dart';

import '../../../api/models/pokemon/damage_type.dart';
import '../../../api/models/pokemon/pokemon_move_holder.dart';
import '../../../api/models/pokemon/pokemon_resource.dart';
import '../../../api/models/pokemon/pokemon_type.dart';
import '../../../extensions/build_context_extension.dart';
import '../../../extensions/int_extension.dart';
import '../../../extensions/iterable_extension.dart';
import '../../../extensions/move_extension.dart';
import '../../../extensions/move_learn_method_extension.dart';
import '../../../extensions/pokemon_resource_extension.dart';
import '../../../extensions/string_extension.dart';
import '../../../theme/base_theme.dart';
import '../../../theme/poke_app_text.dart';
import '../../shared_widgets/expansion_card.dart';
import '../../shared_widgets/poke_divider.dart';
import '../../shared_widgets/pokemon_table.dart';
import '../../shared_widgets/type_chip.dart';
import 'pokemon_move_learn_table.dart';

class PokemonMoveTile extends StatelessWidget {
  PokemonMoveTile({
    Key? key,
    required this.pokemonMove,
  }) : super(key: key);

  final PokemonMoveHolder pokemonMove;

  @override
  Widget build(BuildContext context) {
    final description = pokemonMove.pokemon_v2_move?.flavorText() ?? context.strings.noDescription;
    return ExpansionCard(
      bottomWidgetBuilder: _buildMoveTypeChipHolder,
      title: pokemonMove.pokemon_v2_move?.name?.capitalize() ?? '',
      subtitle: description,
      expandedChildren: _buildPokemonMoveExpanse(
        context,
      ),
    );
  }

  List<Widget> _buildPokemonMoveExpanse(
    BuildContext context,
  ) {
    final moveLearnMethod = pokemonMove.pokemon_v2_movelearnmethod?.description() ?? '';
    return [
      _buildMediumMargin(),
      if (moveLearnMethod.isNotEmpty)
        _buildMoveLearnMethod(
          context,
          moveLearnMethod,
        ),
      _buildMediumMargin(),
      _buildLearnMethodTable(context),
      Padding(
        padding: const EdgeInsets.all(16),
        child: PokeDivider(),
      ),
      _buildMoveDetailHeader(
        context,
      ),
      _buildMediumMargin(),
      _buildMoveDetailsTable(
        context,
      ),
      Padding(
        padding: const EdgeInsets.all(16),
        child: PokeDivider(),
      ),
      _buildMoveMetumTable(
        context,
      ),
      _buildSmallMargin(),
    ];
  }

  Widget _buildMoveMetumTable(
    BuildContext context,
  ) {
    final moveMetum = pokemonMove.pokemon_v2_move?.pokemon_v2_movemetum;
    final ailmentName = moveMetum?.pokemon_v2_movemetaailment?.name ?? '';
    final criticalRate = moveMetum?.crit_rate?.toPercentageDisplayName();
    final ailmentChance = moveMetum?.ailment_chance?.toPercentageDisplayName();
    final flinchChance = moveMetum?.flinch_chance?.toPercentageDisplayName();
    final drain = (moveMetum?.drain ?? '').toString();
    final minHits = (moveMetum?.min_hits ?? '').toString();
    final maxHits = (moveMetum?.max_hits ?? '').toString();
    final minTurns = (moveMetum?.min_turns ?? '').toString();
    final maxTurns = (moveMetum?.max_turns ?? '').toString();
    final statChance = (moveMetum?.stat_chance ?? '').toString();
    return PokemonTable(
      tableTitle: context.strings.moveMetaData,
      padding: const EdgeInsets.only(bottom: 8),
      pokemonTableRowInfoList: [
        PokemonTableRowInfo(
          context.strings.ailment,
          value: ailmentName,
        ),
        PokemonTableRowInfo(
          context.strings.criticalRate,
          value: criticalRate,
        ),
        PokemonTableRowInfo(
          context.strings.ailmentChance,
          value: ailmentChance,
        ),
        PokemonTableRowInfo(
          context.strings.flinchChance,
          value: flinchChance,
        ),
        PokemonTableRowInfo(
          context.strings.statChance,
          value: statChance,
        ),
        PokemonTableRowInfo(
          context.strings.drain,
          value: drain,
        ),
        PokemonTableRowInfo(
          context.strings.minHits,
          value: minHits,
        ),
        PokemonTableRowInfo(
          context.strings.maxHits,
          value: maxHits,
        ),
        PokemonTableRowInfo(
          context.strings.minTurns,
          value: minTurns,
        ),
        PokemonTableRowInfo(
          context.strings.maxTurns,
          value: maxTurns,
        ),
      ],
    );
  }

  Widget _buildLearnMethodTable(
    BuildContext context,
  ) {
    final pokemonMoveLearnTableRows = pokemonMove.pokemon_v2_movelearnmethod?.pokemon_v2_movelearnmethoddescriptions
            .map(
              (moveLearnMethod) => PokemonMoveLearnTableRow(
                generation: moveLearnMethod.pokemon_v2_versiongroup?.name ?? '',
                level: 'level',
                learnMethod: moveLearnMethod.pokemon_v2_movelearnmethod?.name ?? '',
              ),
            )
            .toList() ??
        [];
    return PokemonMoveLearnTable(
      tableTitle: context.strings.learningMethods,
      padding: const EdgeInsets.only(bottom: 8),
      pokemonMoveLearnTableRows: pokemonMoveLearnTableRows,
    );
  }

  Widget _buildMoveDetailsTable(
    BuildContext context,
  ) {
    final generation = pokemonMove.pokemon_v2_move?.pokemon_v2_generation.generationName();
    final power = (pokemonMove.pokemon_v2_move?.power ?? '').toString();
    final accuracy = '${(pokemonMove.pokemon_v2_move?.accuracy ?? '-').toString()}%';
    final pp = (pokemonMove.pokemon_v2_move?.pp ?? '').toString();
    return PokemonTable(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
      pokemonTableRowInfoList: [
        PokemonTableRowInfo(
          context.strings.generation,
          value: generation,
        ),
        PokemonTableRowInfo(
          context.strings.power,
          value: power,
        ),
        PokemonTableRowInfo(
          context.strings.accuracy,
          value: accuracy,
        ),
        PokemonTableRowInfo(
          context.strings.pp,
          value: pp,
        ),
      ],
    );
  }

  Widget _buildMoveTypeChipHolder(
    bool isExpanded,
  ) {
    final moveTypeChips = _buildMoveTypeChips(isExpanded);
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: moveTypeChips,
      ),
    );
  }

  List<Widget> _buildMoveTypeChips(
    bool isExpanded,
  ) {
    final moveType = PokemonType.getTypeForId(
      pokemonMove.pokemon_v2_move?.pokemon_v2_type?.id ?? 0,
    );
    final moveDamageClass = pokemonMove
            .pokemon_v2_move?.pokemon_v2_type?.pokemon_v2_movedamageclass?.pokemon_v2_movedamageclassdescriptions
            .toList() ??
        <PokemonResource>[];
    final damageType = moveDamageClass
        .map(
          (e) => DamageType.getTypeForId(e.pokemon_v2_movedamageclass?.id ?? 0),
        )
        .firstOrNull();
    final moveTypeChips = [damageType, Object(), moveType].map(
      (type) {
        if (type is PokemonType) {
          return _buildTypeChip(
            pokemonType: type,
            isExpanded: isExpanded,
          );
        }
        if (type is DamageType) {
          return _buildTypeChip(
            damageType: type,
            isExpanded: isExpanded,
          );
        }
        return const SizedBox(
          width: 8,
        );
      },
    ).toList();
    return moveTypeChips;
  }

  Widget _buildTypeChip({
    DamageType? damageType,
    PokemonType? pokemonType,
    required bool isExpanded,
  }) {
    return TypeChip(
      chipType: ChipType.expansion,
      damageType: damageType,
      pokemonType: pokemonType,
      isExpanded: isExpanded,
    );
  }

  Widget _buildMoveDetailHeader(
    BuildContext context,
  ) {
    return Text(
      context.strings.moveDetails,
      style: PokeAppText.subtitle4Style.copyWith(
        color: colors(context).textOnForeground,
      ),
    );
  }

  Widget _buildMoveLearnMethod(
    BuildContext context,
    String description,
  ) {
    return Text(
      description,
      style: PokeAppText.body4Style.copyWith(
        color: colors(context).textOnForeground,
      ),
    );
  }

  Widget _buildMediumMargin() {
    return const SizedBox(
      height: 16,
    );
  }

  Widget _buildSmallMargin() {
    return const SizedBox(
      height: 8,
    );
  }
}
