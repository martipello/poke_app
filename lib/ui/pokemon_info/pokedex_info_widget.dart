import 'package:flutter/material.dart';

import '../../../api/models/pokemon/pokemon.dart';
import '../../../api/models/pokemon/pokemon_resource.dart';
import '../../../extensions/build_context_extension.dart';
import '../../../extensions/pokemon_extension.dart';
import '../../../extensions/pokemon_resource_extension.dart';
import '../../../theme/poke_app_text.dart';
import '../shared_widgets/poke_divider.dart';
import '../shared_widgets/pokemon_expansion_tile.dart';

class PokedexInfoWidget extends StatelessWidget {
  const PokedexInfoWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final pokedexEntries = pokemon.pokedexEntries();
    if (pokedexEntries.isNotEmpty) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTitle(context),
          _buildExpansionTile(
            context,
            pokedexEntries,
          ),
          _buildDivider(
            horizontalPadding: 8,
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _buildTitle(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Text(
        context.strings.pokedex,
        style: PokeAppText.subtitle3Style,
      ),
    );
  }

  Widget _buildExpansionTile(
    BuildContext context,
    List<PokemonResource> pokedexEntries,
  ) {
    final _firstEntry = pokedexEntries.first;
    return PokemonExpansionTile(
      canExpand: pokedexEntries.length > 1,
      title: _buildExpansionTileTitle(
        context,
        _firstEntry.versionGroupName(),
        titleTextStyle: PokeAppText.body3Style,
      ),
      subtitle: _buildExpansionTileSubtitle(
        context,
        _firstEntry,
      ),
      children: _buildSubsequentPokedexEntries(
        context,
        pokedexEntries,
      ),
    );
  }

  List<Widget> _buildSubsequentPokedexEntries(
    BuildContext context,
    List<PokemonResource> pokedexEntries,
  ) {
    return pokedexEntries.map(
      (entry) {
        if (entry == pokedexEntries.first) {
          return const SizedBox();
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildDivider(),
            _buildExpansionTileTitle(
              context,
              entry.versionGroupName(),
              titleTextStyle: PokeAppText.body3Style,
            ),
            _buildExtraSmallMargin(),
            _buildExpansionTileSubtitle(
              context,
              entry,
            ),
          ],
        );
      },
    ).toList();
  }

  Widget _buildDivider({
    double horizontalPadding = 16,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: horizontalPadding,
      ),
      child: PokeDivider(
        thickness: horizontalPadding == 16 ? kThicknessThin : kThicknessThick,
      ),
    );
  }

  Widget _buildExpansionTileTitle(
    BuildContext context,
    String title, {
    TextStyle? titleTextStyle,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 4,
        bottom: 4,
      ),
      child: Text(
        title,
        style: titleTextStyle ??
            PokeAppText.subtitle3Style,
      ),
    );
  }

  Widget _buildExpansionTileSubtitle(
    BuildContext context,
    PokemonResource resource,
  ) {
    return Text(
      resource.flavorText(),
      style: PokeAppText.body4Style,
    );
  }

  Widget _buildExtraSmallMargin() {
    return const SizedBox(
      height: 4,
    );
  }
}
