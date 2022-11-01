import 'package:flutter/material.dart';

import '../extensions/build_context_extension.dart';
import '../theme/poke_app_text.dart';
import 'pokemon_list/pokemon_list_view.dart';

class AppShell extends StatelessWidget {
  static const routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.strings?.app_name.toUpperCase() ?? '',
        ),
        titleTextStyle: PokeAppText.subtitle3Style,
      ),
      body: PokemonListView(),
    );
  }
}
