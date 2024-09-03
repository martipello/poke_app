import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../api/models/user_score.dart';
import '../../theme/poke_app_text.dart';
import '../shared_widgets/pokeball_loading_widget.dart';
import '../shared_widgets/three_d_text.dart';
import '../shared_widgets/view_constraint.dart';
import 'view_models/leaderboard_view_model.dart';

class LeaderboardPage extends StatelessWidget {
  LeaderboardPage({super.key});

  static const routeName = '/leaderboard';

  final leaderBoardViewModel = GetIt.instance.get<LeaderboardViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        automaticallyImplyLeading: true,
      ),
      backgroundColor: Colors.red,
      body: SafeArea(
        child: ViewConstraint(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              _buildThreeDText('Leaderboard', PokeAppText.pokeFontTitle1),
              const SizedBox(height: 32),
              StreamBuilder<QuerySnapshot<UserScore>>(
                stream: leaderBoardViewModel.getLeaderboard(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final scores = snapshot.data?.docs ?? [];
                    if (scores.isEmpty) {
                      return _buildThreeDText('No scores yet', PokeAppText.pokeFontSubtitle1);
                    }
                    return Expanded(
                      child: Column(
                        children: [
                          _buildTableHeader(),
                          const SizedBox(height: 16),
                          Expanded(
                            child: ListView.builder(
                              itemCount: scores.length,
                              itemBuilder: (context, index) {
                                final entry = scores[index].data();
                                return _buildLeaderBoardItem(index, entry);
                              },
                            ),
                          ),
                        ],
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

  Widget _buildTableHeader() {
    return Row(
      children: [
        _buildThreeDText('#', PokeAppText.pokeFontSubtitle1),
        const SizedBox(width: 16),
        _buildThreeDText('Name', PokeAppText.pokeFontSubtitle1),
        Spacer(),
        const SizedBox(width: 16),
        _buildOutlinedThumbsUp(),
        const SizedBox(width: 32),
        _buildOutlinedThumbsDown(),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildOutlinedThumbsUp() {
    return Stack(
      children: [
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => LinearGradient(
            colors: [Colors.blue.shade900, Colors.blue.shade700],
          ).createShader(bounds),
          child: Text(
            'U+1F44D',
            style: PokeAppText.pokeFontSubtitle1.copyWith(fontSize: PokeAppText.pokeFontSubtitle1.fontSize! + 8),
          ),
        ),
        const Positioned.fill(
          top: 3,
          child: Center(
            child: Text('👍', style: PokeAppText.pokeFontSubtitle1),
          ),
        ),
      ],
    );
  }
  Widget _buildOutlinedThumbsDown() {
    return Stack(
      children: [
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => LinearGradient(
            colors: [Colors.blue.shade700, Colors.blue.shade900],
          ).createShader(bounds),
          child: Text(
            '👎',
            style: PokeAppText.pokeFontSubtitle1.copyWith(fontSize: PokeAppText.pokeFontSubtitle1.fontSize! + 8),
          ),
        ),
        const Positioned.fill(
          bottom: 3,
          child: Center(
            child: Text('👎', style: PokeAppText.pokeFontSubtitle1),
          ),
        ),
      ],
    );
  }

  Widget _buildLeaderBoardItem(int index, UserScore entry) {
    return Row(
      children: [
        const SizedBox(width: 16),
        _buildThreeDText(
          (index + 1).toString(),
          PokeAppText.pokeFontSubtitle1,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildThreeDText(
            entry.name ?? entry.alias ?? '',
            PokeAppText.pokeFontSubtitle1,
          ),
        ),
        const SizedBox(width: 16),
        _buildThreeDText(
          entry.correctScore.toString(),
          PokeAppText.pokeFontSubtitle1,
        ),
        const SizedBox(width: 32),
        _buildThreeDText(
          entry.incorrectScore.toString(),
          PokeAppText.pokeFontSubtitle1,
        ),
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
