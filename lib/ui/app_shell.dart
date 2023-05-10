import 'package:flutter/material.dart';

import '../extensions/build_context_extension.dart';
import '../theme/base_theme.dart';
import 'pokemon_list/pokemon_list_view.dart';
import 'whos_that_pokemon/whos_that_pokemon_view.dart';

class AppShell extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(
        context,
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: false,
      showSelectedLabels: false,
      items: [
        _buildBottomNavigationBarItem(
          context.strings.pokedex,
          'assets/icons/pokedex-black.png',
          0,
        ),
        // _buildBottomNavigationBarItem(
        //   'PokéNews',
        //   'assets/images/fairy_type_icon.png',
        //   1,
        // ),
        _buildBottomNavigationBarItem(
          context.strings.whoDatPokemon,
          'assets/icons/whos_that_pokemon.png',
          2,
        ),
      ],
      onTap: (index) {
        setState(
          () {
            currentIndex = index;
          },
        );
      },
      currentIndex: currentIndex,
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
    String label,
    String imagePath,
    int index,
  ) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        imagePath,
        height: currentIndex == index ? 42 : 38,
        color: colors(context).textOnForeground.withOpacity(
              currentIndex == index ? 1.0 : 0.5,
            ),
        fit: BoxFit.fitHeight,
      ),
      label: label,
      tooltip: label,
    );
  }

  Widget _buildBody() {
    return _bodies[currentIndex];
  }

  List<Widget> get _bodies => [
        PokemonListView(),
        // PokemonNewsListView(),
        WhosThatPokemonView(),
      ];
}
