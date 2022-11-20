import 'package:flutter/material.dart';

import '../../../api/models/pokemon/pokemon.dart';
import '../../../api/models/pokemon/pokemon_resource.dart';
import '../../../extensions/build_context_extension.dart';
import '../../../extensions/pokemon_extension.dart';
import '../../../extensions/pokemon_resource_extension.dart';
import '../../../theme/poke_app_text.dart';
import '../../shared_widgets/poke_divider.dart';
import '../../shared_widgets/pokemon_expansion_tile.dart';

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTitle(context),
          _buildExpansionTile(
            pokedexEntries,
            context,
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
    List<PokemonResource> pokedexEntries,
    BuildContext context,
  ) {
    final _firstEntry = pokedexEntries.first;
    return PokemonExpansionTile(
      canExpand: pokedexEntries.length > 1,
      title: _buildExpansionTileTitle(
        _firstEntry.versionGroupName(),
        titleTextStyle: PokeAppText.body3Style,
      ),
      subtitle: _buildExpansionTileSubtitle(
        _firstEntry,
      ),
      children: _buildSubsequentPokedexEntries(
        pokedexEntries,
      ),
    );
  }

  List<Widget> _buildSubsequentPokedexEntries(
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
              entry.versionGroupName(),
              titleTextStyle: PokeAppText.body3Style,
            ),
            _buildExtraSmallMargin(),
            _buildExpansionTileSubtitle(entry),
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
      child: PokeDivider(),
    );
  }

  Widget _buildExpansionTileTitle(
    String title, {
    TextStyle titleTextStyle = PokeAppText.subtitle3Style,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 4,
        bottom: 4,
      ),
      child: Text(
        title,
        style: titleTextStyle,
      ),
    );
  }

  Widget _buildExpansionTileSubtitle(
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
