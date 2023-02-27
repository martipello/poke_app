import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../api/models/pokemon/pokemon_type.dart';
import '../../api/models/pokemon/version.dart';
import '../../dependency_injection_container.dart';
import '../../extensions/build_context_extension.dart';
import '../../extensions/media_query_context_extension.dart';
import '../../theme/base_theme.dart';
import '../../theme/poke_app_text.dart';
import '../settings/settings.dart';
import '../shared_widgets/chip_group.dart';
import '../shared_widgets/type_chip.dart';
import '../shared_widgets/view_constraint.dart';
import 'view_models/filter_view_model.dart';
import 'view_models/search_view_model.dart';

class SearchAppBar extends StatefulWidget {
  const SearchAppBar({
    Key? key,
    required this.searchTextController,
    required this.filterViewModel,
  }) : super(key: key);

  final TextEditingController searchTextController;
  final FilterViewModel filterViewModel;

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> with TickerProviderStateMixin {
  final searchAppBarViewModel = getIt.get<SearchViewModel>();
  final focusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return StreamBuilder<bool>(
          stream: searchAppBarViewModel.isSearching,
          builder: (context, isSearchingSnapshot) {
            final isSearching = isSearchingSnapshot.data == true;
            return MultiSliver(
              children: [
                _buildHeroImageAppBar(),
                _buildSearchAppBar(
                  isSearching,
                  isKeyboardVisible,
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildSearchAppBar(
    bool isSearching,
    bool isKeyboardVisible,
  ) {
    return StreamBuilder<List<PokemonType>>(
      initialData: [],
      stream: widget.filterViewModel.selectedTypeFiltersStream,
      builder: (context, selectedFiltersSnapshot) {
        return StreamBuilder<List<Version>>(
            initialData: [],
            stream: widget.filterViewModel.selectedVersionFiltersStream,
          builder: (context, selectedVersionsSnapshot) {
            final selectedFilters = selectedFiltersSnapshot.data ?? [];
            final selectedVersions = selectedVersionsSnapshot.data ?? [];
            return SliverAppBar(
              pinned: false,
              snap: true,
              floating: true,
              backgroundColor: Colors.black,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.black,
              ),
              leading: isSearching
                  ? _buildBackButton(
                      isKeyboardVisible,
                    )
                  : null,
              actions: [
                if (!isSearching) _buildSearchAction(),
                _buildMenuAction(),
                const SizedBox(
                  width: 16,
                )
              ],
              title: isSearching
                  ? _buildSearchView()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      child: Text(
                        context.strings.app_name,
                        style: PokeAppText.subtitle2Style.copyWith(
                          height: 1,
                        ),
                      ),
                    ),
              bottom: _buildSelectedFiltersHolder(
                selectedFilters,
                selectedVersions,
              ),
            );
          }
        );
      },
    );
  }

  PreferredSize? _buildSelectedFiltersHolder(
    List<PokemonType> selectedFilters,
    List<Version> selectedVersions,
  ) {
    const clearFilterHeight = 48.0;

    final totalHeight = _calculateHeight(
      selectedFilters,
      selectedVersions,
      clearFilterHeight,
    );

    return selectedFilters.isNotEmpty || selectedVersions.isNotEmpty
        ? PreferredSize(
            preferredSize: Size(
              double.infinity,
              totalHeight,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (selectedFilters.isNotEmpty)
                Row(
                  children: [
                    Expanded(
                      child: _buildSelectedFilters(
                        selectedFilters,
                      ),
                    ),
                  ],
                ),
                if (selectedFilters.isNotEmpty && selectedVersions.isNotEmpty)
                  const SizedBox(
                    height: 8,
                  ),
                if (selectedVersions.isNotEmpty)
                Row(
                  children: [
                    Expanded(
                      child: _buildSelectedVersions(
                        selectedVersions,
                      ),
                    ),
                  ],
                ),
                if ((selectedFilters.length + selectedVersions.length) > 1)
                  _buildClearAllFiltersButton(
                    clearFilterHeight,
                  ),
                _buildSmallMargin,
              ],
            ),
          )
        : null;
  }

  Widget _buildClearAllFiltersButton(
    double clearFilterHeight,
  ) {
    return Container(
      height: clearFilterHeight,
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: widget.filterViewModel.clearFilters,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: Text(
              context.strings.clearFilters,
              style: PokeAppText.body3Style.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedFilters(
    List<PokemonType> selectedFilters,
  ) {
    return ChipGroup(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      scrollDirection: Axis.horizontal,
      scrollController: widget.filterViewModel.scrollController,
      chips: selectedFilters
          .map(
            (type) => TypeChip(
              chipType: ChipType.normal,
              pokemonType: type,
              isSelected: true,
              onDelete: () {
                widget.filterViewModel.selectTypeFilter(type);
              },
            ),
          )
          .toList(),
    );
  }

  Widget _buildSelectedVersions(
    List<Version> selectedVersions,
  ) {
    return ChipGroup(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      scrollDirection: Axis.horizontal,
      scrollController: widget.filterViewModel.scrollController,
      chips: selectedVersions
          .map(
            (type) => TypeChip(
              chipType: ChipType.normal,
              version: type,
              isSelected: true,
              onDelete: () {
                widget.filterViewModel.selectVersionFilter(type);
              },
            ),
          )
          .toList(),
    );
  }

  Widget _buildBackButton(bool isKeyboardVisible) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: IconButton(
        onPressed: () {
          if (isKeyboardVisible && widget.searchTextController.text.isNotEmpty) {
            context.closeKeyBoard();
          } else {
            widget.searchTextController.clear();
            searchAppBarViewModel.isSearching.add(
              false,
            );
          }
        },
        icon: Icon(
          Icons.arrow_back,
          size: 24,
          color: colors(context).textOnPrimary,
        ),
      ),
    );
  }

  Widget _buildMenuAction() {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushNamed(Settings.routeName);
      },
      icon: Icon(
        Icons.more_vert_rounded,
        color: colors(context).textOnPrimary,
      ),
    );
  }

  Widget _buildSearchAction() {
    return IconButton(
      onPressed: () {
        searchAppBarViewModel.isSearching.add(
          true,
        );
      },
      icon: Icon(
        Icons.search,
        color: colors(context).textOnPrimary,
      ),
    );
  }

  Widget _buildHeroImageAppBar() {
    return SliverAppBar(
      pinned: false,
      floating: false,
      expandedHeight: 150,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Padding(
          padding: const EdgeInsets.only(top: 32),
          child: ViewConstraint(
            child: Image.asset(
              'assets/images/pokemon_hero.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).fullSizeImageScreenWidth,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchView() {
    return TextField(
      autofocus: true,
      focusNode: focusNode,
      controller: widget.searchTextController,
      maxLines: 1,
      style: PokeAppText.body4Style.copyWith(
        color: colors(context).textOnPrimary,
      ),
      decoration: _buildSearchInputDecoration(),
    );
  }

  InputDecoration _buildSearchInputDecoration() {
    return InputDecoration(
      contentPadding: EdgeInsets.zero,
      labelText: context.strings.searchByName,
      labelStyle: PokeAppText.subtitle2Style.copyWith(
        color: colors(context).textOnPrimary,
      ),
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      suffixIcon: widget.searchTextController.text.isNotEmpty
          ? IconButton(
              icon: Icon(
                Icons.close,
                size: 20,
                color: colors(context).textOnPrimary,
              ),
              onPressed: () {
                widget.searchTextController.clear();
              },
            )
          : null,
    );
  }

  SizedBox get _buildSmallMargin => const SizedBox(height: 8);

  double _calculateHeight(
      List<PokemonType> selectedTypeFilters,
      List<Version> selectedVersionFilters,
      double clearFilterHeight,
      ) {
    const chipPadding = 12.0;
    if(selectedTypeFilters.isNotEmpty && selectedVersionFilters.isNotEmpty) {
      if (selectedTypeFilters.length + selectedVersionFilters.length > 1) {
        return ((kChipHeight + chipPadding) * 2) + clearFilterHeight;
      } else {
        return ((kChipHeight + chipPadding) * 2);
      }
    }
    if(selectedTypeFilters.isNotEmpty || selectedVersionFilters.isNotEmpty) {
      if (selectedTypeFilters.length + selectedVersionFilters.length > 1) {
        return (kChipHeight + chipPadding) + clearFilterHeight;
      }
    }
    return kChipHeight + chipPadding;
  }
}
