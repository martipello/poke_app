import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../api/models/pokemon/pokemon.dart';
import '../../api/models/pokemon/pokemon_type.dart';
import '../../dependency_injection_container.dart';
import '../../extensions/build_context_extension.dart';
import '../../extensions/media_query_context_extension.dart';
import '../../extensions/string_extension.dart';
import '../../extensions/type_data_extension.dart';
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
    this.showImage = true,
    this.showTypes = true,
    this.maskColor,
    this.borderColor,
    this.onTap,
  }) : super(key: key);

  final Pokemon pokemon;
  final bool showImage;
  final bool showTypes;
  final Color? maskColor;
  final Color? borderColor;
  final VoidCallback? onTap;

  @override
  State<PokemonTile> createState() => _PokemonTileState();
}

class _PokemonTileState extends State<PokemonTile> {
  final mainImageColorViewModel = getIt.get<ImageColorViewModel>();

  late final cacheNetworkImageProvider = CachedNetworkImageProvider(createImageUrl(widget.pokemon.id ?? 0));

  @override
  Widget build(BuildContext context) {
    const kCardPadding = 32;
    final chipHeight = widget.showTypes ? kChipHeight : 0;
    final tileHeight = kPokemonTileImageHeight + chipHeight + kCardPadding + 16 + 4;

    return SizedBox(
      height: widget.showImage ? tileHeight : null,
      width: kMaxScreenWidth,
      child: FutureBuilder<ColorScheme?>(
          future: mainImageColorViewModel.colorScheme(cacheNetworkImageProvider),
        builder: (context, colorSchemeSnapshot) {
          final colorScheme = colorSchemeSnapshot.data;
            return RoundedCard(
            borderColor: widget.borderColor,
            onTap: widget.onTap ??
                    () {
                  context.closeKeyBoard();
                  Navigator.of(context).pushNamed(
                    PokemonDetailPage.routeName,
                    arguments: PokemonDetailPageArguments(
                      pokemon: widget.pokemon,
                      colorScheme: colorScheme,
                    ),
                  );
                },
            child: _buildPokemonCardBody(colorScheme),
          );
        }
      ),
    );
  }

  Widget _buildPokemonCardBody(
    ColorScheme? colorScheme,
  ) {
    final speciesName = widget.pokemon.pokemon_v2_pokemonspecy?.pokemon_v2_pokemonspeciesnames.first.genus ?? '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.showImage)
              _buildPokemonImage(
                colorScheme,
              ),
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
                  filterType: type.pokemon_v2_type?.pokemonType() ?? PokemonType.unknown,
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
    final nameTextStyle = widget.showImage
        ? PokeAppText.subtitle1Style
        : PokeAppText.subtitle1Style.copyWith(
            height: 1.2,
          );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          pokemonName.capitalize(),
          style: nameTextStyle,
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
    final pokemonId = widget.pokemon.id ?? context.strings.questionMark;
    return Padding(
      padding: const EdgeInsets.only(top: 4, right: 4, left: 16),
      child: Text(
        '#${pokemonId.toString()}',
        style: PokeAppText.body6Style.copyWith(
          height: 1.2,
        ),
      ),
    );
  }

  Widget _buildPokemonImage(
    ColorScheme? colorScheme,
  ) {
    return PokemonImage(
      pokemon: widget.pokemon,
      clipBehavior: Clip.hardEdge,
      maskColor: widget.maskColor,
      size: const Size(
        kPokemonTileImageHeight,
        kPokemonTileImageHeight,
      ),
      imageProvider: cacheNetworkImageProvider,
      colorScheme: colorScheme,
    );
  }
}
