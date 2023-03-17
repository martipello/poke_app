import 'package:flutter/material.dart';

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
import '../shared_widgets/view_constraint.dart';
import '../shared_widgets/view_models/image_color_view_model.dart';

const kPokemonTileImageHeight = 80.0;

class PokemonTile extends StatefulWidget {
  PokemonTile({
    Key? key,
    required this.pokemon,
    this.maskColor,
    this.onTap,
    this.showImage = true,
    this.showTypes = true,
  }) : super(key: key);

  final Pokemon pokemon;
  final VoidCallback? onTap;
  final Color? maskColor;
  final bool showImage;
  final bool showTypes;

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
    const kCardPadding = 32;
    final chipHeight = widget.showTypes ? kChipHeight : 0;
    final pokemonTileImageHeight = widget.showImage ? kPokemonTileImageHeight : 56.0;
    final tileHeight = pokemonTileImageHeight + chipHeight + kCardPadding + 16 + 4;
    return StreamBuilder<List<int>>(
      stream: mainImageColorViewModel.colorListStream,
      builder: (context, colorListSnapshot) {
        final colorList = colorListSnapshot.data ?? [];
        return ViewConstraint(
          child: SizedBox(
            height: tileHeight,
            child: RoundedCard(
              onTap: widget.onTap ?? () {
                      context.closeKeyBoard();
                      Navigator.of(context).pushNamed(
                        PokemonDetailPage.routeName,
                        arguments: PokemonDetailPageArguments(
                          pokemon: widget.pokemon,
                          colorList: colorList,
                        ),
                      );
                    },
              child: _buildPokemonCardBody(),
            ),
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
            if (widget.showImage)
            _buildPokemonImage(),
            if (widget.showImage)
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: _buildPokemonInfo(speciesName),
            ),
            if (widget.showTypes) _buildPokemonId(),
          ],
        ),
        if (widget.showTypes) _buildPokemonTypesHolder(),
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
      maskColor: widget.maskColor,
      size: const Size(
        kPokemonTileImageHeight,
        kPokemonTileImageHeight,
      ),
      imageColorCallback: widget.maskColor == null ? mainImageColorViewModel.colorListStream.add : null,
    );
  }
}
