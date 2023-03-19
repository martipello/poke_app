import 'package:rxdart/rxdart.dart';
import 'package:tuple/tuple.dart';

class ScoreViewModel {
  final winsAndLossesStream = BehaviorSubject<Tuple2<int, int>>();

  void addWin() {
    final winsAndLosses = winsAndLossesStream.valueOrNull;
    final wins = winsAndLosses?.item1;
    final losses = winsAndLosses?.item2;
    winsAndLossesStream.add(
      Tuple2((wins ?? 0) + 1, losses ?? 0),
    );
  }

  void addLoss() {
    final winsAndLosses = winsAndLossesStream.valueOrNull;
    final wins = winsAndLosses?.item1;
    final losses = winsAndLosses?.item2;
    winsAndLossesStream.add(
      Tuple2(wins ?? 0, (losses ?? 0) + 1),
    );
  }

  void dispose() {
    winsAndLossesStream.close();
  }
}
