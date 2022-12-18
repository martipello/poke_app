import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../api/models/pokemon/pokemon.dart';
import '../../api/models/pokemon/pokemon_type.dart';
import '../../extensions/build_context_extension.dart';
import '../../extensions/iterable_extension.dart';
import '../../extensions/media_query_context_extension.dart';
import '../../theme/base_theme.dart';
import '../pokemon_evolutions/pokemon_evolution_view.dart';
import '../pokemon_forms/pokemon_forms_view.dart';
import '../pokemon_info/pokemon_info_view.dart';
import '../pokemon_moves/pokemon_moves_view.dart';
import '../pokemon_stats/pokemon_stats_view.dart';
import 'pokemon_detail_app_bar.dart';

class PokemonDetailPageArguments {
  PokemonDetailPageArguments({
    required this.pokemon,
    this.mainImagePaletteGenerator,
  });

  final Pokemon pokemon;
  final PaletteGenerator? mainImagePaletteGenerator;
}

class PokemonDetailPage extends StatefulWidget {
  const PokemonDetailPage({
    Key? key,
  }) : super(key: key);
  static const String routeName = '/detail';

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> with TickerProviderStateMixin {
  PokemonDetailPageArguments get pokemonDetailArguments => context.routeArguments as PokemonDetailPageArguments;

  late final _tabBarController = TabController(length: 5, vsync: this);

  Color get primaryColor =>
      pokemonDetailArguments.mainImagePaletteGenerator?.lightVibrantColor?.color ??
          PokemonType
              .getTypeForId(pokemonDetailArguments.pokemon.pokemon_v2_pokemontypes
              .firstOrNull()
              ?.pokemon_v2_type
              ?.id ?? 0)
              .color;

  Color get secondaryColor =>
      pokemonDetailArguments.mainImagePaletteGenerator?.dominantColor?.color ??

          PokemonType
              .getTypeForId(pokemonDetailArguments.pokemon.pokemon_v2_pokemontypes
              .secondOrNull()
              ?.pokemon_v2_type
              ?.id ?? pokemonDetailArguments.pokemon.pokemon_v2_pokemontypes
              .firstOrNull()
              ?.pokemon_v2_type
              ?.id ?? 0)
              .color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            PokemonDetailAppBar(
              pokemon: pokemonDetailArguments.pokemon,
              primaryColor: primaryColor,
              secondaryColor: secondaryColor,
            ),
          ];
        },
        body: _buildPokemonDetailBody(),
      ),
    );
  }

  Widget _buildPokemonDetailBody() {
    final tabBarTopPadding = 16 + context.statusBarHeight;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors(context).cardBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: tabBarTopPadding,
              bottom: 16,
            ),
            child: _buildTabBar(context),
          ),
          Expanded(
            child: _buildTabBarView(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBarView() {
    return DecoratedBox(
      decoration: BoxDecoration(color: colors(context).foreground),
      child: TabBarView(
        controller: _tabBarController,
        children: [
          PokemonInfoView(
            pokemonId: pokemonDetailArguments.pokemon.id ?? 0,
          ),
          PokemonStatsView(
            pokemonId: pokemonDetailArguments.pokemon.id ?? 0,
            primaryColor: primaryColor,
            secondaryColor: secondaryColor,
          ),
          PokemonEvolutionView(
            pokemonId: pokemonDetailArguments.pokemon.id ?? 0,
          ),
          PokemonFormsView(
            pokemonId: pokemonDetailArguments.pokemon.id ?? 0,
          ),
          PokemonMovesView(
            pokemonId: pokemonDetailArguments.pokemon.id ?? 0,
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return SizedBox(
      height: 36,
      width: double.infinity,
      child: Center(
        child: TabBar(
          controller: _tabBarController,
          isScrollable: MediaQuery.of(context).isLargeScreen ? false : true,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          labelPadding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 2,
          ),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(90), // Creates border
            color: primaryColor,
          ),
          unselectedLabelColor: colors(context).textOnForeground,
          tabs: [
            Tab(
              text: context.strings.info.toUpperCase(),
            ),
            Tab(
              text: context.strings.stats.toUpperCase(),
            ),
            Tab(
              text: context.strings.evolutions.toUpperCase(),
            ),
            Tab(
              text: context.strings.forms.toUpperCase(),
            ),
            Tab(
              text: context.strings.moves.toUpperCase(),
            )
          ],
        ),
      ),
    );
  }
}
