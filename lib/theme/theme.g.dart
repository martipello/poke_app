//TODO remove these ignores for apps
//ignore_for_file:undefined_identifier
//ignore_for_file:creation_with_non_type
//ignore_for_file:uri_does_not_exist
//ignore_for_file:uri_has_not_been_generated

import 'dart:ui';

import 'package:flex_color_scheme/flex_color_scheme.dart';

import 'color_schemes.g.dart';

// Theme config for FlexColorScheme version 7.3.x. Make sure you use
// same or higher package version, but still same major version. If you
// use a lower package version, some properties may not be supported.
// In that case remove them after copying this theme to your app.
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/// The [AppTheme] defines light and dark themes for the app.
///
/// Theme setup for FlexColorScheme package v8.
/// Use same major flex_color_scheme package version. If you use a
/// lower minor version, some properties may not be supported.
/// In that case, remove them after copying this theme to your
/// app or upgrade the package to version 8.3.0.
///
/// Use it in a [MaterialApp] like this:
///
/// MaterialApp(
///   theme: AppTheme.light,
///   darkTheme: AppTheme.dark,
/// );
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
abstract final class AppTheme {
  // The FlexColorScheme defined light mode ThemeData.
  static ThemeData light = FlexThemeData.light(
    // Using FlexColorScheme built-in FlexScheme enum based colors
    scheme: FlexScheme.shadRed,
    // Component theme configurations for light mode.
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      useM2StyleDividerInM3: true,
      splashType: FlexSplashType.inkSparkle,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
    ),
    // Direct ThemeData properties.
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );

  // The FlexColorScheme defined dark mode ThemeData.
  static ThemeData dark = FlexThemeData.dark(
    // Using FlexColorScheme built-in FlexScheme enum based colors.
    scheme: FlexScheme.shadRed,
    // Component theme configurations for dark mode.
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      blendOnColors: true,
      useM2StyleDividerInM3: true,
      splashType: FlexSplashType.inkSparkle,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
    ),
    // Direct ThemeData properties.
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
}


// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,

// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,

class AdditionalColors {
  const AdditionalColors({
    this.normal = const Color(0xFFA8A878),
    this.water = const Color(0xFF6790F0),
    this.fire = const Color(0xFFF08030),
    this.grass = const Color(0xFF78C750),
    this.electric = const Color(0xFFF9CF30),
    this.ice = const Color(0xFF98D8D8),
    this.fighting = const Color(0xFFC13128),
    this.poison = const Color(0xFFA040A0),
    this.ground = const Color(0xFFE1C068),
    this.flying = const Color(0xFFA791F0),
    this.psychic = const Color(0xFFF85888),
    this.bug = const Color(0xFFA8B720),
    this.rock = const Color(0xFFB8A038),
    this.ghost = const Color(0xFF705898),
    this.dark = const Color(0xFF6F5848),
    this.dragon = const Color(0xFF7038),
    this.steel = const Color(0xFFB8B7D0),
    this.fairy = const Color(0xFFF0B6BC),
    this.special = const Color(0xFFFF7038),
    this.physical = const Color(0xFFB8B7D0),
    this.status = const Color(0xFFF0B6BC),
    this.link = const Color(0xFF6790F0),
  });

  final Color normal;
  final Color water;
  final Color fire;
  final Color grass;
  final Color electric;
  final Color ice;
  final Color fighting;
  final Color poison;
  final Color ground;
  final Color flying;
  final Color psychic;
  final Color bug;
  final Color rock;
  final Color ghost;
  final Color dark;
  final Color dragon;
  final Color steel;
  final Color fairy;
  final Color special;
  final Color physical;
  final Color status;
  final Color link;
}
