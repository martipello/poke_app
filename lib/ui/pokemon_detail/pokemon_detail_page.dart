import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../ads/view_models/google_ads_view_model.dart';
import '../../api/models/pokemon/pokemon.dart';
import '../../api/models/pokemon/pokemon_type.dart';
import '../../dependency_injection_container.dart';
import '../../extensions/build_context_extension.dart';
import '../../extensions/iterable_extension.dart';
import '../../extensions/media_query_context_extension.dart';
import '../../flavors.dart';
import '../../theme/base_theme.dart';
import '../pokemon_evolutions/pokemon_evolution_view.dart';
import '../pokemon_filter/filter_view_holder.dart';
import '../pokemon_forms/pokemon_forms_view.dart';
import '../pokemon_info/pokemon_info_view.dart';
import '../pokemon_list/view_models/filter_view_model.dart';
import '../pokemon_moves/pokemon_moves_view.dart';
import '../pokemon_stats/pokemon_stats_view.dart';
import '../shared_widgets/view_models/current_index_view_model.dart';
import '../shared_widgets/view_models/open_pokemon_count_view_model.dart';
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

  final _filterViewModel = getIt.get<FilterViewModel>();
  final _googleAdsViewModel = getIt.get<GoogleAdsViewModel>();
  final _currentIndexViewModel = getIt.get<CurrentIndexViewModel>();
  final _openPokemonCountViewModel = getIt.get<OpenPokemonCountViewModel>();

  late final _tabBarController = TabController(length: 5, vsync: this);
  final key = GlobalKey<NestedScrollViewState>();

  Color get primaryColor =>
      pokemonDetailArguments.mainImagePaletteGenerator?.lightVibrantColor?.color ??
      PokemonType.getTypeForId(
              pokemonDetailArguments.pokemon.pokemon_v2_pokemontypes.firstOrNull()?.pokemon_v2_type?.id ?? 0)
          .color;

  Color get secondaryColor =>
      pokemonDetailArguments.mainImagePaletteGenerator?.dominantColor?.color ??
      PokemonType.getTypeForId(
              pokemonDetailArguments.pokemon.pokemon_v2_pokemontypes.secondOrNull()?.pokemon_v2_type?.id ??
                  pokemonDetailArguments.pokemon.pokemon_v2_pokemontypes.firstOrNull()?.pokemon_v2_type?.id ??
                  0)
          .color;

  @override
  void initState() {
    super.initState();
    _openPokemonCountViewModel.increment();
    _tabBarController.addListener(
      _tabBarListener,
    );
    _openPokemonCountViewModel.openPokemonCountStream.listen(
      (openedCount) {
        if (openedCount == 1 && F.appFlavor != Flavor.paid) {
          //We do this as without it first ad always fails
          _googleAdsViewModel.createInterstitialAd();
        }
        if (openedCount % 3 == 0 && F.appFlavor != Flavor.paid) {
          _googleAdsViewModel.createInterstitialAd();
          _googleAdsViewModel.showInterstitialAd();
        }
      },
    );
  }

  @override
  void dispose() {
    _filterViewModel.dispose();
    _googleAdsViewModel.dispose();
    _tabBarController.removeListener(
      _tabBarListener,
    );
    super.dispose();
  }

  void _tabBarListener() {
    _currentIndexViewModel.currentIndexStream.add(
      _tabBarController.index.toDouble(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        key: key,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            PokemonDetailAppBar(
              pokemon: pokemonDetailArguments.pokemon,
              primaryColor: primaryColor,
              secondaryColor: secondaryColor,
            ),
          ];
        },
        body: Stack(
          children: [
            Positioned.fill(
              child: _buildPokemonDetailBody(),
            ),
            StreamBuilder<double>(
              stream: _currentIndexViewModel.currentIndexStream,
              builder: (context, snapshot) {
                final _currentTabIndex = snapshot.data ?? 0;
                if (_currentTabIndex == 4) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: FilterViewHolder(
                      onFilterButtonPressed: collapseNestedScrollViewHeader,
                      filterViewModel: _filterViewModel,
                      showDamageTypeFilters: true,
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
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
      decoration: BoxDecoration(
        color: colors(context).foreground,
      ),
      child: TabBarView(
        controller: _tabBarController,
        children: [
          PokemonInfoView(
            pokemonId: pokemonDetailArguments.pokemon.id ?? 0,
            primaryColor: primaryColor,
            secondaryColor: secondaryColor,
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
            filterViewModel: _filterViewModel,
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

  void collapseNestedScrollViewHeader() {
    key.currentState?.outerController.animateTo(
      2000,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(
        milliseconds: 10,
      ),
    );
  }
}
