import 'package:tuple/tuple.dart';

import '../../../services/shared_preferences_service.dart';
import '../../../utils/stream_helper.dart';

class ScoreViewModel {
  ScoreViewModel(this.sharedPreferencesService);

  final SharedPreferencesService sharedPreferencesService;

  Future<Tuple2<int, int>> getWinsAndLosses() async {
    final wins = await sharedPreferencesService.getWinsScore() ?? 0;
    final losses = await sharedPreferencesService.getLossesScore() ?? 0;
    return Tuple2(wins, losses);
  }

  void resetScores() {
    sharedPreferencesService.setWinsScore(0);
    sharedPreferencesService.setLossesScore(0);
  }

  void addWin() async {
    final wins = await sharedPreferencesService.getWinsScore() ?? 0;
    sharedPreferencesService.setWinsScore((wins + 1));
  }

  void addLoss() async {
    final losses = await sharedPreferencesService.getLossesScore() ?? 0;
    sharedPreferencesService.setLossesScore((losses + 1));
  }
}
