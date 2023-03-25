import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../api/error_handler.dart';
import '../../../../api/graph_ql/pokemon_repository_graph_ql.dart';
import '../../../../api/models/pokemon/pokemon_move_holder.dart';
import '../../../../api/models/pokemon/pokemon_request.dart';
import '../../../../api/models/pokemon/pokemon_response.dart';
import '../../../../extensions/iterable_extension.dart';
import '../../../../services/language_service.dart';
import '../../../api/models/error_response.dart';

class MovesPagingAdapter {
  MovesPagingAdapter(
    this.pokemonRepository,
    this.errorHandler,
    this.languageService,
  );

  PagingController<int, PokemonMoveHolder>? pagingController;

  final PokemonRepositoryGraphQl pokemonRepository;
  final LanguageService languageService;
  final ErrorHandler errorHandler;

  bool _hasFetchedOnce = false;
  bool _hasBeenDisposed = false;

  PokemonRequest? _pokemonRequest;

  PokemonRequest? get pokemonRequest => _pokemonRequest;

  int get offset => 40;

  void setPokemonRequest(PokemonRequest pokemonRequest) {
    if (_pokemonRequest == null) {
      _pokemonRequest = pokemonRequest;
    } else {
      _pokemonRequest = _pokemonRequest?.rebuild(
        (b) => b
          ..search = pokemonRequest.search
          ..damageTypes.replace(pokemonRequest.damageTypes)
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
        final newPage = await pokemonRepository.getPokemonMoves(
          _pokemonRequest!.rebuild(
            (b) => b
              ..languageId = language.id
              ..limit = pageKey + offset
              ..skip = pageKey
              ..pagination = true,
          ),
        );
        if (!newPage.hasException && newPage.data != null) {
          final pokemon = PokemonResponse.fromJson(newPage.data!);
          final moves = pokemon.pokemon_v2_pokemon.firstOrNull()?.pokemon_v2_pokemonmoves.toList() ?? [];

          var isLastPage = _getIsLastPage(moves.length);

          if (!_hasBeenDisposed) {
            if (isLastPage) {
              pagingController?.appendLastPage(moves);
            } else {
              final nextPageKey = pageKey + offset;
              pagingController?.appendPage(moves, nextPageKey);
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

  bool _getIsLastPage(int count) {
    return count < offset;
  }

  void _handleError(Object error) {
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
