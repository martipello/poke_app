import 'package:flutter/material.dart';

import 'pokemon_list/pokemon_list_view.dart';

class AppShell extends StatelessWidget {
  static const routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PokemonListView(),
    );
  }
}
