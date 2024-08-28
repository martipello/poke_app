import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../ads/native_ad.dart';
import '../../api/models/api_response.dart';
import '../../api/models/pokemon/pokemon.dart';
import '../../extensions/build_context_extension.dart';
import '../../theme/poke_app_text.dart';
import '../shared_widgets/error_widget.dart' as ew;
import '../shared_widgets/no_results.dart';
import '../shared_widgets/pokeball_loading_widget.dart';
import '../shared_widgets/rounded_button.dart';
import '../shared_widgets/view_constraint.dart';
import 'pokemon_tile.dart';

typedef ShowAdAtIndex = bool Function(int index);

class PokemonListView extends StatelessWidget {
  const PokemonListView({
    super.key,
    required this.pagingController,
    required this.showAdAtIndex,
    required this.onTryAgain,
  });

  final PagingController<int, Pokemon> pagingController;
  final ShowAdAtIndex showAdAtIndex;
  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8),
      sliver: PagedSliverList(
        pagingController: pagingController,
        builderDelegate: PagedChildBuilderDelegate<Pokemon>(
          animateTransitions: false,
          itemBuilder: (context, pokemon, index) => _buildPokemonTile(
            pokemon: pokemon,
            showAd: showAdAtIndex(index) && index != 0,
          ),
          firstPageErrorIndicatorBuilder: (context) => _buildErrorWidget(),
          noItemsFoundIndicatorBuilder: (context) => _emptyListIndicator(),
          newPageErrorIndicatorBuilder: _errorListItemWidget,
          firstPageProgressIndicatorBuilder: (context) => _buildFirstPageLoading(),
          newPageProgressIndicatorBuilder: (context) => _loadingListItemWidget(),
        ),
      ),
    );
  }

  Widget _buildFirstPageLoading() {
    return const Center(
      child: PokeballLoadingWidget(
        size: Size(
          kPokemonTileImageHeight,
          kPokemonTileImageHeight,
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    final error = pagingController.error as ApiResponse;
    return ViewConstraint(
      constraints: const BoxConstraints(
        maxWidth: 280,
      ),
      child: ew.ErrorWidget(
        showImage: true,
        error: error,
        onTryAgain: onTryAgain,
      ),
    );
  }

  Widget _errorListItemWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.strings.error_getting_page,
            style: PokeAppText.body4Style,
          ),
          const SizedBox(
            height: 4,
          ),
          RoundedButton(
            label: context.strings.retry,
            textStyle: PokeAppText.body4Style,
            outlineColor: context.colors.error,
            isFilled: true,
            fillColor: context.colors.onPrimary,
            onPressed: onTryAgain,
          ),
        ],
      ),
    );
  }

  Widget _loadingListItemWidget() {
    return const PokeballLoadingWidget(
      size: Size(
        42,
        42,
      ),
    );
  }

  Widget _emptyListIndicator() {
    return const NoResults();
  }

  Widget _buildPokemonTile({
    required Pokemon pokemon,
    bool showAd = false,
  }) {
    if (showAd && !kIsWeb) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showAd && !kIsWeb) NativeAd(),
          PokemonTile(
            pokemon: pokemon,
          ),
        ],
      );
    } else {
      return PokemonTile(
        pokemon: pokemon,
      );
    }
  }
}
