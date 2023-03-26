import 'package:rxdart/subjects.dart';
import 'package:tuple/tuple.dart';

import '../../../services/shared_preferences_service.dart';

class ScoreViewModel {
  ScoreViewModel(this.sharedPreferencesService);

  final SharedPreferencesService sharedPreferencesService;

  final winsAndLossesStream = BehaviorSubject<Tuple2<int, int>>();

  void init() async {
    final wins = await sharedPreferencesService.getWinsScore() ?? 0;
    final losses = await sharedPreferencesService.getLossesScore() ?? 0;
    winsAndLossesStream.add(Tuple2(wins, losses));
  }

  void resetScores() {
    sharedPreferencesService.setWinsScore(0);
    sharedPreferencesService.setLossesScore(0);
    winsAndLossesStream.add(Tuple2(0, 0));
  }

  void addWin() async {
    final wins = await sharedPreferencesService.getWinsScore() ?? 0;
    final losses = await sharedPreferencesService.getLossesScore() ?? 0;
    final incrementWins = wins + 1;
    sharedPreferencesService.setWinsScore(incrementWins);
    winsAndLossesStream.add(Tuple2(incrementWins, losses));
  }

  void addLoss() async {
    final wins = await sharedPreferencesService.getWinsScore() ?? 0;
    final losses = await sharedPreferencesService.getLossesScore() ?? 0;
    final incrementLosses = losses + 1;
    sharedPreferencesService.setLossesScore(incrementLosses);
    winsAndLossesStream.add(Tuple2(wins, incrementLosses));
  }

  void dispose(){
    winsAndLossesStream.close();
  }
}
