import 'package:flutter/material.dart';

import '../dependency_injection_container.dart';
import '../in_app_purchases/viiew_models/in_app_purchase_view_model.dart';
import 'pokemon_list/pokemon_list_view.dart';

class AppShell extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {

  final _inAppPurchaseViewModel = getIt.get<InAppPurchaseViewModel>();

  @override
  void initState() {
    super.initState();
    _inAppPurchaseViewModel.restorePurchases();
  }

  @override
  void dispose() {
    _inAppPurchaseViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PokemonListView(),
    );
  }
}
