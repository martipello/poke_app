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
final kLightTheme = FlexThemeData.light(
  colors: const FlexSchemeColor(
    primary: Color(0xffb71c1c),
    primaryContainer: Color(0xffd0e4ff),
    secondary: Color(0xffac3306),
    secondaryContainer: Color(0xffffdbcf),
    tertiary: Color(0xff006875),
    tertiaryContainer: Color(0xff95f0ff),
    appBarColor: Color(0xffffdbcf),
    error: Color(0xffb00020),
  ),
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 7,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 10,
    blendOnColors: false,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    alignedDropdown: true,
    useInputDecoratorThemeInDialogs: true,
  ),
  keyColors: const FlexKeyColors(),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
// To use the Playground font, add GoogleFonts package and uncomment
// fontFamily: GoogleFonts.notoSans().fontFamily,
);

final kDarkTheme = FlexThemeData.dark(
  colors: const FlexSchemeColor(
    primary: Color(0xffb71c1c),
    primaryContainer: Color(0xff00325b),
    secondary: Color(0xffffb59d),
    secondaryContainer: Color(0xff872100),
    tertiary: Color(0xff86d2e1),
    tertiaryContainer: Color(0xff004e59),
    appBarColor: Color(0xff872100),
    error: Color(0xffcf6679),
  ),
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 13,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    alignedDropdown: true,
    useInputDecoratorThemeInDialogs: true,
  ),
  keyColors: const FlexKeyColors(),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
// To use the Playground font, add GoogleFonts package and uncomment
// fontFamily: GoogleFonts.notoSans().fontFamily,
);
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
