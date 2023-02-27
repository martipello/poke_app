import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../api/error_handler.dart';
import '../../../api/graph_ql/pokemon_repository_graph_ql.dart';
import '../../../api/models/error_response.dart';
import '../../../api/models/pokemon/pokemon.dart';
import '../../../api/models/pokemon/pokemon_request.dart';
import '../../../api/models/pokemon/pokemon_response.dart';
import '../../../extensions/iterable_extension.dart';
import '../../../services/language_service.dart';

class PokemonPagingAdapter {
  PokemonPagingAdapter(
    this.pokemonRepository,
    this.errorHandler,
    this.languageService,
  );

  PagingController<int, Pokemon>? pagingController;

  final PokemonRepositoryGraphQl pokemonRepository;
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
          ..versions.replace(pokemonRequest.versions)
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
        final newPage = await pokemonRepository.getPokemon(
          _pokemonRequest!.rebuild(
            (b) => b
              ..languageId = language.id
              ..limit = limit
              ..skip = pageKey
              ..pagination = true,
          ),
        );
        if (!newPage.hasException && newPage.data != null) {
          final pokemon = PokemonResponse.fromJson(newPage.data!);

          var isLastPage = _getIsLastPage(pokemon);

          if (!_hasBeenDisposed) {
            if (isLastPage) {
              pagingController?.appendLastPage(pokemon.pokemon_v2_pokemon.toList());
            } else {
              final nextPageKey = pageKey + limit;
              pagingController?.appendPage(pokemon.pokemon_v2_pokemon.toList(), nextPageKey);
            }
          }
        } else {
          if (!_hasBeenDisposed) {
            _handleError(
              ErrorResponse(
                    (b) => b
                  ..error = newPage.exception?.graphqlErrors.firstOrNull()?.message
                  ..statusCode = 503,
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

  bool _getIsLastPage(PokemonResponse newPage) {
    final count = newPage.pokemon_v2_pokemon.length;
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
