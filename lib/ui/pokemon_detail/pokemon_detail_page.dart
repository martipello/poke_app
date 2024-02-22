import 'package:flutter/material.dart';

import '../../ads/ad_warning.dart';
import '../../ads/view_models/google_ads_view_model.dart';
import '../../api/models/pokemon/damage_type.dart';
import '../../api/models/pokemon/pokemon.dart';
import '../../api/models/pokemon/pokemon_type.dart';
import '../../dependency_injection_container.dart';
import '../../extensions/build_context_extension.dart';
import '../../extensions/iterable_extension.dart';
import '../../extensions/media_query_context_extension.dart';
import '../../flavors.dart';
import '../pokemon_evolutions/pokemon_evolution_view.dart';
import '../pokemon_filter/filter_view_holder.dart';
import '../pokemon_forms/pokemon_forms_view.dart';
import '../pokemon_info/pokemon_info_view.dart';
import '../pokemon_list/view_models/filter_view_model.dart';
import '../pokemon_moves/pokemon_moves_view.dart';
import '../pokemon_stats/pokemon_stats_view.dart';
import '../shared_widgets/view_constraint.dart';
import '../shared_widgets/view_models/current_index_view_model.dart';
import '../shared_widgets/view_models/open_pokemon_count_view_model.dart';
import 'pokemon_detail_app_bar.dart';

class PokemonDetailPageArguments {
  PokemonDetailPageArguments({
    required this.pokemon,
    this.colorScheme,
  });

  final Pokemon pokemon;
  final ColorScheme? colorScheme;
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
      pokemonDetailArguments.colorScheme?.primary ??
      PokemonType.getTypeForId(
              pokemonDetailArguments.pokemon.pokemon_v2_pokemontypes.firstOrNull()?.pokemon_v2_type?.id ?? 0)
          .color;

  Color get secondaryColor =>
      pokemonDetailArguments.colorScheme?.primaryContainer ??
      PokemonType.getTypeForId(
              pokemonDetailArguments.pokemon.pokemon_v2_pokemontypes.secondOrNull()?.pokemon_v2_type?.id ?? 0)
          .color;

  @override
  void initState() {
    super.initState();
    _filterViewModel.filters.add([...PokemonType.filters, ...DamageType.filters]);
    _openPokemonCountViewModel.increment();
    _tabBarController.addListener(
      _tabBarListener,
    );
    _openPokemonCountViewModel.openPokemonCountStream.listen(
      (openedCount) {
        if (openedCount == 1 || openedCount % kInterstitialAdFrequency == 0 && F.appFlavor != Flavor.paid) {
          //We do this as without it first ad always fails
          _googleAdsViewModel.createInterstitialAd();
          if (openedCount % kInterstitialAdFrequency == 0) {
            _googleAdsViewModel.showInterstitialAd();
          }
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
      body: Stack(
        children: [
          Positioned.fill(
            child: NestedScrollView(
              key: key,
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  _buildPokemonDetailAppBar(),
                ];
              },
              body: Container(
                color: context.colors.background,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: _buildPokemonDetailBody(),
                    ),
                    _buildFilterViewHolderState(),
                  ],
                ),
              ),
            ),
          ),
          if (F.appFlavor != Flavor.paid)
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: kToolbarHeight + 32,
                ),
                child: AdWarning(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPokemonDetailAppBar() {
    return PokemonDetailAppBar(
      pokemon: pokemonDetailArguments.pokemon,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
    );
  }

  Widget _buildFilterViewHolderState() {
    return StreamBuilder<double>(
      stream: _currentIndexViewModel.currentIndexStream,
      builder: (context, snapshot) {
        final _currentTabIndex = snapshot.data ?? 0;
        if (_currentTabIndex == 4) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: FilterViewHolder(
              onFilterButtonPressed: collapseNestedScrollViewHeader,
              filterViewModel: _filterViewModel,
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildPokemonDetailBody() {
    return ViewConstraint(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
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
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return SizedBox(
      height: 36,
      width: double.infinity,
      child: Center(
        child: TabBar(
          dividerColor: Colors.transparent,
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
            borderRadius: BorderRadius.circular(8), // Creates border
            color: primaryColor,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelColor: context.colors.onSurface,
          labelColor: context.colors.onPrimary,
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
