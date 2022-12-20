import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../api/models/pokemon/pokemon.dart';
import '../../../api/models/pokemon/pokemon_resource.dart';
import '../../../extensions/build_context_extension.dart';
import '../../../extensions/iterable_extension.dart';
import '../../../theme/base_theme.dart';
import '../../../theme/poke_app_text.dart';
import '../../api/models/pokemon/encounter.dart';
import '../../api/models/pokemon/encounter_slot.dart';
import '../../dependency_injection_container.dart';
import '../../extensions/pokemon_resource_extension.dart';
import '../locations/open_location_button.dart';
import '../shared_widgets/poke_divider.dart';
import '../shared_widgets/pokeball_loading_widget.dart';
import '../shared_widgets/pokemon_expansion_tile.dart';
import '../shared_widgets/pokemon_table.dart';
import 'view_models/pokemon_encounter_view_model.dart';

class PokemonEncounterWidget extends StatefulWidget {
  const PokemonEncounterWidget({
    Key? key,
    required this.pokemon,
    this.primaryColor,
    this.secondaryColor,
  }) : super(key: key);

  final Pokemon pokemon;
  final Color? primaryColor;
  final Color? secondaryColor;

  @override
  State<PokemonEncounterWidget> createState() => _PokemonEncounterWidgetState();
}

class _PokemonEncounterWidgetState extends State<PokemonEncounterWidget> {
  final encounterViewModel = getIt.get<PokemonEncounterViewModel>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<PokemonResource, Encounter>>(
      future: encounterViewModel.groupEncountersByVersion(
        widget.pokemon.pokemon_v2_encounters,
      ),
      builder: (context, snapshot) {
        final encountersByVersion = snapshot.data ?? {};
        if (snapshot.connectionState == ConnectionState.waiting || encountersByVersion.values.isEmpty) {
          return SliverToBoxAdapter(
            child: _loadingWidget(),
          );
        }
        if (encountersByVersion.isEmpty) {
          return const SliverToBoxAdapter(
            child: SizedBox(),
          );
        }
        return MultiSliver(
          children: [
            SliverToBoxAdapter(
              child: _buildTitle(context),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: encountersByVersion.length,
                (context, index) {
                  final encounterWithVersion = encountersByVersion.entries.get(index);
                  if (encounterWithVersion.value.encounterSlotAndLocations.isEmpty) {
                    return const SizedBox();
                  }
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (index != 0)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: _buildDivider(
                            hasThinDivider: true,
                          ),
                        ),
                      PokemonExpansionTile(
                        canExpand: true,
                        title: _buildEncounterTileTitle(
                          context,
                          encounterWithVersion.value,
                        ),
                        children: [
                          _buildEncounterDetails(
                            context,
                            encounterWithVersion.value,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTitle(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Text(
        context.strings.encounters,
        style: PokeAppText.subtitle3Style,
      ),
    );
  }

  Widget _buildEncounterTileTitle(
    BuildContext context,
    Encounter encounter,
  ) {
    final encounterLabel = encounter.pokemon_v2_version.normalizeName();
    return Text(
      encounterLabel.isNotEmpty ? encounterLabel : context.strings.unknownVersion,
      style: PokeAppText.subtitle4Style.copyWith(
        color: colors(context).textOnForeground,
      ),
    );
  }

  Widget _buildEncounterDetails(
    BuildContext context,
    Encounter encounter,
  ) {
    final encounterSlotsAndLocations = encounter.encounterSlotAndLocations;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildMinMaxLevel(
          context,
          encounter,
        ),
        _buildEncounterTitle(context),
        ...encounterSlotsAndLocations.entries.mapIndexed(
          (p0, index) {
            final encounterSlot = p0.value;
            final encounterLocation = p0.key;
            return _buildEncounterDetail(
              context,
              encounterSlot,
              encounterLocation,
              index == encounterSlotsAndLocations.values.length - 1,
            );
          },
        ),
      ],
    );
  }

  Widget _buildEncounterDetail(
    BuildContext context,
    EncounterSlot encounterSlot,
    PokemonResource encounterLocation,
    bool isLast,
  ) {
    final encounterMethod =
        encounterSlot.pokemon_v2_encountermethod?.pokemon_v2_encountermethodnames.firstOrNull().normalizeName() ?? '';
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PokemonTable(
          pokemonTableRowInfoList: [
            PokemonTableRowInfo(
              context.strings.location,
              value: encounterLocation.normalizeName(),
            ),
            PokemonTableRowInfo(
              context.strings.method,
              value: encounterMethod,
            ),
            PokemonTableRowInfo(
              context.strings.rarity,
              value: (encounterSlot.rarity ?? 0).toString(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildOpenLocationButton(
              encounterLocation.version_id ?? 0,
            ),
          ],
        ),
        if (!isLast)
          _buildDivider(
            hasThinDivider: true,
          )
      ],
    );
  }

  Widget _buildOpenLocationButton(
    int generationId,
  ) {
    return OpenLocationButton(
      generationId: generationId,
      primaryColor: widget.primaryColor,
      secondaryColor: widget.secondaryColor,
    );
  }

  Padding _buildEncounterTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: Text(
        context.strings.encounters,
        style: PokeAppText.subtitle4Style.copyWith(
          color: colors(context).textOnForeground,
        ),
      ),
    );
  }

  Widget _buildMinMaxLevel(
    BuildContext context,
    Encounter encounter,
  ) {
    final minLevel = (encounter.min_level ?? 0).toString();
    final maxLevel = (encounter.max_level ?? 0).toString();

    return PokemonTable(
      padding: const EdgeInsets.only(bottom: 8),
      pokemonTableRowInfoList: [
        if (minLevel.isNotEmpty)
          PokemonTableRowInfo(
            context.strings.minLevel,
            value: minLevel,
          ),
        if (maxLevel.isNotEmpty)
          PokemonTableRowInfo(
            context.strings.maxLevel,
            value: maxLevel,
          ),
      ],
    );
  }

  Widget _loadingWidget() {
    return const SizedBox(
      height: 108,
      child: Center(
        child: PokeballLoadingWidget(
          size: Size(
            42,
            42,
          ),
        ),
      ),
    );
  }

  Widget _buildDivider({
    bool hasThinDivider = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 16,
      ),
      child: PokeDivider(
        thickness: hasThinDivider ? kThicknessThin : kThicknessThick,
      ),
    );
  }
}
