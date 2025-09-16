import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../poke_app.dart';
import '../theme/theme.g.dart';
import '../theme/theme_mode_provider_widget.dart';
import 'media_query_context_extension.dart';

extension BuildContextExt on BuildContext {
  double get shortestSide => MediaQuery.of(this).shortestSide;

  double get statusBarHeight => MediaQuery.of(this).viewPadding.top;

  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  double get fullSizeImageScreenWidth => MediaQuery.of(this).fullSizeImageScreenWidth;

  NavigatorState get navigator => Navigator.of(this);

  MaterialLocalizations get materialLocale => MaterialLocalizations.of(this);

  AppLocalizations get strings => AppLocalizations.of(this)!;

  dynamic get routeArguments => ModalRoute.of(this)?.settings.arguments;

  ColorScheme get colors => Theme.of(this).colorScheme;

  AdditionalColors get additionalColors => AdditionalColorsWidget.of(this).additionalColors;

  TextTheme get text => Theme.of(this).textTheme;


  bool get isDarkMode => ThemeModeProvider.of(this).currentThemeMode == ThemeMode.dark;

  void openKeyBoard(FocusNode focusNode) {
    FocusScope.of(this).requestFocus(focusNode);
  }

  void closeKeyBoard() {
    final currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void nextEditableTextFocus() {
    do {
      FocusScope.of(this).nextFocus();
    } while (FocusScope.of(this).focusedChild?.context?.widget is! EditableText);
  }
}
