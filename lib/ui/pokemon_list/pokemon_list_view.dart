import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../api/models/api_response.dart';
import '../../api/models/pokemon/pokemon.dart';
import '../../api/models/pokemon/pokemon_request.dart';
import '../../dependency_injection_container.dart';
import '../../theme/base_theme.dart';
import '../../theme/poke_app_text.dart';
import '../shared_widgets/error_widget.dart' as ew;
import '../shared_widgets/loading_widget.dart';
import '../shared_widgets/no_results.dart';
import '../shared_widgets/rounded_button.dart';
import '../shared_widgets/sliver_refresh_indicator.dart';
import 'pokemon_tile.dart';
import 'view_models/pokemon_list_view_model.dart';

class PokemonListView extends StatefulWidget {
  PokemonListView({Key? key}) : super(key: key);

  @override
  State<PokemonListView> createState() => _PokemonListViewState();
}

class _PokemonListViewState extends State<PokemonListView> {
  final _pokemonViewModel = getIt.get<PokemonListViewModel>();

  final _textController = TextEditingController();

  String previousSearch = '';

  @override
  void initState() {
    super.initState();
    _textController.addListener(
      () {
        if (_textController.text != previousSearch) {
          previousSearch = _textController.text;
          _pokemonViewModel.searchText.add(_textController.text);
        }
      },
    );
    _pokemonViewModel.searchText
        .debounce(
      (_) => TimerStream(
        true,
        const Duration(milliseconds: 700),
      ),
    )
        .listen(
      (search) {
        _pokemonViewModel.updateQuery(
          PokemonRequest(
            (b) => b..search = search,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _pokemonViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: false,
        headerSliverBuilder: (headerCtx, innerBoxScrolled) {
          return [
            StreamBuilder<String?>(
              stream: _pokemonViewModel.searchText,
              builder: (context, snapshot) {
                return _buildHeaderBar(headerCtx);
              },
            ),
          ];
        },
        body: SliverRefreshIndicator(
          onRefresh: _pokemonViewModel.refresh,
          padding: EdgeInsets.zero,
          sliver: MultiSliver(
            children: [
              SliverPadding(
                padding: const EdgeInsets.all(8),
                sliver: PagedSliverList.separated(
                  pagingController: _pokemonViewModel.getPagingController(),
                  builderDelegate: PagedChildBuilderDelegate<Pokemon>(
                    itemBuilder: (context, pokemon, index) => _buildPokemonTile(
                      pokemon: pokemon,
                    ),
                    firstPageErrorIndicatorBuilder: (context) => _buildErrorWidget(),
                    noItemsFoundIndicatorBuilder: (context) => _emptyListIndicator(),
                    newPageErrorIndicatorBuilder: (context) =>
                        _errorListItemWidget(onTryAgain: _pokemonViewModel.retryLastRequest),
                    firstPageProgressIndicatorBuilder: (context) => const Center(
                      child: LoadingWidget(),
                    ),
                    newPageProgressIndicatorBuilder: (context) => _loadingListItemWidget(),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //TODO make this disappear when scrolling
      //TODO animate into bottom sheet
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.sort,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _buildHeaderBar(BuildContext context) {
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverAppBar(
        pinned: true,
        floating: true,
        snap: true,
        leading: const SizedBox(),
        expandedHeight: kToolbarHeight,
        flexibleSpace: _buildFlexibleSpace(context),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: SizedBox(),
        ),
      ),
    );
  }

  Widget _buildFlexibleSpace(BuildContext context) {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      background: _buildSearchView(context),
    );
  }

  Widget _buildSearchView(BuildContext context) {
    return SafeArea(
      left: true,
      right: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: _textController,
          maxLines: 1,
          style: PokeAppText.body4Style.copyWith(
            color: colors(context).textOnPrimary,
          ),
          decoration: _buildSearchInputDecoration(context),
        ),
      ),
    );
  }

  InputDecoration _buildSearchInputDecoration(BuildContext context) {
    return InputDecoration(
      contentPadding: EdgeInsets.zero,
      labelText: 'Search by ID',
      labelStyle: PokeAppText.body4Style.copyWith(
        color: colors(context).textOnPrimary,
      ),
      prefixIcon: Icon(
        Icons.search,
        size: 18,
        color: colors(context).textOnPrimary,
      ),
      suffixIcon: _textController.text.isNotEmpty
          ? IconButton(
              icon: Icon(
                Icons.close,
                size: 20,
                color: colors(context).textOnPrimary,
              ),
              onPressed: () {
                FocusScope.of(context).unfocus();
                _textController.clear();
              },
            )
          : null,
    );
  }

  Widget _buildErrorWidget() {
    final error = _pokemonViewModel.getPagingController().error as ApiResponse;
    return ew.ErrorWidget(
      showImage: true,
      error: error,
      onTryAgain: () => _pokemonViewModel.getPagingController().refresh(),
    );
  }

  Widget _errorListItemWidget({
    required VoidCallback onTryAgain,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Error getting new page...'),
        RoundedButton(
          label: 'Retry',
          onPressed: onTryAgain,
        ),
      ],
    );
  }

  Widget _loadingListItemWidget() {
    return const SizedBox(
      height: 36,
      child: Center(
        child: LoadingWidget(),
      ),
    );
  }

  Widget _emptyListIndicator() {
    return const NoResults();
  }

  Widget _buildPokemonTile({required Pokemon pokemon}) {
    return PokemonTile(
      pokemon: pokemon,
    );
  }
}
