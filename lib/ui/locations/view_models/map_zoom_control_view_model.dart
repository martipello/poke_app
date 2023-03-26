import 'package:rxdart/rxdart.dart';

const kMaxZoom = 10;
const kMinZoom = 1;

class MapZoomControlViewModel {
  final zoomStream = BehaviorSubject<double?>.seeded(0);

  void dispose() {
    zoomStream.close();
  }
}
