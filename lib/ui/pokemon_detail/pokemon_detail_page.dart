import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../api/models/pokemon/pokemon.dart';
import '../../extensions/build_context_extension.dart';
import '../../theme/base_theme.dart';
import 'pokemon_detail_app_bar.dart';
import 'pokemon_info/pokemon_info_view.dart';

class PokemonDetailPageArguments {
  PokemonDetailPageArguments({
    required this.pokemon,
    this.paletteGenerator,
  });

  final Pokemon pokemon;
  final PaletteGenerator? paletteGenerator;
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

  final _scrollController = ScrollController();
  late final _tabBarController = TabController(length: 3, vsync: this);

  Color get primaryColor => Colors.red;

  Color get secondaryColor => Colors.green;

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
        CustomScrollView(
          controller: _scrollController,
          slivers: [],
        ),
        CustomScrollView(
          controller: _scrollController,
          slivers: [],
        ),
      ],
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return SizedBox(
      height: 36,
      child: TabBar(
        controller: _tabBarController,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        labelPadding: EdgeInsets.zero,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(90), // Creates border
          color: primaryColor,
        ),
        //Change background color from here
        tabs: [
          Tab(
            text: context.strings.info.toUpperCase(),
          ),
          Tab(
            text: context.strings.stats.toUpperCase(),
          ),
          Tab(
            text: context.strings.moves.toUpperCase(),
          )
        ],
      ),
    );
  }
}
