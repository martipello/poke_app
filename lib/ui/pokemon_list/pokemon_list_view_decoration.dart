import 'package:flutter/material.dart';

import '../../ads/view_models/google_ads_view_model.dart';
import '../../api/models/pokemon/gen_type.dart';
import '../../api/models/pokemon/pokemon_type.dart';
import '../../dependency_injection_container.dart';
import '../pokemon_filter/filter_view_holder.dart';
import '../shared_widgets/sliver_refresh_indicator.dart';
import 'pokemon_list_view.dart';
import 'search_app_bar.dart';
import 'view_models/filter_view_model.dart';
import 'view_models/pokemon_list_view_model.dart';


class PokemonListViewDecoration extends StatefulWidget {
  const PokemonListViewDecoration({Key? key}) : super(key: key);

  @override
  State<PokemonListViewDecoration> createState() => _PokemonListViewDecorationState();

  static const routeName = '/pokemon_list';
}

class _PokemonListViewDecorationState extends State<PokemonListViewDecoration> with AutomaticKeepAliveClientMixin {
  final _pokemonViewModel = getIt.get<PokemonListViewModel>();
  final _googleAdsViewModel = getIt.get<GoogleAdsViewModel>();
  final _filterViewModel = getIt.get<FilterViewModel>();
  final _textController = TextEditingController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _addSearchTextListener();
    _addSelectedFilterListener();
  }

  void _addSelectedFilterListener() {
    const duration = Duration(milliseconds: 200);
    _filterViewModel.filters.add([...PokemonType.filters, ...GenType.filters]);
    _filterViewModel.selectedFiltersStream.listen(
      (selectedTypes) {
        _pokemonViewModel.setFilters(selectedTypes);
        Future.delayed(duration).then(
          (value) {
            if (_filterViewModel.scrollController.hasClients) {
              _filterViewModel.scrollController.animateTo(
                _filterViewModel.scrollController.position.maxScrollExtent,
                duration: duration,
                curve: Curves.fastOutSlowIn,
              );
            }
          },
        );
      },
    );
  }

  void _addSearchTextListener() {
    _textController.addListener(
      () {
        _pokemonViewModel.setSearch(_textController.text);
      },
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _filterViewModel.dispose();
    _googleAdsViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BackButtonListener(
      onBackButtonPressed: () async {
        //TODO if filters open close filters.
        return true;
      },
      child: Scaffold(
        body: Stack(
          children: [
            NestedScrollView(
              headerSliverBuilder: (nestedScrollViewContext, innerBoxScrolled) {
                return [
                  _buildHeaderBar(),
                ];
              },
              body: _buildPokemonList(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: _buildFilter(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPokemonList() {
    return SliverRefreshIndicator(
      onRefresh: _pokemonViewModel.retryLastRequest,
      padding: EdgeInsets.zero,
      sliver: PokemonListView(
        pagingController: _pokemonViewModel.pokemonPagingAdapter.pagingController,
        showAdAtIndex: _googleAdsViewModel.showAdAtIndex,
        onTryAgain: _pokemonViewModel.retryLastRequest,
      ),
    );
  }

  Widget _buildFilter() {
    return FilterViewHolder(
      filterViewModel: _filterViewModel,
    );
  }

  Widget _buildHeaderBar() {
    return SearchAppBar(
      searchTextController: _textController,
      filterViewModel: _filterViewModel,
    );
  }
}
