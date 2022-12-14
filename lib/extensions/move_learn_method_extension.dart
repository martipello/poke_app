import '../api/models/pokemon/move_learn_method.dart';
import 'iterable_extension.dart';

extension MoveLearnMethodExtension on MoveLearnMethod? {
  String description() {
    return this
            ?.pokemon_v2_versiongroupmovelearnmethods
            .firstOrNull()
            ?.pokemon_v2_movelearnmethod
            ?.pokemon_v2_movelearnmethoddescriptions
            .firstOrNull()
            ?.description ??
        '';
  }
}
