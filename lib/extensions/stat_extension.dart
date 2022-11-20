import '../api/models/pokemon/pokemon_stat.dart';
import 'string_extension.dart';

extension StatExtension on PokemonStat? {

  String displayName(){
    return this?.pokemon_v2_stat?.name?.replaceAll('-', ' ').replaceAll('special', 'Sp').capitalize() ?? '';
  }
}