import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rxdart/rxdart.dart';

import '../../../api/error_handler.dart';
import '../../../api/models/api_response.dart';
import '../../../api/models/news/article.dart';
import '../../../api/models/pokemon/pokemon_request.dart';
import '../../../api/models/pokemon/pokemon_type.dart';
import '../../../api/rest/news/news_repository.dart';
import '../../../extensions/iterable_extension.dart';
import '../adapter/pokemon_news_paging_adapter.dart';

class PokemonNewsListViewModel {
  PokemonNewsListViewModel(
    this._pokemonNewsPagingAdapter,
    this.newsRepository,
    this.errorHandler,
  );

  final PokemonNewsPagingAdapter _pokemonNewsPagingAdapter;
  final NewsRepository newsRepository;
  final ErrorHandler errorHandler;

  PokemonRequest? pokemonRequest;

  var _isPagingAdapterInitialized = false;

  final searchText = BehaviorSubject<String?>.seeded('');
  final highlightedArticle = BehaviorSubject<ApiResponse<Article?>>();

  final _pagingController = PagingController<int, Article>(
    firstPageKey: 0,
    invisibleItemsThreshold: 10,
  );

  void _initializePagingAdapter() {
    _pokemonNewsPagingAdapter.pagingController = _pagingController;
    _pokemonNewsPagingAdapter.addPageRequestListener();
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
    _updateQuery(_pokemonRequest);
  }

  Future<void> getHighlightedNews() async {
    try {
      final request = PokemonRequest(
        (b) => b
          ..skip = 0
          ..limit = 1,
      );
      final newsResponse = await newsRepository.getTopHeadlinePokemonNews(
        request,
      );
      final article = newsResponse.articles.firstOrNull();
      highlightedArticle.add(
        ApiResponse.completed(article),
      );
    } catch (e) {
      final errorResponse = errorHandler.handleError<Article?>(
        e,
      );
      highlightedArticle.add(errorResponse);
    }
  }

  void refresh() {
    _pokemonNewsPagingAdapter.refresh();
  }

  void _updateQuery(PokemonRequest pokemonRequest) {
    _pokemonNewsPagingAdapter.setPokemonRequest(pokemonRequest);
    refresh();
  }

  void retryLastRequest() {
    _pokemonNewsPagingAdapter.pagingController?.retryLastFailedRequest();
  }

  PagingController<int, Article> getPagingController() {
    if (_isPagingAdapterInitialized == false) {
      _isPagingAdapterInitialized = true;
      _initializePagingAdapter();
    }
    return _pokemonNewsPagingAdapter.pagingController ?? _pagingController;
  }

  void dispose() {
    searchText.close();
    _pokemonNewsPagingAdapter.dispose();
  }
}
