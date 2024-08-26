import 'package:flutter/material.dart';
import 'package:poke_app/ui/pokemon_filter/filter_button.dart';
import 'package:rxdart/subjects.dart';

import '../extensions/build_context_extension.dart';
import 'leaderboard/leaderboard_page.dart';
import 'pokemon_list/pokemon_list_view_decoration.dart';
import 'whos_that_pokemon/whos_that_pokemon_view.dart';

class AppShell extends StatelessWidget {
  AppShell({key}) : super(key: key);

  final _appShellViewModel = AppShellViewModel();
  final _pageController = PageController();
  static const routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      initialData: 0,
      stream: _appShellViewModel.currentIndex,
      builder: (context, snapshot) {
        final index = snapshot.data ?? 0;
        return Scaffold(
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: _bodies,
          ),
          bottomNavigationBar: _buildBottomNavigationBar(
            context,
            index,
          ),
          floatingActionButton: index == 1
              ? FilterButtonWidget(
                  onTap: () {
                    Navigator.of(context).pushNamed(LeaderboardPage.routeName);
                  },
                  imageUri: 'assets/images/red_white_background.png',
                  child: const Center(
                    child: Icon(Icons.leaderboard, size: 28,),
                  ),
                )
              : null,
        );
      },
    );
  }

  Widget _buildBottomNavigationBar(
    BuildContext context,
    int currentIndex,
  ) {
    return BottomNavigationBar(
      showUnselectedLabels: false,
      showSelectedLabels: false,
      items: [
        _buildBottomNavigationBarItem(
          context,
          currentIndex,
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
          context,
          currentIndex,
          context.strings.whoDatPokemon,
          'assets/icons/whos_that_pokemon.png',
          1,
        ),
      ],
      onTap: (index) {
        _pageController.jumpToPage(index);
        _appShellViewModel.currentIndex.add(index);
      },
      currentIndex: currentIndex,
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
    BuildContext context,
    int currentIndex,
    String label,
    String imagePath,
    int index,
  ) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        imagePath,
        height: currentIndex == index ? 42 : 38,
        color: context.colors.onSurface.withOpacity(
          currentIndex == index ? 1.0 : 0.5,
        ),
        fit: BoxFit.fitHeight,
      ),
      label: label,
      tooltip: label,
    );
  }

  final _bodies = const [
    PokemonListViewDecoration(),
    // PokemonNewsListView(),
    WhosThatPokemonView(),
  ];
}

class AppShellViewModel {
  AppShellViewModel();

  final currentIndex = BehaviorSubject.seeded(0);
}
