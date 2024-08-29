import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'api/models/pokemon/pokemon_type.dart';
import 'dependency_injection_container.dart';
import 'in_app_purchases/view_models/in_app_purchase_view_model.dart';
import 'navigation_config.dart';
import 'services/language_service.dart';
import 'services/theme_service.dart';
import 'theme/theme.g.dart';

class PokeApp extends StatefulWidget {
  const PokeApp({
    Key? key,
  }) : super(key: key);

  @override
  _PokeAppState createState() => _PokeAppState();
}

class _PokeAppState extends State<PokeApp> {
  final languageService = getIt.get<LanguageService>();
  final _inAppPurchaseViewModel = getIt.get<InAppPurchaseViewModel>();
  final themeService = getIt.get<ThemeService>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImages(context);
  }

  Future<void> precacheImages(BuildContext context) async {
    try {
      for (var asset in PokemonType.values) {
        await precacheImage(
          AssetImage(asset.image),
          context,
        );
      }
      await precacheImage(
        const AssetImage('assets/images/pokeball_outline.png'),
        context,
      );
      await precacheImage(
        const AssetImage('assets/images/pokeball_filter.png'),
        context,
      );
    } catch (e) {
      print('Failed to load and cache the image: $e');
    }
  }

  @override
  void dispose() {
    _inAppPurchaseViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool?>(
      stream: themeService.isDarkModeStream,
      builder: (context, snapshot) {
        final isDarkMode = snapshot.data == true;
        return StreamBuilder<SupportedLanguage>(
          stream: languageService.languageStream,
          builder: (context, snapshot) {
            //TODO handle changing localization
            return AdditionalColorsWidget(
              additionalColors: const AdditionalColors(),
              child: MaterialApp.router(
                routerConfig: router,
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
                themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
                theme: kLightTheme,
                darkTheme: kDarkTheme,
              ),
            );
          },
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
