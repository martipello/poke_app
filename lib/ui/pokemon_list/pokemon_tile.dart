import 'package:flutter/material.dart';

import '../../api/models/pokemon/pokemon.dart';
import '../../api/models/pokemon/pokemon_type.dart';
import '../../extensions/string_extension.dart';
import '../../extensions/type_data_extension.dart';
import '../../theme/poke_app_text.dart';
import '../pokemon_detail/pokemon_detail_page.dart';
import '../shared_widgets/chip_group.dart';
import '../shared_widgets/pokemon_image.dart';
import '../shared_widgets/pokemon_type_chip.dart';
import '../shared_widgets/rounded_card.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              PokemonImage(
                pokemon: pokemon,
                clipBehavior: Clip.hardEdge,
                size: const Size(
                  80,
                  80,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      pokemon.name.capitalize(),
                      style: PokeAppText.subtitle1Style,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      pokemon.id.toString(),
                      style: PokeAppText.body4Style,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ChipGroup(
                chips: pokemon.pokemon_v2_pokemontypes
                    .map(
                      (type) => PokemonTypeChip(
                        type: type.pokemon_v2_type?.pokemonType() ?? PokemonType.unknown,
                        chipType: ChipType.normal,
                      ),
                    )
                    .toList(),
              )
            ],
          )
        ],
      ),
    );
  }
}
