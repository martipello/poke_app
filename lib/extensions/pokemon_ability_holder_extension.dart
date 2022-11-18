import '../api/models/pokemon/pokemon_ability_holder.dart';
import 'iterable_extension.dart';
import 'string_extension.dart';

extension PokemonAbilityHolderExtension on PokemonAbilityHolder? {
  String title() {
    return this?.pokemon_v2_ability?.name.capitalize() ?? '';
  }

  String description() {
    return this?.pokemon_v2_ability?.pokemon_v2_abilityflavortexts.lastOrNull()?.flavor_text ?? '';
  }

  String versionDisplayName() {
    final versionGroups = this?.pokemon_v2_ability?.pokemon_v2_abilityflavortexts.map(
          (p0) => p0.pokemon_v2_versiongroup?.name,
        ).whereType<String>() ?? [];
    return versionGroups.join(', ').split(RegExp('-')).join(' ').capitalize();
  }

  String shortEffect(){
    return this?.pokemon_v2_ability?.pokemon_v2_abilityeffecttexts.lastOrNull()?.short_effect ?? '';
  }

  String mainSeries(){
    return this?.pokemon_v2_ability?.is_main_series == true ? 'Yes' : 'No';
  }
}
