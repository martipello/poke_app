import 'package:flutter/material.dart';

import '../../../api/models/pokemon/damage_type.dart';
import '../../../api/models/pokemon/pokemon_move_holder.dart';
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
import '../shared_widgets/expansion_card.dart';
import '../shared_widgets/poke_divider.dart';
import '../shared_widgets/pokemon_table.dart';
import '../shared_widgets/type_chip.dart';

class PokemonMoveTile extends StatelessWidget {
  PokemonMoveTile({
    Key? key,
    required this.pokemonMove,
  }) : super(key: key);

  final PokemonMoveHolder pokemonMove;

  @override
  Widget build(BuildContext context) {
    final moveLearnMethod = pokemonMove.pokemon_v2_movelearnmethod?.description() ?? '';
    return ExpansionCard(
      bottomWidgetBuilder: _buildMoveTypeChipHolder,
      title: pokemonMove.pokemon_v2_move?.name?.capitalize() ?? '',
      subtitle: moveLearnMethod,
      expandedChildren: _buildPokemonMoveExpanse(
        context,
      ),
    );
  }

  List<Widget> _buildPokemonMoveExpanse(
    BuildContext context,
  ) {
    final description = pokemonMove.pokemon_v2_move?.flavorText() ?? context.strings.noDescription;
    return [
      _buildMediumMargin(),
      if (description.isNotEmpty)
        _buildDescription(
          context,
          description,
        ),
      _buildLargeMargin(),
      _buildLearnMethodSection(context),
      Padding(
        padding: const EdgeInsets.all(16),
        child: PokeDivider(),
      ),
      _buildTMSection(context),
      Padding(
        padding: const EdgeInsets.all(16),
        child: PokeDivider(),
      ),
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
    final healing = (moveMetum?.healing ?? '').toString();
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
          context.strings.healing,
          value: healing,
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

  Widget _buildLearnMethodSection(
    BuildContext context,
  ) {
    final learnMethodsByVersionGroup =
        pokemonMove.pokemon_v2_movelearnmethod?.pokemon_v2_versiongroupmovelearnmethods.groupBy(
              (e) => e.pokemon_v2_movelearnmethod?.name,
            ) ??
            {};

    if (learnMethodsByVersionGroup.isEmpty) {
      return const SizedBox();
    } else if (learnMethodsByVersionGroup.length == 1) {
      final pokemonMoveLearnTableRow = PokemonTableRowInfo(
        learnMethodsByVersionGroup.keys.firstOrNull().capitalize(),
        value: context.strings.allGenerations,
      );
      return _buildLearnMethodTable(
        context,
        [
          pokemonMoveLearnTableRow,
        ],
      );
    } else {
      final pokemonMoveLearnTableRows = learnMethodsByVersionGroup.entries
          .map(
            (moveLearnMethod) => PokemonTableRowInfo(
              moveLearnMethod.value.firstOrNull()?.pokemon_v2_movelearnmethod?.name.capitalize() ?? '',
              value: moveLearnMethod.value
                  .map(
                    (e) => e.pokemon_v2_versiongroup?.normalizeName(),
                  )
                  .join(', '),
            ),
          )
          .toList();

      return _buildLearnMethodTable(
        context,
        pokemonMoveLearnTableRows,
      );
    }
  }

  Widget _buildLearnMethodTable(
    BuildContext context,
    List<PokemonTableRowInfo> pokemonMoveLearnTableRows,
  ) {
    return PokemonTable(
      tableTitle: context.strings.learningMethods,
      padding: const EdgeInsets.only(bottom: 8),
      pokemonTableRowInfoList: pokemonMoveLearnTableRows,
    );
  }

  Widget _buildTMSection(
    BuildContext context,
  ) {
    final tmList = pokemonMove.pokemon_v2_move?.pokemon_v2_machines.toList() ?? [];
    final tmVersionGroupsByMachineNumber = tmList.groupBy(
      (e) => e.machine_number,
    );
    if (tmVersionGroupsByMachineNumber.length == 1) {
      final machineNumber = tmVersionGroupsByMachineNumber.keys.first;
      if (machineNumber != null) {
        final tmTableRow = PokemonTableRowInfo(
          context.strings.tm(
            machineNumber,
          ),
          value: context.strings.allGenerations,
        );
        return _buildTMTable(
          context,
          [tmTableRow],
        );
      }
    } else if (tmList.isNotEmpty) {
      final tmTableRows = tmVersionGroupsByMachineNumber.entries
          .map(
            (tme) => PokemonTableRowInfo(
              context.strings.tm(
                tme.key!,
              ),
              value: tme.value
                  .map(
                    (e) => e.pokemon_v2_versiongroup?.normalizeName(),
                  )
                  .join(', '),
            ),
          )
          .toList();
      return _buildTMTable(
        context,
        tmTableRows,
      );
    }
    return const SizedBox();
  }

  Widget _buildTMTable(
    BuildContext context,
    List<PokemonTableRowInfo> pokemonMoveLearnTableRows,
  ) {
    return PokemonTable(
      tableTitle: context.strings.tmTitle,
      padding: const EdgeInsets.only(bottom: 8),
      pokemonTableRowInfoList: pokemonMoveLearnTableRows,
    );
  }

  Widget _buildMoveDetailsTable(
    BuildContext context,
  ) {
    final accuracy = pokemonMove.pokemon_v2_move?.accuracy;
    final generation = pokemonMove.pokemon_v2_move?.pokemon_v2_generation.generationName();
    final power = (pokemonMove.pokemon_v2_move?.power ?? '').toString();
    final accuracyText = accuracy != null ? '$accuracy%' : '-';
    final pp = (pokemonMove.pokemon_v2_move?.pp ?? '').toString();
    return PokemonTable(
      tableTitle: context.strings.moveDetails,
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
          value: accuracyText,
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
    final moveDamageClass = pokemonMove.pokemon_v2_move?.pokemon_v2_type?.pokemon_v2_movedamageclass;
    final damageType = DamageType.getTypeForId(moveDamageClass?.id ?? 0);
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

  Widget _buildDescription(
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

  Widget _buildLargeMargin() {
    return const SizedBox(
      height: 24,
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
