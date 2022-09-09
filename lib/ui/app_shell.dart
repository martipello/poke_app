import 'package:flutter/material.dart';
import 'package:flutter_flavorizr/parser/models/flavors/flavor.dart';

import '../extensions/build_context_extension.dart';
import '../flavors.dart';
import '../theme/poke_app_text.dart';

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
      body: Container(
        child: Center(
          child: Text('DASHBOARD ${F.appFlavor}'),
        ),
      ),
    );
  }
}
