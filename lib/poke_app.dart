import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:poke_app/theme/theme.g.dart';

import 'api/models/pokemon/pokemon_type.dart';
import 'dependency_injection_container.dart';
import 'in_app_purchases/view_models/in_app_purchase_view_model.dart';
import 'services/language_service.dart';
import 'ui/app_shell.dart';
import 'ui/locations/map_page.dart';
import 'ui/pokemon_detail/pokemon_detail_page.dart';
import 'ui/settings/about.dart';
import 'ui/settings/settings.dart';
import 'ui/splash_page.dart';

class PokeApp extends StatefulWidget {
  const PokeApp({
    Key? key, required this.themeMode,
  }) : super(key: key);

  final ThemeMode themeMode;

  @override
  _PokeAppState createState() => _PokeAppState();
}

class _PokeAppState extends State<PokeApp> {
  final languageService = getIt.get<LanguageService>();
  final _inAppPurchaseViewModel = getIt.get<InAppPurchaseViewModel>();

  @override
  void didChangeDependencies() {
    for (var asset in PokemonType.values) {
      precacheImage(AssetImage(asset.image), context);
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _inAppPurchaseViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SupportedLanguage>(
      stream: languageService.languageStream,
      builder: (context, snapshot) {
        //TODO handle changing localization
        return AdditionalColorsWidget(
          additionalColors: const AdditionalColors(),
          child: MaterialApp(
            title: 'PokéApp',
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en', ''),
              const Locale('es', ''),
            ],
            themeMode: widget.themeMode,
            theme: kLightTheme,
            darkTheme: kDarkTheme,
            initialRoute: SplashPage.routeName,
            routes: {
              AppShell.routeName: (context) => AppShell(),
              SplashPage.routeName: (context) => const SplashPage(),
              PokemonDetailPage.routeName: (context) => const PokemonDetailPage(),
              LocationMapPage.routeName: (context) => LocationMapPage(),
              Settings.routeName: (context) => Settings(),
              About.routeName: (context) => About(),
            },
          ),
        );
      },
    );
  }
}

class AdditionalColorsWidget extends InheritedWidget {
  const AdditionalColorsWidget({
    Key? key,
    required this.additionalColors,
    required Widget child,
  }) : super(key: key, child: child);
  final AdditionalColors additionalColors;
  static AdditionalColorsWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AdditionalColorsWidget>()!;
  }
  @override
  bool updateShouldNotify(AdditionalColorsWidget oldWidget) {
    return true;
  }
}
