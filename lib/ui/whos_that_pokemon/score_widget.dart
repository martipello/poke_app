import 'package:flutter/material.dart';

import '../../api/models/user_score.dart';
import '../../extensions/build_context_extension.dart';
import '../../theme/poke_app_text.dart';
import '../shared_widgets/three_d_text.dart';

class ScoreWidget extends StatelessWidget {
  ScoreWidget({
    Key? key,
    required this.userScore,
  }) : super(key: key);

  final UserScore userScore;

  @override
  Widget build(BuildContext context) {
    final wins = userScore.correctScore ?? 0;
    final losses = userScore.incorrectScore ?? 0;
    final skips = userScore.skippedScore ?? 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildThreeDScoreText(
          '${context.strings.correct} $wins',
        ),
        _buildThreeDScoreText(
          '${context.strings.incorrect} $losses',
        ),
        _buildThreeDScoreText(
          '${context.strings.skip}ped $skips',
        ),
      ],
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
