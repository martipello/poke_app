import 'package:flutter/services.dart';
import 'package:games_services/games_services.dart';
import 'package:rxdart/subjects.dart';

import '../../../services/shared_preferences_service.dart';
import '../../../utils/console_output.dart';

class ScoreViewModel {
  ScoreViewModel(this.sharedPreferencesService);

  final SharedPreferencesService sharedPreferencesService;

  final winsAndLossesStream = BehaviorSubject<({int wins, int losses})>.seeded((wins: 0, losses: 0));

  Future<void> init() async {
    final wins = await sharedPreferencesService.getWinsScore() ?? 0;
    final losses = await sharedPreferencesService.getLossesScore() ?? 0;
    winsAndLossesStream.add((wins: wins, losses: losses));
    try {
      await GameAuth.signIn();
      final isSignedIn = await GameAuth.isSignedIn;
      log('GamesServices').d('signIn: $isSignedIn');
    } on PlatformException catch (e) {
      // TODO deal with failures
      log('GamesServices').d('PlatformException: $e');
    }
  }

  void resetScores() {
    sharedPreferencesService.setWinsScore(0);
    sharedPreferencesService.setLossesScore(0);
    winsAndLossesStream.add((wins: 0, losses: 0));
  }

  void addWin() async {
    final winsAndLosses = winsAndLossesStream.value;
    final wins = winsAndLosses.wins + 1;
    sharedPreferencesService.setWinsScore(wins);
    winsAndLossesStream.add((wins: wins, losses: winsAndLosses.losses));
  }

  void addLoss() async {
    final winsAndLosses = winsAndLossesStream.value;
    final losses = winsAndLosses.losses + 1;
    sharedPreferencesService.setWinsScore(losses);
    winsAndLossesStream.add((wins: winsAndLosses.wins, losses: losses));
  }

  Future<String?> showLeaderboard() async {
    final isSignedIn = await GameAuth.isSignedIn;
    log('GamesServices').d('signIn: $isSignedIn');
    return GamesServices.showLeaderboards(
      androidLeaderboardID: 'CgkIioO1k68REAIQAQ',
    );
  }

  // Future<String?> sendScoreToLeaderboard() async {
  //   final wins = winsAndLossesStream.value.item1;
  //   return Leaderboards.submitScore(
  //     score: Score(
  //       value: wins,
  //       androidLeaderboardID: 'CgkIioO1k68REAIQAQ',
  //     ),
  //   );
  // }

  void dispose() {
    winsAndLossesStream.close();
  }
}
