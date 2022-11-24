import '../api/models/pokemon/pokemon.dart';
import '../api/models/pokemon/pokemon_ability_holder.dart';
import '../api/models/pokemon/pokemon_move_holder.dart';
import '../api/models/pokemon/pokemon_resource.dart';
import '../utils/console_output.dart';
import 'iterable_extension.dart';

extension PokemonExtension on Pokemon? {

  List<PokemonResource> pokedexEntries() {
    final entries = this?.pokemon_v2_pokemonspecy?.pokemon_v2_pokemonspeciesflavortexts.toList() ?? [];
    return entries.uniqueBy((entry) => entry.pokemon_v2_version?.pokemon_v2_versiongroup?.name).toList();
  }

  List<PokemonAbilityHolder> abilities() {
    return this?.pokemon_v2_pokemonabilities.toList() ?? [];
  }

  String shape() {
    return this?.pokemon_v2_pokemonspecy?.pokemon_v2_pokemonshape?.name ?? '';
  }

  String pokemonHeight() {
    final height = this?.height ?? 0;
    if (height <= 0) {
      return '? cm';
    } else {
      if (height * 10 < 100) {
        return '${(height * 10).toInt().toString()} cm';
      } else {
        return '${(height / 10).toString()} m';
      }
    }
  }

  String pokemonWeight() {
    final weight = this?.weight ?? 0;
    if (weight <= 0) {
      return '? kg';
    } else {
      return '${(weight / 10).toString()} kg';
    }
  }

  List<PokemonMoveHolder> pokemonMoves() {
    final _pokemonMoves = this?.pokemon_v2_pokemonmoves.toList() ?? [];
    final groupedMoves = _pokemonMoves.groupBy((e) => e.pokemon_v2_move?.id);
    log('MOVES').d(groupedMoves);
    // log('MOVES').d('GROUP MOVE COUNT ${groupedMoves.length}');
    // log('MOVES').d('MOVE COUNT ${_pokemonMoves.length}');
    // final moves = groupedMoves.values.map((moves) => moves.map((move) => move.rebuild((mb) => mb..),),);
    return _pokemonMoves;
  }
}