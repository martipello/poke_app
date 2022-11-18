import '../api/models/pokemon/pokemon_resource.dart';
import 'string_extension.dart';

extension PokemonExtension on PokemonResource? {
  String versionGroupName() {
    final _versionGroupName = this?.pokemon_v2_version?.pokemon_v2_versiongroup?.name ?? '';
    return _versionGroupName.split(RegExp('-')).join(' ').capitalize();
  }

  String flavorText() {
    return this?.flavor_text?.replaceAll(RegExp('\n'), ' ') ?? '';
  }
}
