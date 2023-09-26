import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../api/models/filter_type.dart';
import '../../dependency_injection_container.dart';
import '../../extensions/build_context_extension.dart';
import '../../extensions/iterable_extension.dart';
import '../../extensions/media_query_context_extension.dart';
import '../../theme/base_theme.dart';
import '../../theme/poke_app_text.dart';
import '../pokemon_filter/clear_filter.dart';
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
    return StreamBuilder<List<FilterType>>(
      initialData: [],
      stream: widget.filterViewModel.selectedFiltersStream,
      builder: (context, snapshot) {
        final selectedFilters = snapshot.data ?? [];
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
          title: isSearching ? _buildSearchView() : _buildAppName(context),
          bottom: _buildSelectedFiltersHolder(
            selectedFilters,
          ),
        );
      },
    );
  }

  Widget _buildAppName(BuildContext context) {
    return Padding(
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
    );
  }

  PreferredSize? _buildSelectedFiltersHolder(
    List<FilterType> selectedFilters,
  ) {
    final totalHeight = _calculateHeight(
      selectedFilters,
    );
    return PreferredSize(
      preferredSize: Size(
        double.infinity,
        totalHeight,
      ),
      child: selectedFilters.isNotEmpty
          ? _buildSelectedFilters(
              selectedFilters,
            )
          : const SizedBox(),
    );
  }

  Widget _buildSelectedFilters(
    List<FilterType> selectedFilters,
  ) {
    final filterTypes = selectedFilters.groupBy((e) => e.runtimeType);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ...filterTypes.values.map((typeFilters) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _buildSelectedTypeFilters(
                      typeFilters,
                    ),
                  ),
                ],
              ),
              _buildSmallMargin,
            ],
          );
        }).toList(),
        ClearFilter(
          clearFilterCallback: widget.filterViewModel.clearFilters,
          isOnDarkBackground: true,
        ),
        _buildSmallMargin,
      ],
    );
  }

  Widget _buildSelectedTypeFilters(
    List<FilterType> selectedFilters,
  ) {
    return ChipGroup(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      scrollDirection: Axis.horizontal,
      scrollController: widget.filterViewModel.scrollController,
      chips: selectedFilters
          .map(
            (type) => TypeChip(
              chipType: ChipType.normal,
              filterType: type,
              isSelected: true,
              onDelete: () {
                widget.filterViewModel.selectTypeFilter(type);
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
    List<FilterType> selectedTypeFilters,
  ) {
    const kChipMargin = 16.0;
    const kClearFilterPadding = 8.0;
    const kFilterLayoutTotalHeight = kChipHeight + kChipMargin;
    const kClearFilterTotalHeight = kClearFilterHeight + kClearFilterPadding;

    final types = selectedTypeFilters.groupBy((e) => e.runtimeType);

    if (types.isNotEmpty) {
      return (kFilterLayoutTotalHeight * types.length) + kClearFilterTotalHeight;
    }
    return 8.0;
  }
}
