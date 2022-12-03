import 'package:flutter/material.dart';

import '../../../api/models/pokemon/pokemon.dart';
import '../../../api/models/pokemon/pokemon_species_holder.dart';
import '../../../api/models/pokemon/pokemon_type.dart';
import '../../../dependency_injection_container.dart';
import '../../../extensions/iterable_extension.dart';
import '../../../extensions/pokemon_resource_extension.dart';
import '../../../extensions/string_extension.dart';
import '../../../extensions/type_data_extension.dart';
import '../../../theme/base_theme.dart';
import '../../../theme/poke_app_text.dart';
import '../../shared_widgets/chip_group.dart';
import '../../shared_widgets/expansion_card.dart';
import '../../shared_widgets/pokemon_image.dart';
import '../../shared_widgets/pokemon_table.dart';
import '../../shared_widgets/type_chip.dart';
import '../../shared_widgets/view_models/image_color_view_model.dart';

const kPokemonTileImageHeight = 80.0;

class EvolutionTile extends StatefulWidget {
  EvolutionTile({
    Key? key,
    required this.speciesHolder,
  }) : super(key: key);

  final PokemonSpeciesHolder speciesHolder;

  @override
  State<EvolutionTile> createState() => _EvolutionTileState();
}

class _EvolutionTileState extends State<EvolutionTile> {
  final mainImageColorViewModel = getIt.get<ImageColorViewModel>();
  final spriteImageColorViewModel = getIt.get<ImageColorViewModel>();

  Pokemon? get pokemon => widget.speciesHolder.pokemon_v2_pokemons.firstOrNull();

  @override
  void dispose() {
    mainImageColorViewModel.dispose();
    spriteImageColorViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionCard(
      titleWidget: _buildPokemonCardBody(),
      expandedChildren: _buildPokemonEvolutionTable(),
      bottomWidgetBuilder: (_) {
        return _buildPokemonTypesHolder();
      },
    );
  }

