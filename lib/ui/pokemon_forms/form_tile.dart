import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../api/models/pokemon/pokemon.dart';
import '../../../api/models/pokemon/pokemon_ability_holder.dart';
import '../../../api/models/pokemon/pokemon_form.dart';
import '../../../api/models/pokemon/pokemon_form_with_version_group.dart';
import '../../../api/models/pokemon/pokemon_species.dart';
import '../../../api/models/pokemon/pokemon_type.dart';
import '../../../dependency_injection_container.dart';
import '../../../extensions/build_context_extension.dart';
import '../../../extensions/iterable_extension.dart';
import '../../../extensions/string_extension.dart';
import '../../../extensions/type_data_extension.dart';
import '../../../theme/poke_app_text.dart';
import '../pokemon_detail/pokemon_detail_page.dart';
import '../pokemon_info/ability_tile.dart';
import '../shared_widgets/chip_group.dart';
import '../shared_widgets/expansion_card.dart';
import '../shared_widgets/poke_divider.dart';
import '../shared_widgets/pokemon_image.dart';
import '../shared_widgets/type_chip.dart';
import '../shared_widgets/view_models/image_color_view_model.dart';

const kPokemonTileImageHeight = 80.0;

class FormTile extends StatelessWidget {
  FormTile({
    Key? key,
    required this.pokemonFormWithVersionGroup,
  }) : super(key: key);

  late final cacheNetworkImageProvider = CachedNetworkImageProvider(createImageUrl(pokemon?.id ?? 0));

  final PokemonFormWithVersionGroup pokemonFormWithVersionGroup;

  final imageColorViewModel = getIt.get<ImageColorViewModel>();

  PokemonForm? get pokemonForm =>
      pokemonFormWithVersionGroup.pokemon_v2_pokemonformnames.firstOrNull()?.pokemon_v2_pokemonform;

  Pokemon? get pokemon => pokemonForm?.pokemon_v2_pokemon;

  String get pokemonName => pokemonForm?.pokemon_v2_pokemonformnames.firstOrNull()?.pokemon_name ?? 'Unknown pokemon';

  String get formName => pokemonForm?.pokemon_v2_pokemonformnames.firstOrNull()?.name ?? 'Unknown form';

  List<PokemonAbilityHolder> get abilities => pokemon?.pokemon_v2_pokemonabilities.toList() ?? [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ColorScheme?>(
      future: imageColorViewModel.colorScheme(cacheNetworkImageProvider),
      builder: (context, colorSchemeSnapshot) {
        final colorScheme = colorSchemeSnapshot.data;
        return ExpansionCard(
          titleWidget: _buildPokemonCardBody(context),
          expandedChildren: [
            _buildPokemonAbilities(context),
            const SizedBox(
              height: 16,
            ),
          ],
          onTap: () {
            //TODO we could call for the color here
            _navigateToDetailPage(
              context,
              colorScheme,
            );
          },
          bottomWidgetBuilder: (_) {
            return _buildPokemonTypesHolder();
          },
        );
      },
    );
  }

  Widget _buildPokemonCardBody(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPokemonImage(),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: _buildPokemonInfo(context),
        ),
      ],
    );
  }

  Widget _buildPokemonAbilities(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            top: 16,
          ),
          child: Text(
            context.strings.abilities,
            style: PokeAppText.subtitle3Style,
          ),
        ),
        ...abilities.map(
          (a) => Column(
            children: [
              if (a != abilities.first)
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 8,
                    bottom: 4,
                  ),
                  child: _buildDivider(
                    hasThinDivider: true,
                  ),
                ),
              AbilityTile(
                ability: a,
                tilePadding: const EdgeInsets.only(
                  left: 8,
                  right: 14,
                ),
              ),
            ],
          ),
        ),
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
            chips: _types
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
    } else {
      return const SizedBox();
    }
  }

  Widget _buildPokemonInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          pokemonName.capitalize(),
          style: PokeAppText.subtitle1Style,
        ),
        _buildPokemonId(context),
      ],
    );
  }

  Widget _buildPokemonId(BuildContext context) {
    final pokemonId = pokemon?.id ?? context.strings.questionMark;
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        '#${pokemonId.toString()}',
        style: PokeAppText.body6Style.copyWith(
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
        imageProvider: cacheNetworkImageProvider,
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _buildDivider({
    bool hasThinDivider = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: PokeDivider(
        thickness: hasThinDivider ? kThicknessThin : kThicknessThick,
      ),
    );
  }

  void _navigateToDetailPage(
    BuildContext context,
    ColorScheme? colorScheme,
  ) {
    final _pokemon = pokemon;
    if (_pokemon != null) {
      final generation = pokemonFormWithVersionGroup.pokemon_v2_versiongroup;
      Navigator.of(context).pushNamed(
        PokemonDetailPage.routeName,
        arguments: PokemonDetailPageArguments(
          pokemon: _pokemon.rebuild(
            (p) => p
              ..id = pokemon?.id
              ..name = pokemonName
              ..height = pokemon?.height
              ..weight = pokemon?.weight
              ..pokemon_v2_pokemonspecy.generation_id = generation?.id
              ..pokemon_v2_pokemonspecy.pokemon_v2_pokemonspeciesnames.insert(
                    0,
                    PokemonSpecies(
                      (ps) => ps.genus = formName,
                    ),
                  ),
          ),
          colorScheme: colorScheme,
        ),
      );
    }
  }
}
