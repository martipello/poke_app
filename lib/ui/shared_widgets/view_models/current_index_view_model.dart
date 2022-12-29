import 'package:rxdart/rxdart.dart';

class CurrentIndexViewModel {

  final currentIndexStream = BehaviorSubject<double>.seeded(0);

  void dispose(){
    currentIndexStream.close();
  }
}