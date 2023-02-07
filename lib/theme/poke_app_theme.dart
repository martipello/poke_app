import 'package:flutter/material.dart';

import 'base_theme.dart';
import 'poke_app_text.dart';

const primary = Color(0xFF000000);
const primaryLight = Color(0xFFb3b3b3);
const primaryDark = Color(0xFF007691);
const secondary = Color(0xFFF9CF30);
const secondaryLight = Color(0xFFfdf1c1);
const secondaryDark = Color(0xFFf6bd1e);
const text = Color(0xFF5e5e5e);
const textOnForeground = Color(0xFF5e5e5e);
const textOnPrimary = Color(0xFFFFFFFF);
const textOnSecondary = Color(0xFF5e5e5e);

final pokeAppTheme = AppTheme(
  baseColors: const BaseThemeColors(
    primary: primary,
    primaryLight: primaryLight,
    primaryDark: primaryDark,
    secondary: secondary,
    onSecondary: secondary,
    secondaryLight: secondaryLight,
    secondaryDark: secondaryDark,
    text: text,
    textOnForeground: textOnForeground,
    textOnPrimary: textOnPrimary,
    textOnSecondary: textOnSecondary,
    positive: Color(0xFF8AB341),
    error: Color(0xFFFF654B),
    warning: Color(0xFFFFAA3D),
    guide: Color(0xFF007CF2),
    black: Color(0xFF000000),
    white: Color(0xFFFFFFFF),
    foreground: Color(0xFFFAFAFA),
    background: Color(0xFFEEEEEE),
  ),
  colorScheme: const BaseColorScheme(
    colorScheme: ColorScheme(
      primary: primary,
      secondary: secondary,
      surface: Color(0xFFEEEEEE),
      background: Color(0xFFEEEEEE),
      error: Color(0xFFFF654B),
      onPrimary: textOnPrimary,
      onSecondary: textOnForeground,
      onSurface: Color(0xFF5c5c5d),
      onBackground: Color(0xFF5c5c5d),
      onError: Color(0xFFFF654B),
      brightness: Brightness.light,
    ),
  ),
  logo: Image.asset(
    'assets/images/pokeball.png',
    height: 200,
    width: 200,
  ),
  baseInputDecorationTheme: BaseInputDecorationTheme(
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: PokeAppText.body3Style.copyWith(
        color: textOnForeground,
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: secondary,
        ),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: secondary,
        ),
      ),
    ),
  ),
  baseIconThemeData: const BaseIconThemeData(
    iconThemeData: IconThemeData(
      color: textOnPrimary,
    ),
  ),
  baseAppBarTheme: BaseAppBarTheme(
    appBarTheme: AppBarTheme(
      color: primary,
      titleTextStyle: PokeAppText.subtitle1Style.copyWith(color: textOnPrimary),
      toolbarTextStyle: PokeAppText.subtitle1Style.copyWith(color: textOnPrimary),
      iconTheme: const IconThemeData(
        color: textOnPrimary,
      ),
      actionsIconTheme: const IconThemeData(
        color: textOnPrimary,
      ),
    ),
  ),
);

final pokeAppDarkTheme = AppTheme(
  baseColors: const BaseThemeColors(
    primary: primary,
    primaryLight: primaryLight,
    primaryDark: primaryDark,
    secondary: secondary,
    onSecondary: secondary,
    secondaryLight: secondaryLight,
    secondaryDark: secondaryDark,
    text: text,
    textOnForeground: textOnPrimary,
    textOnPrimary: textOnPrimary,
    textOnSecondary: textOnPrimary,
    positive: Color(0xFF8AB341),
    error: Color(0xFFFF654B),
    warning: Color(0xFFFFAA3D),
    guide: Color(0xFF007CF2),
    black: Color(0xFF000000),
    white: Color(0xFFFFFFFF),
    foreground: Color(0xFF303030),
    background: Color(0xFF303030),
    cardBackground: Color(0xFF272727),
  ),
  colorScheme: const BaseColorScheme(
    colorScheme: ColorScheme(
      primary: primary,
      secondary: secondary,
      surface: Color(0xFFEEEEEE),
      background: Color(0xFF303030),
      error: Color(0xFFFF654B),
      onPrimary: textOnPrimary,
      onSecondary: textOnForeground,
      onSurface: Color(0xFF5c5c5d),
      onBackground: Color(0xFF5c5c5d),
      onError: Color(0xFFFF654B),
      brightness: Brightness.dark,
    ),
  ),
  logo: Image.asset(
    'assets/images/pokeball.png',
    height: 200,
    width: 200,
  ),
  baseInputDecorationTheme: BaseInputDecorationTheme(
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: PokeAppText.body3Style.copyWith(
        color: textOnForeground,
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: secondary,
        ),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: secondary,
        ),
      ),
    ),
  ),
  baseIconThemeData: const BaseIconThemeData(
    iconThemeData: IconThemeData(
      color: textOnPrimary,
    ),
  ),
  baseAppBarTheme: BaseAppBarTheme(
    appBarTheme: AppBarTheme(
      color: primary,
      titleTextStyle: PokeAppText.subtitle1Style.copyWith(color: textOnPrimary),
      toolbarTextStyle: PokeAppText.subtitle1Style.copyWith(color: textOnPrimary),
      iconTheme: const IconThemeData(
        color: textOnPrimary,
      ),
      actionsIconTheme: const IconThemeData(
        color: textOnPrimary,
      ),
    ),
  ),
);
