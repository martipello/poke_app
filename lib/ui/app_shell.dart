import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../extensions/build_context_extension.dart';
import '../extensions/media_query_context_extension.dart';


class AppShell extends StatelessWidget {
  const AppShell({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;


  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    final isWideLayout = MediaQuery.of(context).isLargeScreen;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
      ),
      child: Material(
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (isWideLayout) {
                return _buildScaffoldWithNavigatorRail(context);
              }
              return _buildScaffoldWithNavigatorBar(context);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildScaffoldWithNavigatorRail(BuildContext context) {
    final currentIndex = navigationShell.currentIndex;
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            labelType: NavigationRailLabelType.all,
            destinations: [
              NavigationRailDestination(
                icon: Image.asset(
                  'assets/icons/pokedex-black.png',
                  height: currentIndex == 0 ? 42 : 38,
                  color: context.colors.onSurface.withOpacity(
                    currentIndex == 0 ? 1.0 : 0.5,
                  ),
                  fit: BoxFit.fitHeight,
                ),
                label: const Text('Pokédex'),
              ),
              NavigationRailDestination(
                icon: Image.asset(
                  'assets/icons/whos_that_pokemon.png',
                  height: currentIndex == 1 ? 42 : 38,
                  color: context.colors.onSurface.withOpacity(
                    currentIndex == 1 ? 1.0 : 0.5,
                  ),
                  fit: BoxFit.fitHeight,
                ),
                label: const Text('WTP?'),
              ),
            ],
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: onTap,
          ),
          Expanded(
            child: navigationShell,
          ),
        ],
      ),
    );
  }

  Widget _buildScaffoldWithNavigatorBar(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: _buildNavigationBar(context),
    );
  }

  Widget _buildNavigationBar(BuildContext context) {
    final currentIndex = navigationShell.currentIndex;
    return NavigationBar(
      indicatorColor: Colors.transparent,
      destinations: [
        NavigationDestination(
          icon: Image.asset(
            'assets/icons/pokedex-black.png',
            height: currentIndex == 0 ? 42 : 38,
            color: context.colors.onSurface.withOpacity(
              currentIndex == 0 ? 1.0 : 0.5,
            ),
            fit: BoxFit.fitHeight,
          ),
          label: 'Pokédex',
        ),
        NavigationDestination(
          icon: Image.asset(
            'assets/icons/whos_that_pokemon.png',
            height: currentIndex == 1 ? 42 : 38,
            color: context.colors.onSurface.withOpacity(
              currentIndex == 1 ? 1.0 : 0.5,
            ),
            fit: BoxFit.fitHeight,
          ),
          label: 'WTP?',
        ),
      ],
      onDestinationSelected: onTap,
      selectedIndex: navigationShell.currentIndex,
    );
  }

  void onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
