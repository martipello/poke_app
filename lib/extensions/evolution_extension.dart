import '../api/models/pokemon/evolution.dart';
import '../api/models/pokemon/evolution_holder.dart';

extension EvolutionHolderExtension on EvolutionHolder? {
  List<Evolution> getEvolutions() {
    return this?.pokemon_v2_pokemonspecies
        .map(
          (specie) => specie.pokemon_v2_pokemonevolutions,
    )
        .expand(
          (evolutions) => evolutions,
    )
        .toList() ?? [];
  }
}
