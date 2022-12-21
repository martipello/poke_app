import 'package:rxdart/rxdart.dart';

class MapZoomControlViewModel {
  final zoomStream = BehaviorSubject<double?>.seeded(0);

  void dispose() {
    zoomStream.close();
  }
}