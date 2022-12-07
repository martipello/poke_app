import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../api/models/pokemon/pokemon.dart';
import '../../../api/models/pokemon/pokemon_ability_holder.dart';
import '../../../api/models/pokemon/pokemon_form.dart';
import '../../../api/models/pokemon/pokemon_form_with_version_group.dart';
import '../../../api/models/pokemon/pokemon_species_holder.dart';
import '../../../api/models/pokemon/pokemon_type.dart';
import '../../../dependency_injection_container.dart';
import '../../../extensions/iterable_extension.dart';
import '../../../extensions/string_extension.dart';
import '../../../extensions/type_data_extension.dart';
import '../../../theme/base_theme.dart';
import '../../../theme/poke_app_text.dart';
import '../../shared_widgets/chip_group.dart';
import '../../shared_widgets/expansion_card.dart';
import '../../shared_widgets/poke_divider.dart';
import '../../shared_widgets/pokemon_image.dart';
import '../../shared_widgets/type_chip.dart';
import '../../shared_widgets/view_models/image_color_view_model.dart';
import '../pokemon_detail_page.dart';
import '../pokemon_info/ability_tile.dart';

const kPokemonTileImageHeight = 80.0;

class FormTile extends StatefulWidget {
  FormTile({
    Key? key,
    required this.pokemonFormWithVersionGroup,
  }) : super(key: key);

  final PokemonFormWithVersionGroup pokemonFormWithVersionGroup;

  @override
  State<FormTile> createState() => _FormTileState();
}

class _FormTileState extends State<FormTile> {
  final mainImageColorViewModel = getIt.get<ImageColorViewModel>();
  final spriteImageColorViewModel = getIt.get<ImageColorViewModel>();

  PokemonFormWithVersionGroup get pokemonFormWithVersionGroup => widget.pokemonFormWithVersionGroup;

  PokemonForm? get pokemonForm =>
      pokemonFormWithVersionGroup.pokemon_v2_pokemonformnames
          .firstOrNull()
          ?.pokemon_v2_pokemonform;

  Pokemon? get pokemon => pokemonForm?.pokemon_v2_pokemon;

  String get pokemonName =>
      pokemonForm?.pokemon_v2_pokemonformnames
          .firstOrNull()
          ?.name ??
          'Unknown Pokemon';

  List<PokemonAbilityHolder> get abilities => pokemon?.pokemon_v2_pokemonabilities.toList() ?? [];

  @override
  void dispose() {
    mainImageColorViewModel.dispose();
    spriteImageColorViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PaletteGenerator>(
      stream: mainImageColorViewModel.paletteGeneratorStream,
      builder: (context, mainImagePaletteGeneratorSnapshot) {
        return StreamBuilder<PaletteGenerator>(
          stream: spriteImageColorViewModel.paletteGeneratorStream,
          builder: (context, spriteImagePaletteGeneratorSnapshot) {
            final spriteImagePaletteGenerator = spriteImagePaletteGeneratorSnapshot.data;
            final mainImagePaletteGenerator = mainImagePaletteGeneratorSnapshot.data;
            return ExpansionCard(
              titleWidget: _buildPokemonCardBody(),
              expandedChildren: [
                _buildPokemonAbilities(),
              ],
              onTap: () {
                final _pokemon = pokemon;
                if (_pokemon != null) {
                  Navigator.of(context).pushNamed(
                    PokemonDetailPage.routeName,
                    arguments: PokemonDetailPageArguments(
                      pokemon: _pokemon.rebuild((p) =>
                      p
                        ..id = pokemon?.id
                        ..name = pokemonName
                        ..height = pokemon?.height
                        ..weight = pokemon?.weight,),
                      spriteImagePaletteGenerator: spriteImagePaletteGenerator,
                      mainImagePaletteGenerator: mainImagePaletteGenerator,
                    ),
                  );
                }
              },
              bottomWidgetBuilder: (_) {
                return _buildPokemonTypesHolder();
              },
            );
          },
        );
      },
    );
  }

  Widget _buildPokemonCardBody() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPokemonImage(),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: _buildPokemonInfo(),
        ),
      ],
    );
  }

  Widget _buildPokemonAbilities() {
    return SizedBox(
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: abilities.length,
                  (context, index) {
                final ability = abilities[index];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (index != 0)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: _buildDivider(),
                      ),
                    AbilityTile(
                      ability: ability,
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
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
                  (type) =>
                  TypeChip(
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

  Widget _buildPokemonInfo() {
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
        _buildPokemonId(),
      ],
    );
  }

  Widget _buildPokemonId() {
    final pokemonId = pokemon?.id ?? '??';
    return Padding(
      padding: const EdgeInsets.only(top: 8),
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
        forceSpriteImage: true,
        imageColorCallback: mainImageColorViewModel.paletteGeneratorStream.add,
        spriteImageColorCallback: spriteImageColorViewModel.paletteGeneratorStream.add,
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 8,
      ),
      child: PokeDivider(),
    );
  }
}
