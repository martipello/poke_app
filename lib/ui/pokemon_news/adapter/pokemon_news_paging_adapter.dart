import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../api/error_handler.dart';
import '../../../api/models/error_response.dart';
import '../../../api/models/news/article.dart';
import '../../../api/models/pokemon/pokemon_request.dart';
import '../../../api/rest/news/news_repository.dart';
import '../../../services/language_service.dart';

class PokemonNewsPagingAdapter {
  PokemonNewsPagingAdapter(
    this.pokemonNewsRepository,
    this.errorHandler,
    this.languageService,
  );

  PagingController<int, Article>? pagingController;

  final NewsRepository pokemonNewsRepository;
  final LanguageService languageService;
  final ErrorHandler errorHandler;

  bool _hasFetchedOnce = false;
  bool _hasBeenDisposed = false;

  PokemonRequest? _pokemonRequest;

  PokemonRequest? get pokemonRequest => _pokemonRequest;

  int get limit => 40;

  void setPokemonRequest(PokemonRequest pokemonRequest) {
    if (_pokemonRequest == null) {
      _pokemonRequest = pokemonRequest;
    } else {
      _pokemonRequest = _pokemonRequest?.rebuild(
        (b) => b
          ..search = pokemonRequest.search
          ..pokemonTypes.replace(pokemonRequest.pokemonTypes)
          ..sort = pokemonRequest.sort,
      );
    }
  }

  void addPageRequestListener() {
    pagingController?.addPageRequestListener(_fetchPage);
  }

  Future<void> _fetchPage(int pageKey) async {
    if (_pokemonRequest != null) {
      try {
        final language = await languageService.getLanguage();
        final newPage = await pokemonNewsRepository.getEverythingPokemonNews(
          _pokemonRequest!.rebuild(
            (b) => b
              ..languageId = language.id
              ..limit = limit
              ..skip = pageKey
              ..pagination = true,
          ),
        );
        if (newPage.status == 'ok') {
          var isLastPage = _getIsLastPage(newPage.articles.length);

          if (!_hasBeenDisposed) {
            if (isLastPage) {
              pagingController?.appendLastPage(newPage.articles.toList());
            } else {
              final nextPageKey = pageKey + limit;
              pagingController?.appendPage(newPage.articles.toList(), nextPageKey);
            }
          }
        } else {
          if (!_hasBeenDisposed) {
            _handleError(
              ErrorResponse(
                (b) => b
                  ..error = newPage.message
                  ..statusCode = int.tryParse(newPage.code ?? ''),
              ),
            );
          }
        }
      } catch (error) {
        if (!_hasBeenDisposed) {
          _handleError(error);
        }
      }
    }
  }

  void firstFetch() {
    _fetchPage(0);
  }

  void refresh() {
    if (!_hasFetchedOnce) {
      _hasFetchedOnce = true;
      firstFetch();
    } else {
      pagingController?.refresh();
    }
  }

  void retryLastRequest() {
    pagingController?.retryLastFailedRequest();
  }

  bool _getIsLastPage(int count) {
    return count < limit;
  }

  void _handleError(Object? error) {
    final handledError = errorHandler.handleError(
      error,
    );
    pagingController?.error = handledError;
  }

  void dispose() {
    _hasBeenDisposed = true;
    pagingController?.dispose();
  }
}
