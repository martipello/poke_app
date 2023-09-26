import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rxdart/rxdart.dart';

import '../../../api/models/filter_type.dart';
import '../../../api/models/pokemon/damage_type.dart';
import '../../../api/models/pokemon/gen_type.dart';
import '../../../api/models/pokemon/pokemon.dart';
import '../../../api/models/pokemon/pokemon_request.dart';
import '../../../api/models/pokemon/pokemon_type.dart';
import '../adapters/pokemon_paging_adapter.dart';

class PokemonListViewModel {
  PokemonListViewModel(this._pokemonPagingAdapter);

  final PokemonPagingAdapter _pokemonPagingAdapter;

  PokemonRequest? pokemonRequest;

  var _isPagingAdapterInitialized = false;

  final searchText = BehaviorSubject<String?>.seeded('');

  final _pagingController = PagingController<int, Pokemon>(
    firstPageKey: 0,
    invisibleItemsThreshold: 10,
  );

  void _initializePagingAdapter() {
    _pokemonPagingAdapter.pagingController = _pagingController;
    _pokemonPagingAdapter.addPageRequestListener();
  }

  void setSearch(String? search) {
    final _pokemonRequest = pokemonRequest?.rebuild(
          (b) => b..search = search,
        ) ??
        PokemonRequest(
          (b) => b..search = search,
        );
    pokemonRequest = _pokemonRequest;
    _updateQuery(_pokemonRequest);
  }

  void setSelectedTypes(List<FilterType> selectedTypes) {
    final pokemonTypes = selectedTypes.whereType<PokemonType>();
    final damageTypes = selectedTypes.whereType<DamageType>();
    final genTypes = selectedTypes.whereType<GenType>();
    final _pokemonRequest = pokemonRequest?.rebuild(
          (b) => b
            ..pokemonTypes.replace(
              pokemonTypes,
            )
            ..genTypes.replace(
              genTypes,
            )
            ..damageTypes.replace(
              damageTypes,
            ),
        ) ??
        PokemonRequest(
          (b) => b
            ..pokemonTypes.replace(
              pokemonTypes,
            )
            ..genTypes.replace(
              genTypes,
            )
            ..damageTypes.replace(
              damageTypes,
            ),
        );
    pokemonRequest = _pokemonRequest;
    _updateQuery(_pokemonRequest);
  }

  void refresh() {
    _pokemonPagingAdapter.refresh();
  }

  void _updateQuery(PokemonRequest pokemonRequest) {
    _pokemonPagingAdapter.setPokemonRequest(pokemonRequest);
    refresh();
  }

  void retryLastRequest() {
    _pokemonPagingAdapter.pagingController?.retryLastFailedRequest();
  }

  PagingController<int, Pokemon> getPagingController() {
    if (_isPagingAdapterInitialized == false) {
      _isPagingAdapterInitialized = true;
      _initializePagingAdapter();
    }
    return _pokemonPagingAdapter.pagingController ?? _pagingController;
  }

  void dispose() {
    searchText.close();
    _pokemonPagingAdapter.dispose();
  }
}
