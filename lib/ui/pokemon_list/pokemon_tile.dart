import 'package:flutter/material.dart';

import '../../api/models/pokemon/pokemon.dart';
import '../../api/models/pokemon/pokemon_type.dart';
import '../../extensions/string_extension.dart';
import '../../extensions/type_data_extension.dart';
import '../../theme/poke_app_text.dart';
import '../pokemon_detail/pokemon_detail_page.dart';
import '../shared_widgets/chip_group.dart';
import '../shared_widgets/pokemon_image.dart';
import '../shared_widgets/rounded_card.dart';
import '../shared_widgets/type_chip.dart';

class PokemonTile extends StatelessWidget {
  const PokemonTile({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      onTap: () {
        Navigator.of(context).pushNamed(
          PokemonDetailPage.routeName,
          arguments: PokemonDetailPageArguments(
            pokemon: pokemon,
          ),
        );
      },
      child: _buildPokemonCardBody(),
    );
  }

  Widget _buildPokemonCardBody() {
    final speciesName = pokemon.pokemon_v2_pokemonspecy?.pokemon_v2_pokemonspeciesnames.first.genus ?? '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPokemonImage(),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: _buildPokemonInfo(speciesName),
            ),
            _buildPokemonId(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ChipGroup(
              chips: pokemon.pokemon_v2_pokemontypes
                  .map(
                    (type) => TypeChip(
                      pokemonType: type.pokemon_v2_type?.pokemonType() ?? PokemonType.unknown,
                      chipType: ChipType.normal,
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildPokemonInfo(String speciesName) {
    final pokemonName = pokemon.name ?? 'Unknown Pokemon';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          pokemonName.capitalize(),
          style: PokeAppText.subtitle1Style,
        ),
        if (speciesName.isNotEmpty)
          Text(
            speciesName,
            style: PokeAppText.body4Style,
          ),
      ],
    );
  }

  Widget _buildPokemonId() {
    final pokemonId = pokemon.id ?? '??';
    return Padding(
      padding: const EdgeInsets.only(
        top: 4,
      ),
      child: Text(
        '#${pokemonId.toString()}',
        style: PokeAppText.body6Style,
      ),
    );
  }

  Widget _buildPokemonImage() {
    return PokemonImage(
      pokemon: pokemon,
      clipBehavior: Clip.hardEdge,
      size: const Size(
        80,
        80,
      ),
    );
  }
}
