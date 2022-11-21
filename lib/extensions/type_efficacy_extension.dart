import '../api/models/pokemon/type_efficacies.dart';
import 'double_extension.dart';

extension TypeEfficaciesExtension on TypeEfficacies {

  String calculateDamageFactor() {
    final damageFactor = damage_factor ?? 0;
    if (damageFactor == 0) {
      return '0';
    } else {
      return (damageFactor / 10000).removeTrailingZero();
    }
  }

}
