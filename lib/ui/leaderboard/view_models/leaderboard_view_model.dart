import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../api/models/user_score.dart';

const leaderboardCollection = 'leaderboard';

class LeaderboardViewModel {
  LeaderboardViewModel(this.firebaseFirestore);

  final FirebaseFirestore firebaseFirestore;
  
  Stream<QuerySnapshot<UserScore>> getLeaderboard() {
    return getLeaderboardReference().snapshots();
  }

  Query<UserScore> getLeaderboardReference() {
    return firebaseFirestore.collection(leaderboardCollection).orderBy('score').limit(10).withConverter<UserScore>(
      fromFirestore: (snapshot, _) => UserScore.fromJson(snapshot.data()!),
      toFirestore: (userScore, _) => userScore.toJson(),
    );
  }

  void addScore(UserScore userScore) {
    firebaseFirestore.collection(leaderboardCollection).add(userScore.toJson());
  }
}
