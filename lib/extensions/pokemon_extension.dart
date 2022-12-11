import '../api/models/pokemon/pokemon.dart';
import '../api/models/pokemon/pokemon_ability_holder.dart';
import '../api/models/pokemon/pokemon_form_with_version_group.dart';
import '../api/models/pokemon/pokemon_move_holder.dart';
import '../api/models/pokemon/pokemon_resource.dart';
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
    return this?.pokemon_v2_pokemonspecy?.pokemon_v2_pokemonshape?.pokemon_v2_shapenames.firstOrNull()?.name ?? '';
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
    return _pokemonMoves;
  }

  List<PokemonFormWithVersionGroup> getFormHolders() {
    return this
            ?.pokemon_v2_pokemonspecy
            ?.pokemon_v2_pokemons
            .map(
              (speciesHolder) => speciesHolder.pokemon_v2_pokemonforms,
            )
            .expand((element) => element)
            .whereType<PokemonFormWithVersionGroup>()
            .where(
              (formHolder) => formHolder.pokemon_v2_pokemonformnames.isNotEmpty,
            )
            .toList() ??
        [];
  }
}
