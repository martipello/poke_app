import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../api/models/user_score.dart';
import '../../theme/poke_app_text.dart';
import '../shared_widgets/loading_widget.dart';
import '../shared_widgets/pokeball_loading_widget.dart';
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
              _buildThreeDText('Leaderboard', PokeAppText.pokeFontTitle1),
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
                          return _buildLeaderBoardItem(index, entry);
                        },
                      ),
                    );
                  }
                  return const PokeballLoadingWidget();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeaderBoardItem(int index, UserScore entry) {
    return Row(
      children: [
        const SizedBox(width: 16),
        _buildThreeDText((index + 1).toString(), PokeAppText.pokeFontSubtitle1),
        const SizedBox(width: 16),
        Expanded(
          child: _buildThreeDText(entry.name, PokeAppText.pokeFontSubtitle1),
        ),
        const SizedBox(width: 16),
        _buildThreeDText(entry.score.toString(), PokeAppText.pokeFontSubtitle1),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildThreeDText(String text, TextStyle style) {
    return ThreeDText(
      text: text,
      textAlign: TextAlign.center,
      strokeColor: Colors.blue.shade700,
      style: style.copyWith(
        color: Colors.yellow,
      ),
      backgroundStyle: style.copyWith(
        color: Colors.blue.shade900,
      ),
    );
  }
}
