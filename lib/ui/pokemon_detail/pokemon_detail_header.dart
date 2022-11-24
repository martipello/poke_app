import 'package:flutter/material.dart';

import '../../api/models/pokemon/pokemon.dart';
import '../../api/models/pokemon/pokemon_type.dart';
import '../../extensions/pokemon_extension.dart';
import '../../extensions/string_extension.dart';
import '../../extensions/type_data_extension.dart';
import '../../theme/poke_app_text.dart';
import '../shared_widgets/chip_group.dart';
import '../shared_widgets/pokemon_image.dart';
import '../shared_widgets/type_chip.dart';

class PokemonDetailHeader extends StatelessWidget {
  const PokemonDetailHeader({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return _buildPokemonDetailHeaderBody();
  }

  Widget _buildPokemonDetailHeaderBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildExtraLargeMargin(),
          _buildPokemonImage(),
          _buildMediumMargin(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTitle(),
              _buildPokemonId(),
            ],
          ),
          _buildSmallMargin(),
          _buildSpeciesName(),
          _buildSmallMargin(),
          _buildPokemonTypes(),
          _buildSmallMargin(),
          _buildGeneration(),
          _buildSmallMargin(),
          Row(
            children: [
              _buildHeight(),
              _buildMediumMargin(),
              _buildWeight(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExtraLargeMargin() {
    return const SizedBox(
      height: 72,
    );
  }

  Widget _buildPokemonImage() {
    return PokemonImage(
      pokemon: pokemon,
      size: const Size(
        200,
        200,
      ),
      color: Colors.transparent,
    );
  }

  Widget _buildSmallMargin() => const SizedBox(
        height: 8,
      );

  Widget _buildMediumMargin() => const SizedBox(
        height: 16,
        width: 16,
      );

  Widget _buildTitle() {
    final pokemonName = pokemon.name ?? 'Unknown Pokemon';
    return Text(
      pokemonName.capitalize(),
      style: PokeAppText.title1Style,
    );
  }

  Widget _buildPokemonId() {
    final pokemonId = pokemon.id ?? '??';
    return Text(
      '#${pokemonId.toString()}',
      style: PokeAppText.subtitle4Style,
    );
  }

  Widget _buildSpeciesName() {
    final speciesName =
        pokemon.pokemon_v2_pokemonspecy?.pokemon_v2_pokemonspeciesnames.first.genus ?? 'Unknown Species';
    return Text(
      speciesName.capitalize(),
      style: PokeAppText.title4Style,
    );
  }

  Widget _buildPokemonTypes() {
    return Row(
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
    );
  }

  Widget _buildGeneration() {
    final pokemonGenerationId = pokemon.pokemon_v2_pokemonspecy?.generation_id.toString() ?? 'Unknown';
    return Row(
      children: [
        const Text(
          'Generation : ',
          style: PokeAppText.body3Style,
        ),
        Text(
          pokemonGenerationId,
          style: PokeAppText.body4Style,
        ),
      ],
    );
  }

  Widget _buildHeight() {
    final pokemonHeight = pokemon.pokemonHeight();
    return Row(
      children: [
        const Text(
          'Height : ',
          style: PokeAppText.body3Style,
        ),
        Text(
          pokemonHeight,
          style: PokeAppText.body4Style,
        ),
      ],
    );
  }

  Widget _buildWeight() {
    final pokemonWeight = pokemon.pokemonWeight();
    return Row(
      children: [
        const Text(
          'Weight : ',
          style: PokeAppText.body3Style,
        ),
        Text(
          pokemonWeight,
          style: PokeAppText.body4Style,
        ),
      ],
    );
  }
}
