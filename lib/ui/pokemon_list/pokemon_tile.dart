import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../api/models/pokemon/pokemon.dart';
import '../../api/models/pokemon/pokemon_type.dart';
import '../../dependency_injection_container.dart';
import '../../extensions/build_context_extension.dart';
import '../../extensions/string_extension.dart';
import '../../extensions/type_data_extension.dart';
import '../../theme/base_theme.dart';
import '../../theme/poke_app_text.dart';
import '../pokemon_detail/pokemon_detail_page.dart';
import '../shared_widgets/chip_group.dart';
import '../shared_widgets/pokemon_image.dart';
import '../shared_widgets/rounded_card.dart';
import '../shared_widgets/type_chip.dart';
import '../shared_widgets/view_models/image_color_view_model.dart';

const kPokemonTileImageHeight = 80.0;

class PokemonTile extends StatefulWidget {
  PokemonTile({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  State<PokemonTile> createState() => _PokemonTileState();
}

class _PokemonTileState extends State<PokemonTile> {
  final mainImageColorViewModel = getIt.get<ImageColorViewModel>();

  @override
  void dispose() {
    mainImageColorViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PaletteGenerator>(
      stream: mainImageColorViewModel.paletteGeneratorStream,
      builder: (context, mainImagePaletteGeneratorSnapshot) {
        final mainImagePaletteGenerator = mainImagePaletteGeneratorSnapshot.data;
        const kCardPadding = 32;
        return SizedBox(
          height: kPokemonTileImageHeight + kChipHeight + kCardPadding + 16 + 4,
          child: RoundedCard(
            onTap: () {
              context.closeKeyBoard();
              Navigator.of(context).pushNamed(
                PokemonDetailPage.routeName,
                arguments: PokemonDetailPageArguments(
                  pokemon: widget.pokemon,
                  mainImagePaletteGenerator: mainImagePaletteGenerator,
                ),
              );
            },
            child: _buildPokemonCardBody(),
          ),
        );
      },
    );
  }

  Widget _buildPokemonCardBody() {
    final speciesName = widget.pokemon.pokemon_v2_pokemonspecy?.pokemon_v2_pokemonspeciesnames.first.genus ?? '';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ChipGroup(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          chips: widget.pokemon.pokemon_v2_pokemontypes
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

  Widget _buildPokemonInfo(String speciesName) {
    final pokemonName = widget.pokemon.name ?? context.strings.unknownPokemon;
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
    final pokemonId = widget.pokemon.id ?? context.strings.questionMark;
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
    return PokemonImage(
      pokemon: widget.pokemon,
      clipBehavior: Clip.hardEdge,
      size: const Size(
        kPokemonTileImageHeight,
        kPokemonTileImageHeight,
      ),
      imageColorCallback: mainImageColorViewModel.paletteGeneratorStream.add,
    );
  }
}
