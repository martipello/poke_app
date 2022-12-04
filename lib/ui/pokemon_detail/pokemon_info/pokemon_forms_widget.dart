import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../api/models/pokemon/pokemon.dart';
import '../../../api/models/pokemon/pokemon_form_with_version_group.dart';
import '../../../extensions/build_context_extension.dart';
import '../../../extensions/iterable_extension.dart';
import '../../../extensions/pokemon_form_extension.dart';
import '../../../theme/base_theme.dart';
import '../../../theme/poke_app_text.dart';
import '../../shared_widgets/poke_divider.dart';
import '../../shared_widgets/pokemon_expansion_tile.dart';
import '../../shared_widgets/pokemon_table.dart';

class PokemonFormsWidget extends StatelessWidget {
  const PokemonFormsWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final forms = pokemon.pokemon_v2_pokemonforms.toList();
    if (forms.isEmpty) {
      return const SliverToBoxAdapter(
        child: SizedBox(),
      );
    }
    return MultiSliver(
      children: [
        SliverToBoxAdapter(
          child: _buildTitle(context),
        ),
        _buildFormsList(context, forms),
        SliverToBoxAdapter(
          child: _buildDivider(),
        ),
      ],
    );
  }

  Widget _buildFormsList(
    BuildContext context,
    List<PokemonFormWithVersionGroup> forms,
  ) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: forms.length,
        (context, index) {
          final form = forms[index];
          return Column(
            children: [
              if (index != 0) _buildFormsListDivider(),
              _buildFormTile(
                context,
                form,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFormTile(
    BuildContext context,
    PokemonFormWithVersionGroup formHolder,
  ) {
    final form = formHolder.pokemon_v2_pokemonformnames.firstOrNull()?.pokemon_v2_pokemonform;
    return PokemonExpansionTile(
      canExpand: true,
      title: _buildExpansionTileTitle(
        context,
        form.title(),
      ),
      children: _buildPokemonFormDetail(
        formHolder,
      ),
    );
  }

  Padding _buildFormsListDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: _buildDivider(),
    );
  }

  Widget _buildTitle(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Text(
        context.strings.forms,
        style: PokeAppText.subtitle3Style.copyWith(
          color: colors(context).textOnForeground,
        ),
      ),
    );
  }

  List<Widget> _buildPokemonFormDetail(
    PokemonFormWithVersionGroup formHolder,
  ) {
    final form = formHolder.pokemon_v2_pokemonformnames.firstOrNull()?.pokemon_v2_pokemonform;
    final isMega = form.isMega();
    final isDefault = form.isDefault();
    final isBattleOnly = form.isBattleOnly();
    return [
      PokemonTable(
        pokemonTableRowInfoList: [
          if (isMega.isNotEmpty)
            PokemonTableRowInfo(
              'Mega',
              value: isMega,
            ),
          if (isDefault.isNotEmpty)
            PokemonTableRowInfo(
              'Default',
              value: isDefault,
            ),
          if (isBattleOnly.isNotEmpty)
            PokemonTableRowInfo(
              'Battle Only',
              value: isBattleOnly,
            ),
        ],
      ),
    ];
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

  Widget _buildExpansionTileTitle(
    BuildContext context,
    String title,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 4,
        bottom: 4,
      ),
      child: Text(
        title,
        style: PokeAppText.body3Style.copyWith(
          color: colors(context).textOnForeground,
        ),
      ),
    );
  }
}
