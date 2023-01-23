import 'package:rxdart/rxdart.dart';

const kAdWarningLabelMaxSize = 120;

class AdWarningViewModel {
  AdWarningViewModel() {
    Future.delayed(
      const Duration(seconds: 1),
    ).then(
      (value) => startAnimation(),
    );
  }

  final warningPositionStream = BehaviorSubject<int>.seeded(0);

  void startAnimation() async {
    warningPositionStream.add(kAdWarningLabelMaxSize);
    await Future.delayed(
      const Duration(seconds: 3),
    );
    warningPositionStream.add(0);
  }
}
