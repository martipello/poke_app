import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'theme/base_theme.dart';
import 'ui/app_shell.dart';

class PokeApp extends StatefulWidget {
  const PokeApp({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final BaseTheme theme;

  @override
  _PokeAppState createState() => _PokeAppState();
}

class _PokeAppState extends State<PokeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      theme: ThemeData(
        primaryColor: widget.theme.colors.primary,
        iconTheme: widget.theme.iconThemeData,
        colorScheme: widget.theme.colorScheme.colorScheme,
        inputDecorationTheme: widget.theme.inputDecorationTheme,
        brightness: Brightness.light,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: colors(context).secondary,
          selectionColor: colors(context).secondary,
          selectionHandleColor: colors(context).secondary,
        ),
        fontFamily: widget.theme.font,
        appBarTheme: widget.theme.appBarTheme,
      ),
      initialRoute: AppShell.routeName,
      routes: {
        AppShell.routeName: (context) => AppShell(),
      },
    );
  }
}
