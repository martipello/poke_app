import 'package:flutter/material.dart';

import '../../theme/poke_app_text.dart';
import '../shared_widgets/three_d_text.dart';

typedef OnChanged = void Function(bool);

class AutoRetry extends StatelessWidget {
  const AutoRetry({
    Key? key,
    required this.isAutoRetry, required this.onChanged,
  }) : super(key: key);

  final bool isAutoRetry;
  final OnChanged onChanged;


  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      activeColor: Colors.blue.shade700,
      inactiveThumbColor: Colors.blue.shade700,
      activeTrackColor: Colors.yellow,
      inactiveTrackColor: Colors.yellow,
      trackOutlineColor: MaterialStateProperty.all(Colors.yellow),
      thumbColor: MaterialStateProperty.all(Colors.blue.shade700),
      value: isAutoRetry,
      onChanged: onChanged,
      title: _buildThreeDScoreText('Auto Retry'),
    );
  }

  Widget _buildThreeDScoreText(String text) {
    return ThreeDText(
      text: text,
      textAlign: TextAlign.center,
      strokeColor: Colors.blue.shade700,
      style: PokeAppText.pokeFontTitle1.copyWith(
        fontSize: 20,
        color: Colors.yellow,
      ),
      backgroundStyle: PokeAppText.pokeFontTitle1.copyWith(
        fontSize: 21,
        color: Colors.blue.shade900,
      ),
    );
  }
}