  List<Widget> _buildPokemonEvolutionTable() {
    final evolutionMetaData = widget.speciesHolder.pokemon_v2_pokemonevolutions.map(
      (evolutionMetaData) {
        final evolutionConditions = <Widget>[];

        final trigger = evolutionMetaData.pokemon_v2_evolutiontrigger.normalizeName();
        final location = evolutionMetaData.pokemon_v2_location?.normalizeName();
        final region = evolutionMetaData.pokemon_v2_location?.pokemon_v2_region?.name ?? '';
        final item = evolutionMetaData.pokemon_v2_item?.normalizeName();

        final minLevel = evolutionMetaData.min_level;
        final minHappiness = evolutionMetaData.min_happiness;
        final minBeauty = evolutionMetaData.min_beauty;
        final minAffection = evolutionMetaData.min_affection;
        final knownMoveId = evolutionMetaData.known_move_id;
        final knownMoveTypeId = evolutionMetaData.known_move_type_id;
        final heldItemId = evolutionMetaData.held_item_id;
        final genderId = evolutionMetaData.gender_id;
        final turnUpsideDown = evolutionMetaData.turn_upside_down;
        final tradeSpeciesId = evolutionMetaData.trade_species_id;
        final timeOfDay = evolutionMetaData.time_of_day;
        final relativePhysicalStats = evolutionMetaData.relative_physical_stats;

        if (location != null && location.isNotEmpty) {
          final isFirst = evolutionConditions.isNotEmpty;
          evolutionConditions.add(
            _buildEvolutionCondition(
              'Location :',
              '$location $region',
              isFirst,
            ),
          );
        }
        if (item != null && item.isNotEmpty) {
          final isFirst = evolutionConditions.isNotEmpty;
          evolutionConditions.add(
            _buildEvolutionCondition(
              'Item :',
              item,
              isFirst,
            ),
          );
        }
        if (minLevel != null) {
          final isFirst = evolutionConditions.isNotEmpty;
          evolutionConditions.add(
            _buildEvolutionCondition(
              'Level :',
              minLevel.toString(),
              isFirst,
            ),
          );
        }
        if (minHappiness != null) {
          final isFirst = evolutionConditions.isNotEmpty;
          evolutionConditions.add(
            _buildEvolutionCondition(
              'Happiness :',
              minHappiness.toString(),
              isFirst,
            ),
          );
        }
        if (minBeauty != null) {
          final isFirst = evolutionConditions.isNotEmpty;
          evolutionConditions.add(
            _buildEvolutionCondition(
              'Beauty :',
              minBeauty.toString(),
              isFirst,
            ),
          );
        }
        if (minAffection != null) {
          final isFirst = evolutionConditions.isNotEmpty;
          evolutionConditions.add(
            _buildEvolutionCondition(
              'Affection :',
              minAffection.toString(),
              isFirst,
            ),
          );
        }
        if (knownMoveId != null) {
          final isFirst = evolutionConditions.isNotEmpty;
          evolutionConditions.add(
            _buildEvolutionCondition(
              'Known move id :',
              knownMoveId.toString(),
              isFirst,
            ),
          );
        }
        if (knownMoveTypeId != null) {
          final isFirst = evolutionConditions.isNotEmpty;
          evolutionConditions.add(
            _buildEvolutionCondition(
              'Known move type :',
              PokemonType.getTypeForId(knownMoveTypeId).name.capitalize(),
              isFirst,
            ),
          );
        }
        if (heldItemId != null) {
          final isFirst = evolutionConditions.isNotEmpty;
          evolutionConditions.add(
            _buildEvolutionCondition(
              'Held item :',
              heldItemId.toString(),
              isFirst,
            ),
          );
        }
        if (tradeSpeciesId != null) {
          final isFirst = evolutionConditions.isNotEmpty;
          evolutionConditions.add(
            _buildEvolutionCondition(
              'Trade species id :',
              tradeSpeciesId.toString(),
              isFirst,
            ),
          );
        }
        if (genderId != null) {
          final isFirst = evolutionConditions.isNotEmpty;
          evolutionConditions.add(
            _buildEvolutionCondition(
              'Gender id :',
              genderId.toString(),
              isFirst,
            ),
          );
        }
        if (turnUpsideDown == true) {
          final isFirst = evolutionConditions.isNotEmpty;
          evolutionConditions.add(
            _buildEvolutionCondition(
              'Turn upside down :',
              'true',
              isFirst,
            ),
          );
        }
        if (timeOfDay != null && timeOfDay.isNotEmpty) {
          final isFirst = evolutionConditions.isNotEmpty;
          evolutionConditions.add(
            _buildEvolutionCondition(
              'Time of day :',
              timeOfDay,
              isFirst
            ),
          );
        }
        if (relativePhysicalStats != null) {
          final isFirst = evolutionConditions.isNotEmpty;
          evolutionConditions.add(
            _buildEvolutionCondition(
              'Physical stat :',
              relativePhysicalStats.toString(),
              isFirst,
            ),
          );
        }

        return PokemonTableRowInfo(
          '$trigger  -',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: evolutionConditions,
          ),
        );
      },
    ).toList();
    if (evolutionMetaData.isEmpty) {
      return [];
    }
    return [
      Padding(
        padding: const EdgeInsets.only(
          top: 32,
          left: 8,
          right: 8,
          bottom: 16,
        ),
        child: PokemonTable(
          tableTitle: 'Evolution Methods',
          pokemonTableRowInfoList: evolutionMetaData,
        ),
      ),
    ];
  }

  Widget _buildEvolutionCondition(
    String label,
    String value,
    bool isFirst,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: isFirst ? 0 : 4,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildEvolutionConditionLabel(label),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: _buildEvolutionConditionValue(value),
          ),
        ],
      ),
    );
  }

  Widget _buildEvolutionConditionValue(
    String value,
  ) {
    return Text(
      value,
      style: PokeAppText.body4Style.copyWith(
        color: colors(context).textOnPrimary,
      ),
    );
  }

  Widget _buildEvolutionConditionLabel(
    String label,
  ) {
    return Text(
      label,
      style: PokeAppText.body3Style.copyWith(
        color: colors(context).textOnPrimary,
      ),
    );
  }

  Widget _buildPokemonCardBody() {
    final speciesName = widget.speciesHolder.pokemon_v2_pokemonspeciesnames.first.genus ?? '';
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPokemonImage(),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: _buildPokemonInfo(speciesName),
        ),
        // _buildPokemonId(),
      ],
    );
  }

  Widget _buildPokemonTypesHolder() {
    final _types = pokemon?.pokemon_v2_pokemontypes.toList() ?? [];
    if (_types.isNotEmpty) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ChipGroup(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            chips: _types
                .map(
                  (type) => TypeChip(
                    pokemonType: type.pokemon_v2_type?.pokemonType() ?? PokemonType.unknown,
                    chipType: ChipType.normal,
                  ),
                )
                .toList(),
          )
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _buildPokemonInfo(String speciesName) {
    final pokemonName = pokemon?.name ?? 'Unknown Pokemon';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          pokemonName.capitalize(),
          style: PokeAppText.subtitle1Style.copyWith(
            color: colors(context).textOnForeground,
          ),
        ),
        if (speciesName.isNotEmpty)
          Text(
            speciesName,
            style: PokeAppText.body4Style.copyWith(
              color: colors(context).textOnForeground,
            ),
          ),
        _buildPokemonId(),
      ],
    );
  }

  Widget _buildPokemonId() {
    final pokemonId = pokemon?.id ?? '??';
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        '#${pokemonId.toString()}',
        style: PokeAppText.body6Style.copyWith(
          color: colors(context).textOnForeground,
          height: 1.2,
        ),
      ),
    );
  }

  Widget _buildPokemonImage() {
    final _pokemon = pokemon;
    if (_pokemon != null) {
      return PokemonImage(
        pokemon: _pokemon,
        clipBehavior: Clip.hardEdge,
        size: const Size(
          kPokemonTileImageHeight,
          kPokemonTileImageHeight,
        ),
        imageColorCallback: mainImageColorViewModel.paletteGeneratorStream.add,
        spriteImageColorCallback: spriteImageColorViewModel.paletteGeneratorStream.add,
      );
    } else {
      return const SizedBox();
    }
  }
}
