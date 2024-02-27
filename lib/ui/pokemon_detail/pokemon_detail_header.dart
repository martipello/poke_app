import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../api/models/pokemon/pokemon.dart';
import '../../api/models/pokemon/pokemon_type.dart';
import '../../extensions/build_context_extension.dart';
import '../../extensions/pokemon_extension.dart';
import '../../extensions/string_extension.dart';
import '../../extensions/type_data_extension.dart';
import '../../theme/poke_app_text.dart';
import '../pokemon_list/pokemon_tile.dart';
import '../shared_widgets/chip_group.dart';
import '../shared_widgets/pokemon_image.dart';
import '../shared_widgets/type_chip.dart';
import '../shared_widgets/view_constraint.dart';

const kPokemonDetailImageHeight = 200.0;

class PokemonDetailHeader extends StatefulWidget {
  PokemonDetailHeader({
    Key? key,
    required this.pokemon,
    required this.primaryColor,
  }) : super(key: key);

  final Pokemon pokemon;
  final Color primaryColor;

  @override
  State<PokemonDetailHeader> createState() => _PokemonDetailHeaderState();
}

class _PokemonDetailHeaderState extends State<PokemonDetailHeader> {
  late final cacheNetworkImageProvider = CachedNetworkImageProvider(
    createImageUrl(widget.pokemon.id ?? 0),
    maxHeight: kPokemonTileImageHeight.cacheSize(context),
  );

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
            _buildPokemonImage(context),
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
            _buildMediumMargin,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: FloatingActionButton(
                    backgroundColor: widget.primaryColor,
                    onPressed: () async {
                      final player = AudioPlayer()..setUrl(createAudioUrl(widget.pokemon.id ?? 0));
                      player.play();
                    },
                    child: Icon(
                      Icons.play_arrow,
                      color: context.colors.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPokemonImage(BuildContext context) {
    return PokemonImage(
      pokemon: widget.pokemon,
      size: const Size(
        kPokemonDetailImageHeight,
        kPokemonDetailImageHeight,
      ),
      imageProvider: cacheNetworkImageProvider,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Colors.transparent,
        onPrimary: context.colors.onSurface,
        secondary: Colors.transparent,
        onSecondary: context.colors.onSurface,
        error: Colors.transparent,
        onError: context.colors.onSurface,
        background: Colors.transparent,
        onBackground: context.colors.onSurface,
        surface: Colors.transparent,
        onSurface: context.colors.onSurface,
        primaryContainer: Colors.transparent,
      ),
    );
  }

  Widget _buildTitle(
    BuildContext context,
  ) {
    final pokemonName = widget.pokemon.name ?? context.strings.unknownPokemon;
    return Text(
      pokemonName.capitalize(),
      style: PokeAppText.title1Style,
    );
  }

  Widget _buildPokemonId(
    BuildContext context,
  ) {
    final pokemonId = widget.pokemon.id ?? '??';
    return Text(
      '#${pokemonId.toString()}',
      style: PokeAppText.subtitle4Style,
    );
  }

  Widget _buildSpeciesName(
    BuildContext context,
  ) {
    final speciesName =
        widget.pokemon.pokemon_v2_pokemonspecy?.pokemon_v2_pokemonspeciesnames.first.genus ?? 'Unknown species';
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
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
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

  Widget _buildGeneration(
    BuildContext context,
  ) {
    final pokemonGenerationId = widget.pokemon.pokemon_v2_pokemonspecy?.generation_id.toString() ?? 'Unknown';
    return Row(
      children: [
        Text(
          context.strings.generationLabel,
          style: PokeAppText.body3Style,
        ),
        _buildExtraSmallMedium,
        Text(
          pokemonGenerationId,
          style: PokeAppText.body4Style,
        ),
      ],
    );
  }

  Widget _buildHeight(
    BuildContext context,
  ) {
    final pokemonHeight = widget.pokemon.pokemonHeight();
    return Row(
      children: [
        Text(
          context.strings.heightLabel,
          style: PokeAppText.body3Style,
        ),
        _buildExtraSmallMedium,
        Text(
          pokemonHeight,
          style: PokeAppText.body4Style,
        ),
      ],
    );
  }

  Widget _buildWeight(
    BuildContext context,
  ) {
    final pokemonWeight = widget.pokemon.pokemonWeight();
    return Row(
      children: [
        Text(
          context.strings.weightLabel,
          style: PokeAppText.body3Style,
        ),
        _buildExtraSmallMedium,
        Text(
          pokemonWeight,
          style: PokeAppText.body4Style,
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
