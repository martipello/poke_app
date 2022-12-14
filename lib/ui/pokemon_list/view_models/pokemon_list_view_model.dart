import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rxdart/rxdart.dart';

import '../../../api/models/pokemon/pokemon.dart';
import '../../../api/models/pokemon/pokemon_request.dart';
import '../adapters/pokemon_paging_adapter.dart';

class PokemonListViewModel {
  PokemonListViewModel(this._pokemonPagingAdapter);

  final PokemonPagingAdapter _pokemonPagingAdapter;
  final _pagingController = PagingController<int, Pokemon>(
    firstPageKey: 0,
    invisibleItemsThreshold: 10,
  );
  var _isPagingAdapterInitialized = false;

  final searchText = BehaviorSubject<String?>.seeded('');

  void _initializePagingAdapter() {
    _pokemonPagingAdapter.pagingController = _pagingController;
    _pokemonPagingAdapter.addPageRequestListener();
  }

  void refresh() {
    _pokemonPagingAdapter.refresh();
  }

  void updateQuery(PokemonRequest pokemonRequest) {
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
