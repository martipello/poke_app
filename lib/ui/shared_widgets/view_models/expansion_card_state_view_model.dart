import 'package:rxdart/rxdart.dart';

class ExpansionCardStateViewModel {
  final isExpandedStateStream = BehaviorSubject<bool>.seeded(false);

  void dispose() {
    isExpandedStateStream.close();
  }
}
