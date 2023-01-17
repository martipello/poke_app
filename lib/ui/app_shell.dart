import 'package:flutter/material.dart';

import 'pokemon_list/pokemon_list_view.dart';

class AppShell extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PokemonListView(),
    );
  }
}
