import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/subjects.dart';

import '../../../api/error_handler.dart';
import '../../../api/models/api_response.dart';
import '../../../api/models/error_response.dart';
import '../../../api/models/user_score.dart';
import '../../../services/shared_preferences_service.dart';
import '../../leaderboard/view_models/leaderboard_view_model.dart';

class ScoreViewModel {
  ScoreViewModel(
    this.sharedPreferencesService,
    this.firebaseFirestore,
    this.firebaseAuth,
    this.errorHandler,
  );

  final SharedPreferencesService sharedPreferencesService;
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;
  final ErrorHandler errorHandler;

  final submitScoreState = BehaviorSubject<ApiResponse<void>>();
  final userScore = BehaviorSubject<UserScore>();

  Future<void> init() async {
    await firebaseAuth.signInAnonymously();
    final wins = await sharedPreferencesService.getWinsScore() ?? 0;
    final losses = await sharedPreferencesService.getLossesScore() ?? 0;
    final skips = await sharedPreferencesService.getSkipsScore() ?? 0;
    setUserScore(
      UserScore(
        (b) => b
          ..correctScore = wins
          ..incorrectScore = losses
          ..skippedScore = skips,
      ),
    );
  }

  void setUserScore(UserScore userScore) {
    this.userScore.add(userScore);
  }

  void resetScores() {
    sharedPreferencesService.setWinsScore(0);
    sharedPreferencesService.setLossesScore(0);
    sharedPreferencesService.setSkipsScore(0);
    setUserScore(
      UserScore(
        (b) => b
          ..correctScore = 0
          ..incorrectScore = 0
          ..skippedScore = 0,
      ),
    );
  }

  void addWin() {
    final userScore = this.userScore.value;
    final incrementWins = userScore.correctScore + 1;
    sharedPreferencesService.setWinsScore(incrementWins);
    setUserScore(userScore.rebuild((b) => b..correctScore = incrementWins));
  }

  void addSkip() async {
    final userScore = this.userScore.value;
    final skips = userScore.skippedScore;
    final incrementSkips = skips + 1;
    sharedPreferencesService.setWinsScore(incrementSkips);
    setUserScore(userScore.rebuild((b) => b..skippedScore = incrementSkips));
  }

  void addLoss() async {
    final userScore = this.userScore.value;
    final incrementLosses = userScore.incorrectScore + 1;
    sharedPreferencesService.setLossesScore(incrementLosses);
    setUserScore(userScore.rebuild((b) => b..incorrectScore = incrementLosses));
  }

  void updateScoreName(String text) {
    final userScore = this.userScore.value;
    setUserScore(userScore.rebuild((b) => b..name = text));
  }

  Future<void> submitScore() async {
    final userScore = this.userScore.value;
    submitScoreState.add(ApiResponse.loading(null));
    try {
      final user = firebaseAuth.currentUser;
      if (user != null) {
        final userId = user.uid;
        await firebaseFirestore.collection(leaderboardCollection).doc(userId).set(sanitizeUserScore(userScore, userId).toJson());
      } else {
        final anonymousUser = await firebaseAuth.signInAnonymously();
        final userId = anonymousUser.user?.uid;
        await firebaseFirestore.collection(leaderboardCollection).doc(userId).set(sanitizeUserScore(userScore, userId).toJson());
      }
      submitScoreState.add(ApiResponse.completed(null));
    } catch (error) {
      submitScoreState.add(errorHandler.handleError(error));
    }
  }

  UserScore sanitizeUserScore(UserScore userScore, String? userId) {
    if (userId == null) {
      throw ErrorResponse((b) => b..message = 'Could not get user ID');
    }
    if (userScore.name == null || userScore.name!.isEmpty) {
      throw ErrorResponse((b) => b..message = 'Name cannot be empty');
    }
    if (userScore.correctScore < 10) {
      throw ErrorResponse((b) => b..message = 'You need at least 10 correct answers to submit your score');
    }
    return userScore.rebuild((b) => b
      ..uid = userId
      ..createdDate = DateTime.now());
  }

  void dispose() {
    userScore.close();
  }
}
