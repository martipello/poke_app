import 'package:rxdart/subjects.dart';
import 'package:tuple/tuple.dart';

import '../../../services/shared_preferences_service.dart';

class ScoreViewModel {
  ScoreViewModel(this.sharedPreferencesService);

  final SharedPreferencesService sharedPreferencesService;

  final winsAndLossesStream = BehaviorSubject<({int wins, int losses, int skips})>();

  void init() async {
    final wins = await sharedPreferencesService.getWinsScore() ?? 0;
    final losses = await sharedPreferencesService.getLossesScore() ?? 0;
    final skips = await sharedPreferencesService.getSkipsScore() ?? 0;
    winsAndLossesStream.add((wins: wins, losses: losses, skips: skips));
  }

  void resetScores() {
    sharedPreferencesService.setWinsScore(0);
    sharedPreferencesService.setLossesScore(0);
    sharedPreferencesService.setSkipsScore(0);
    winsAndLossesStream.add((wins: 0, losses: 0, skips: 0));
  }

  void addWin() {
    final wins = winsAndLossesStream.value.wins;
    final losses = winsAndLossesStream.value.losses;
    final skips = winsAndLossesStream.value.skips;
    final incrementWins = wins + 1;
    sharedPreferencesService.setWinsScore(incrementWins);
    winsAndLossesStream.add((wins: incrementWins, losses: losses, skips: skips));
  }

  void addSkip() async {
    final wins = winsAndLossesStream.value.wins;
    final losses = winsAndLossesStream.value.losses;
    final skips = winsAndLossesStream.value.skips;
    final incrementSkips = skips + 1;
    sharedPreferencesService.setWinsScore(incrementSkips);
    winsAndLossesStream.add((wins: wins, losses: losses, skips: incrementSkips));
  }

  void addLoss() async {
    final wins = winsAndLossesStream.value.wins;
    final losses = winsAndLossesStream.value.losses;
    final skips = winsAndLossesStream.value.skips;
    final incrementLosses = losses + 1;
    sharedPreferencesService.setLossesScore(incrementLosses);
    winsAndLossesStream.add((wins: wins, losses: incrementLosses, skips: skips));
  }

  void dispose(){
    winsAndLossesStream.close();
  }
}
