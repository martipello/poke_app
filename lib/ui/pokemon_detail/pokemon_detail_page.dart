import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../api/models/pokemon/pokemon.dart';
import '../../extensions/build_context_extension.dart';
import '../../theme/base_theme.dart';
import 'pokemon_detail_app_bar.dart';
import 'pokemon_evolutions/pokemon_evolution_view.dart';
import 'pokemon_info/pokemon_info_view.dart';
import 'pokemon_moves/pokemon_moves_view.dart';
import 'pokemon_stats/pokemon_stats_view.dart';

class PokemonDetailPageArguments {
  PokemonDetailPageArguments({
    required this.pokemon,
    this.mainImagePaletteGenerator,
    this.spriteImagePaletteGenerator,
  });

  final Pokemon pokemon;
  final PaletteGenerator? mainImagePaletteGenerator;
  final PaletteGenerator? spriteImagePaletteGenerator;
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

  late final _tabBarController = TabController(length: 4, vsync: this);

  Color get primaryColor => pokemonDetailArguments.mainImagePaletteGenerator?.lightVibrantColor?.color ?? pokemonDetailArguments.spriteImagePaletteGenerator?.dominantColor?.color ?? Colors.red;
  Color get secondaryColor => pokemonDetailArguments.mainImagePaletteGenerator?.dominantColor?.color ?? pokemonDetailArguments.spriteImagePaletteGenerator?.lightVibrantColor?.color ?? Colors.green;

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
    final tabBarTopPadding = 16 + MediaQuery.of(context).viewPadding.top;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors(context).cardBackground,
      ),
      child: Column(
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
    return TabBarView(
      controller: _tabBarController,
      children: [
        PokemonInfoView(
          pokemonId: pokemonDetailArguments.pokemon.id ?? 0,
        ),
        PokemonStatsView(
          pokemonId: pokemonDetailArguments.pokemon.id ?? 0,
        ),
        PokemonEvolutionView(
          pokemonId: pokemonDetailArguments.pokemon.id ?? 0,
        ),
        PokemonMovesView(
          pokemonId: pokemonDetailArguments.pokemon.id ?? 0,
        ),
      ],
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return SizedBox(
      height: 36,
      width: double.infinity,
      child: TabBar(
        controller: _tabBarController,
        isScrollable: true,
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
            text: context.strings.moves.toUpperCase(),
          )
        ],
      ),
    );
  }
}
