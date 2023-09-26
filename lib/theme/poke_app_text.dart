import 'package:flutter/widgets.dart';

extension TextStyleExtension on TextStyle {
  double get lineHeight => fontSize! * height!;

  TextStyle operator +(Color color) {
    return copyWith(color: color);
  }
}

class PokeAppText {
  PokeAppText._();

  // Title

  static const title1Style = TextStyle(fontSize: 24, fontWeight: FontWeight.bold, height: 1.6);

  static const title2Style = TextStyle(fontSize: 24, fontWeight: FontWeight.normal, height: 1.6);

  static const title3Style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 1.2);

  static const title4Style = TextStyle(fontSize: 20, fontWeight: FontWeight.normal, height: 1.2);

  static const pokeFontTitle1 =
      TextStyle(fontSize: 42, fontWeight: FontWeight.normal, height: 1.4, fontFamily: 'PokemonSolid');

  // Subtitle

  static const subtitle1Style = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, height: 1.875);

  static const subtitle2Style = TextStyle(fontSize: 18, fontWeight: FontWeight.normal, height: 1.875);

  static const subtitle3Style = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, height: 1.625);

  static const subtitle4Style = TextStyle(fontSize: 14, fontWeight: FontWeight.bold, height: 1.375);

  // Body

  static const pokeFontBody1 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.normal, height: 1.4, fontFamily: 'PokemonSolid');

  static const body1Style = TextStyle(fontSize: 16, fontWeight: FontWeight.normal, height: 1.1);

  static const body2Style = TextStyle(fontSize: 16, fontWeight: FontWeight.w300, height: 1.625);

  static const body3Style = TextStyle(fontSize: 14, fontWeight: FontWeight.normal, height: 1.375);

  static const body4Style = TextStyle(fontSize: 14, fontWeight: FontWeight.w300, height: 1.375);

  static const body5Style = TextStyle(fontSize: 13, fontWeight: FontWeight.normal, height: 1.375);

  static const body6Style = TextStyle(fontSize: 13, fontWeight: FontWeight.bold, height: 1.375);

  static const body7Style = TextStyle(fontSize: 16, fontWeight: FontWeight.w300, height: 1.375);

  // Caption

  static const captionStyle = TextStyle(fontSize: 12, fontWeight: FontWeight.normal, height: 1.375);

  // Header

  static const h1Style = TextStyle(fontSize: 48, fontWeight: FontWeight.normal, height: 4.125);

  static const h2Style = TextStyle(fontSize: 34, fontWeight: FontWeight.normal, height: 3.188);

  static const h3Style = TextStyle(fontSize: 24, fontWeight: FontWeight.bold, height: 2.375);

  static const h4Style = TextStyle(fontSize: 24, fontWeight: FontWeight.normal, height: 1.2);

  static const h5Style = TextStyle(fontSize: 20, fontWeight: FontWeight.normal, height: 1.2);

  static const h6Style = TextStyle(fontSize: 42, fontWeight: FontWeight.normal, height: 3.188);

  // Button

  static const button1Style = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, height: 1.875);

  static const button2Style = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, height: 1.625);
}
