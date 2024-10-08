import 'package:built_collection/built_collection.dart';

import '../api/models/pokemon/type_data_holder.dart';
import '../api/models/pokemon/type_efficacies.dart';
import 'iterable_extension.dart';

extension TypeListExtension on BuiltList<TypeDataHolder> {
  List<TypeEfficacies> calculateTypeEfficacies() {
    return _calculateTargetTypeEfficacies(_allTargetTypeEfficacies());
  }

  Iterable<TypeEfficacies> _allTargetTypeEfficacies() => map(
        (te) => te.pokemon_v2_type?.pokemonV2TypeefficaciesByTargetTypeId,
      ).whereType<BuiltList<TypeEfficacies>>().expand((element) => element).whereType<TypeEfficacies>();

  List<TypeEfficacies> _calculateTargetTypeEfficacies(Iterable<TypeEfficacies> typeEfficacies) {
    final myTypeEfficacies = <TypeEfficacies>[];
    for (var index = 0; index < typeEfficacies.length; index++) {
      final typeEfficacy = typeEfficacies.get(index);
      if (myTypeEfficacies.map((e) => e.pokemon_v2_type?.name).contains(typeEfficacy.pokemon_v2_type?.name)) {
        //add its damage_factor to the existing damage_factor
        final existingTypeEfficacy = myTypeEfficacies.firstWhere(
          (e) => e.pokemon_v2_type?.name == typeEfficacy.pokemon_v2_type?.name,
        );
        final existingDamageFactor = _normalizeDamageFactor(existingTypeEfficacy.damage_factor ?? 0);
        final newDamageFactor = _normalizeDamageFactor(typeEfficacy.damage_factor ?? 0);

        myTypeEfficacies.remove(existingTypeEfficacy);
        myTypeEfficacies.add(
          existingTypeEfficacy.rebuild(
            (p0) => p0..damage_factor = _normalizeDamageFactor(existingDamageFactor * newDamageFactor),
          ),
        );
      } else {
        final damageFactor = _normalizeDamageFactor(typeEfficacy.damage_factor ?? 0);
        myTypeEfficacies.add(
          typeEfficacy.rebuild(
            (p0) => p0..damage_factor = damageFactor,
          ),
        );
      }
    }
    myTypeEfficacies.sort(
      (a, b) =>
          b.damage_factor?.compareTo(
            a.damage_factor ?? 0,
          ) ??
          0,
    );
    return myTypeEfficacies.toList();
  }

  double _normalizeDamageFactor(double damageFactor) {
    final damageFactorString = damageFactor.toString();
    if (damageFactorString.contains('25')) {
      return 25;
    } else if (damageFactorString.contains('50')) {
      return 50;
    } else if (damageFactorString.contains('1')) {
      return 100;
    } else if (damageFactorString.contains('2')) {
      return 200;
    } else {
      return 100;
    }
  }
}
