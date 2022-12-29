import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../api/models/pokemon/pokemon_move_holder.dart';
import '../../../../api/models/pokemon/pokemon_request.dart';
import '../../../api/models/pokemon/pokemon_type.dart';
import '../adapters/moves_paging_adapter.dart';

class PokemonMovesViewModel {
  PokemonMovesViewModel(this._movesPagingAdapter);

  final MovesPagingAdapter _movesPagingAdapter;
  PokemonRequest? pokemonRequest;
  final _pagingController = PagingController<int, PokemonMoveHolder>(firstPageKey: 0);
  var _isPagingAdapterInitialized = false;

  final searchText = BehaviorSubject<String?>.seeded('');

  void _initializePagingAdapter() {
    _movesPagingAdapter.pagingController = _pagingController;
    _movesPagingAdapter.addPageRequestListener();
  }

  void setSearch(String? search) {
    final _pokemonRequest = pokemonRequest?.rebuild(
          (b) => b..search = search,
        ) ??
        PokemonRequest(
          (b) => b..search = search,
        );
    pokemonRequest = _pokemonRequest;
    updateQuery(_pokemonRequest);
  }

  void setSelectedTypes(List<PokemonType> selectedTypes) {
    final _pokemonRequest = pokemonRequest?.rebuild(
          (b) => b
            ..pokemonTypes.replace(
              selectedTypes,
            ),
        ) ??
        PokemonRequest(
          (b) => b
            ..pokemonTypes.replace(
              selectedTypes,
            ),
        );
    pokemonRequest = _pokemonRequest;
    updateQuery(_pokemonRequest);
  }

  void refresh() {
    _movesPagingAdapter.refresh();
  }

  void updateQuery(PokemonRequest pokemonRequest) {
    _movesPagingAdapter.setPokemonRequest(pokemonRequest);
    refresh();
  }

  void retryLastRequest() {
    _movesPagingAdapter.pagingController?.retryLastFailedRequest();
  }

  PagingController<int, PokemonMoveHolder> getPagingController() {
    if (_isPagingAdapterInitialized == false) {
      _isPagingAdapterInitialized = true;
      _initializePagingAdapter();
    }
    return _movesPagingAdapter.pagingController ?? _pagingController;
  }

  void dispose() {
    searchText.close();
    _movesPagingAdapter.dispose();
  }
}
