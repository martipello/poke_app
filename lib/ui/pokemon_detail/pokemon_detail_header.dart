import 'package:flutter/material.dart';

import '../../api/models/pokemon/pokemon.dart';
import '../../api/models/pokemon/pokemon_type.dart';
import '../../extensions/build_context_extension.dart';
import '../../extensions/pokemon_extension.dart';
import '../../extensions/string_extension.dart';
import '../../extensions/type_data_extension.dart';
import '../../theme/base_theme.dart';
import '../../theme/poke_app_text.dart';
import '../shared_widgets/chip_group.dart';
import '../shared_widgets/pokemon_image.dart';
import '../shared_widgets/type_chip.dart';
import '../shared_widgets/view_constraint.dart';

const kPokemonDetailImageHeight = 200.0;

class PokemonDetailHeader extends StatelessWidget {
  const PokemonDetailHeader({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return _buildPokemonDetailHeaderBody(
      context,
    );
  }

  Widget _buildPokemonDetailHeaderBody(
    BuildContext context,
  ) {
    return ViewConstraint(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildExtraLargeMargin,
            _buildPokemonImage(),
            _buildMediumMargin,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTitle(context),
                _buildPokemonId(context),
              ],
            ),
            _buildSmallMargin,
            _buildSpeciesName(context),
            _buildSmallMargin,
            _buildPokemonTypes(),
            _buildSmallMargin,
            _buildGeneration(context),
            _buildSmallMargin,
            Row(
              children: [
                _buildHeight(context),
                _buildMediumMargin,
                _buildWeight(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPokemonImage() {
    return PokemonImage(
      pokemon: pokemon,
      size: const Size(
        kPokemonDetailImageHeight,
        kPokemonDetailImageHeight,
      ),
      color: Colors.transparent,
    );
  }

  Widget _buildTitle(
    BuildContext context,
  ) {
    final pokemonName = pokemon.name ?? context.strings.unknownPokemon;
    return Text(
      pokemonName.capitalize(),
      style: PokeAppText.title1Style.copyWith(
        color: colors(context).textOnForeground,
      ),
    );
  }

  Widget _buildPokemonId(
    BuildContext context,
  ) {
    final pokemonId = pokemon.id ?? '??';
    return Text(
      '#${pokemonId.toString()}',
      style: PokeAppText.subtitle4Style.copyWith(
        color: colors(context).textOnForeground,
      ),
    );
  }

  Widget _buildSpeciesName(
    BuildContext context,
  ) {
    final speciesName =
        pokemon.pokemon_v2_pokemonspecy?.pokemon_v2_pokemonspeciesnames.first.genus ?? 'Unknown species';
    return Text(
      speciesName.capitalize(),
      style: PokeAppText.title4Style.copyWith(
        color: colors(context).textOnForeground,
      ),
    );
  }

  Widget _buildPokemonTypes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ChipGroup(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
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

  Widget _buildGeneration(
    BuildContext context,
  ) {
    final pokemonGenerationId = pokemon.pokemon_v2_pokemonspecy?.generation_id.toString() ?? 'Unknown';
    return Row(
      children: [
        Text(
          context.strings.generationLabel,
          style: PokeAppText.body3Style.copyWith(
            color: colors(context).textOnForeground,
          ),
        ),
        _buildExtraSmallMedium,
        Text(
          pokemonGenerationId,
          style: PokeAppText.body4Style.copyWith(
            color: colors(context).textOnForeground,
          ),
        ),
      ],
    );
  }

  Widget _buildHeight(
    BuildContext context,
  ) {
    final pokemonHeight = pokemon.pokemonHeight();
    return Row(
      children: [
        Text(
          context.strings.heightLabel,
          style: PokeAppText.body3Style.copyWith(
            color: colors(context).textOnForeground,
          ),
        ),
        _buildExtraSmallMedium,
        Text(
          pokemonHeight,
          style: PokeAppText.body4Style.copyWith(
            color: colors(context).textOnForeground,
          ),
        ),
      ],
    );
  }

  Widget _buildWeight(
    BuildContext context,
  ) {
    final pokemonWeight = pokemon.pokemonWeight();
    return Row(
      children: [
        Text(
          context.strings.weightLabel,
          style: PokeAppText.body3Style.copyWith(
            color: colors(context).textOnForeground,
          ),
        ),
        _buildExtraSmallMedium,
        Text(
          pokemonWeight,
          style: PokeAppText.body4Style.copyWith(
            color: colors(context).textOnForeground,
          ),
        ),
      ],
    );
  }

  Widget get _buildExtraSmallMedium => const SizedBox(
    width: 4,
  );

  Widget get _buildSmallMargin => const SizedBox(
        height: 8,
      );

  Widget get _buildMediumMargin => const SizedBox(
        height: 16,
        width: 16,
      );

  Widget get _buildExtraLargeMargin {
    return const SizedBox(
      height: 72,
    );
  }

}
