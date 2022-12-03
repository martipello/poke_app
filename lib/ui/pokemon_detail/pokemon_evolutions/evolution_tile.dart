import 'package:flutter/material.dart';

import '../../../api/models/pokemon/pokemon.dart';
import '../../../api/models/pokemon/pokemon_species_holder.dart';
import '../../../api/models/pokemon/pokemon_type.dart';
import '../../../dependency_injection_container.dart';
import '../../../extensions/iterable_extension.dart';
import '../../../extensions/string_extension.dart';
import '../../../extensions/type_data_extension.dart';
import '../../../theme/base_theme.dart';
import '../../../theme/poke_app_text.dart';
import '../../shared_widgets/chip_group.dart';
import '../../shared_widgets/pokemon_image.dart';
import '../../shared_widgets/rounded_card.dart';
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
    const kCardPadding = 32;
    return SizedBox(
      height: kPokemonTileImageHeight + kChipHeight + kCardPadding + 16 + 4,
      child: RoundedCard(
        child: _buildPokemonCardBody(),
      ),
    );
  }

  Widget _buildPokemonCardBody() {
    final speciesName = widget.speciesHolder.pokemon_v2_pokemonspeciesnames.first.genus ?? '';
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
        _buildPokemonTypesHolder(),
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
            chips: _types.map(
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
      ],
    );
  }

  Widget _buildPokemonId() {
    final pokemonId = pokemon?.id ?? '??';
    return Padding(
      padding: const EdgeInsets.only(top: 4, right: 4, left: 16),
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
