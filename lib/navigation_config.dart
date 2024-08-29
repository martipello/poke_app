import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_app/ui/leaderboard/leaderboard_page.dart';
import 'package:poke_app/ui/settings/about.dart';
import 'package:poke_app/ui/settings/settings.dart';

import 'ui/app_shell.dart';
import 'ui/locations/map_page.dart';
import 'ui/pokemon_detail/pokemon_detail_page.dart';
import 'ui/pokemon_list/pokemon_list_view_decoration.dart';
import 'ui/splash_page.dart';
import 'ui/whos_that_pokemon/whos_that_pokemon_view.dart';

final router = GoRouter(
  initialLocation: SplashPage.routeName,
  observers: [HeroController()],
  routes: <RouteBase>[
    GoRoute(
      path: SplashPage.routeName,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: SplashPage());
      },
    ),
    GoRoute(
      path: PokemonDetailPage.routeName,
      builder: (context, state) {
        final pokemonDetailArguments = state.extra as PokemonDetailPageArguments;
        return PokemonDetailPage(
          pokemonDetailArguments: pokemonDetailArguments,
        );
      },
    ),
    GoRoute(
      path: LocationMapPage.routeName,
      builder: (context, state) {
        final locationMapPageArguments = state.extra as LocationMapPageArguments;
        return LocationMapPage(locationMapPageArguments: locationMapPageArguments);
      },
    ),
    GoRoute(
      path: Settings.routeName,
      builder: (context, state) {
        return Settings();
      },
    ),
    GoRoute(
      path: About.routeName,
      builder: (context, state) {
        return About();
      },
    ),
    GoRoute(
      path: LeaderboardPage.routeName,
      builder: (context, state) {
        return LeaderboardPage();
      },
    ),
    StatefulShellRoute.indexedStack(
      pageBuilder: (context, state, navigationShell) {
        return NoTransitionPage(
          child: AppShell(
            navigationShell: navigationShell,
          ),
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: PokemonListViewDecoration.routeName,
              builder: (context, state) {
                return const PokemonListViewDecoration();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: kWhosThatPokemonRoute,
              builder: (context, state) {
                return const WhosThatPokemonView();
              },
            ),
          ],
        ),
      ].toList(),
    ),
  ],
);
