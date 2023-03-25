import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../../extensions/build_context_extension.dart';
import '../../theme/poke_app_text.dart';
import '../shared_widgets/three_d_text.dart';
import 'view_models/score_view_model.dart';

class ScoreWidget extends StatelessWidget {
  ScoreWidget({
    Key? key,
    required this.scoreViewModel,
  }) : super(key: key);

  final ScoreViewModel scoreViewModel;

  @override
  Widget build(BuildContext context) {
    return _buildScore();
  }

  Widget _buildScore() {
    return StreamBuilder<Tuple2<int?, int?>>(
      stream: scoreViewModel.getWinsAndLosses().asStream(),
      builder: (context, snapshot) {
        final wins = snapshot.data?.item1 ?? 0;
        final losses = snapshot.data?.item2 ?? 0;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildThreeDScoreText(
              '${context.strings.correct} $wins',
            ),
            _buildThreeDScoreText(
              '${context.strings.incorrect} $losses',
            ),
          ],
        );
      },
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
