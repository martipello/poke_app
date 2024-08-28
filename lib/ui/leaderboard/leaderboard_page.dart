import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../api/models/user_score.dart';
import '../../theme/poke_app_text.dart';
import '../shared_widgets/loading_widget.dart';
import '../shared_widgets/three_d_text.dart';
import '../shared_widgets/view_constraint.dart';
import 'view_models/leaderboard_view_model.dart';

class LeaderboardPage extends StatelessWidget {
  LeaderboardPage({super.key});

  static const routeName = 'leaderboard';

  final leaderBoardViewModel = GetIt.instance.get<LeaderboardViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: ViewConstraint(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              _buildThreeDText('Leaderboard'),
              const SizedBox(height: 32),
              StreamBuilder<QuerySnapshot<UserScore>>(
                stream: leaderBoardViewModel.getLeaderboard(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final scores = snapshot.requireData;
                    return Expanded(
                      child: ListView.builder(
                        itemCount: scores.size,
                        itemBuilder: (context, index) {
                          final entry = scores.docs[index].data();
                          return ListTile(
                            title: Text(entry.name),
                            trailing: Text(entry.score.toString()),
                          );
                        },
                      ),
                    );
                  }
                  return const LoadingWidget(valueColor: Colors.yellow);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThreeDText(String text) {
    return ThreeDText(
      text: text,
      textAlign: TextAlign.center,
      strokeColor: Colors.blue.shade700,
      style: PokeAppText.pokeFontTitle1.copyWith(
        color: Colors.yellow,
      ),
      backgroundStyle: PokeAppText.pokeFontTitle1.copyWith(
        color: Colors.blue.shade900,
      ),
    );
  }
}
