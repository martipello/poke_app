import '../api/models/pokemon/pokemon_form.dart';

extension PokemonFormExtension on PokemonForm? {
  String title() {
    if(this?.is_default == true) {
      return 'Default';
    }
    return this?.form_name ?? 'Unknown';
  }

  String isMega() {
    return this?.is_mega == true ? 'Yes' : 'No';
  }

  String isBattleOnly() {
    return this?.is_battle_only == true ? 'Yes' : 'No';
  }

  String isDefault() {
    return this?.is_default == true ? 'Yes' : 'No';
  }
}
