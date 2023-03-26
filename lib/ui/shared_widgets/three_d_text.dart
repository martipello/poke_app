import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class ThreeDText extends StatelessWidget {
  const ThreeDText({
    Key? key,
    required this.text,
    required this.strokeColor,
    required this.style,
    this.backgroundStyle,
    this.strokeWidth = 6.0,
    this.textAlign,
  }) : super(key: key);

  final String text;
  final Color strokeColor;
  final TextStyle style;
  final TextAlign? textAlign;
  final TextStyle? backgroundStyle;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return _buildPokemonTexts(context);
  }

  Widget _buildPokemonTexts(
    BuildContext context,
  ) {
    return Center(
      child: Stack(
        fit: StackFit.loose,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              right: 10.0,
              left: 10.0,
            ),
            child: _buildTransparentTextBackground(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 1.0,
              right: 1.0,
              left: 9.0,
            ),
            child: _buildPokemonTextBackground(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 2.0,
              right: 2.0,
              left: 8.0,
            ),
            child: _buildPokemonTextBackground(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 3.0,
              right: 3.0,
              left: 7.0,
            ),
            child: _buildPokemonTextBackground(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 4.0,
              right: 4.0,
              left: 6.0,
            ),
            child: _buildPokemonTextBackground(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 5.0,
              right: 5.0,
              left: 5.0,
            ),
            child: _buildPokemonTextBackground(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 6.0,
              right: 6.0,
              left: 4.0,
            ),
            child: _buildPokemonTextBackground(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 7.0,
              right: 7.0,
              left: 3.0,
            ),
            child: _buildPokemonTextBackground(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              right: 8.0,
              left: 2.0,
            ),
            child: _buildPokemonTextBackground(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 9.0,
              right: 9.0,
              left: 1.0,
            ),
            child: _buildPokemonTextBackground(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 4,
              left: 12.0,
            ),
            child: _buildPokemonTextWithBorder(),
          ),
        ],
      ),
    );
  }

  Widget _buildPokemonTextBackground() {
    return Text(
      text,
      style: backgroundStyle ?? style,
      textAlign: textAlign,
    );
  }

  Widget _buildTransparentTextBackground() {
    return Text(
      text,
      style: backgroundStyle?.copyWith(
            color: Colors.transparent,
          ) ??
          style.copyWith(
            color: Colors.transparent,
          ),
      textAlign: textAlign,
    );
  }

  Widget _buildPokemonTextWithBorder() {
    return BorderedText(
      strokeWidth: strokeWidth,
      strokeColor: strokeColor,
      child: Text(
        text,
        style: style,
        textAlign: textAlign,
      ),
    );
  }
}
