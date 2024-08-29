import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../../../api/models/filter_type.dart';
import '../../../api/models/pokemon/damage_type.dart';
import '../../../api/models/pokemon/gen_type.dart';
import '../../../api/models/pokemon/pokemon_request.dart';
import '../../../api/models/pokemon/pokemon_type.dart';
import '../adapters/pokemon_paging_adapter.dart';

class PokemonListViewModel {
  PokemonListViewModel(this.pokemonPagingAdapter) {
    searchAndFiltersSubscription = searchAndFilters.listen(_updateQuery);
  }

  final PokemonPagingAdapter pokemonPagingAdapter;

  PokemonRequest? pokemonRequest;

  late final StreamSubscription? searchAndFiltersSubscription;

  final search = BehaviorSubject<String>.seeded('');
  final filters = BehaviorSubject<List<FilterType>>.seeded([]);
  late final searchAndFilters = CombineLatestStream.combine2<String, List<FilterType>, PokemonRequest>(
    search,
    filters,
    (search, filters) {
      final pokemonTypes = filters.whereType<PokemonType>().toList();
      final genTypes = filters.whereType<GenType>().toList();
      final damageTypes = filters.whereType<DamageType>().toList();
      return PokemonRequest(
        (b) => b
          ..search = search
          ..pokemonTypes.replace(pokemonTypes)
          ..genTypes.replace(genTypes)
          ..damageTypes.replace(damageTypes),
      );
    },
  ).debounceTime(const Duration(milliseconds: 700));

  void setSearch(String search) {
    this.search.add(search);
  }

  void setFilters(List<FilterType> filters) {
    this.filters.add(filters);
  }

  void _updateQuery(PokemonRequest pokemonRequest) {
    pokemonPagingAdapter.setPokemonRequest(pokemonRequest);
    pokemonPagingAdapter.refresh();
  }

  void retryLastRequest() {
    pokemonPagingAdapter.pagingController.refresh();
  }

  void dispose() {
    search.close();
    filters.close();
    searchAndFiltersSubscription?.cancel();
    pokemonPagingAdapter.dispose();
  }
}
