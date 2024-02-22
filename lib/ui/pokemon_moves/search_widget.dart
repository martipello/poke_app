import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../api/models/filter_type.dart';
import '../../dependency_injection_container.dart';
import '../../extensions/build_context_extension.dart';
import '../../extensions/iterable_extension.dart';
import '../../theme/poke_app_text.dart';
import '../pokemon_filter/clear_filter.dart';
import '../pokemon_list/view_models/filter_view_model.dart';
import '../pokemon_list/view_models/search_view_model.dart';
import '../shared_widgets/chip_group.dart';
import '../shared_widgets/type_chip.dart';
import '../shared_widgets/view_constraint.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    Key? key,
    required this.searchTextController,
    required this.filterViewModel,
  }) : super(key: key);

  final TextEditingController searchTextController;
  final FilterViewModel filterViewModel;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> with TickerProviderStateMixin {
  final searchAppBarViewModel = getIt.get<SearchViewModel>();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return StreamBuilder<bool>(
          stream: searchAppBarViewModel.isSearching,
          builder: (context, isSearchingSnapshot) {
            final isSearching = isSearchingSnapshot.data == true;
            return _buildSearchAndFilterHolder(
              isSearching,
              isKeyboardVisible,
            );
          },
        );
      },
    );
  }

  Widget _buildSearchAndFilterHolder(
    bool isSearching,
    bool isKeyboardVisible,
  ) {
    return StreamBuilder<List<FilterType>>(
      initialData: [],
      stream: widget.filterViewModel.selectedFiltersStream,
      builder: (context, selectedFilterSnapshot) {
        final selectedFilters = selectedFilterSnapshot.data ?? [];
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            ViewConstraint(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _buildSearchView(),
                  ),
                ],
              ),
            ),
            ViewConstraint(
              child: _buildSelectedTypeFiltersHolder(
                selectedFilters,
              ),
            )
          ],
        );
      },
    );
  }

  Widget _buildSelectedTypeFiltersHolder(
    List<FilterType> selectedTypeFilters,
  ) {
    final filterTypes = selectedTypeFilters.groupBy((e) => e.runtimeType);

    if (selectedTypeFilters.isNotEmpty) {
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
            isOnDarkBackground: false,
          ),
          _buildSmallMargin,
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _buildSelectedTypeFilters(
    List<FilterType> selectedFilters,
  ) {
    return ChipGroup(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      scrollDirection: Axis.horizontal,
      scrollController: widget.filterViewModel.scrollController,
      chips: selectedFilters
          .map(
            (type) => TypeChip(
              chipType: ChipType.normal,
              filterType: type,
              isSelected: true,
              onDelete: () {
                widget.filterViewModel.selectTypeFilter(
                  type,
                );
              },
            ),
          )
          .toList(),
    );
  }

  Widget _buildSearchView() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 8,
      ),
      child: TextField(
        controller: widget.searchTextController,
        maxLines: 1,
        style: PokeAppText.body1Style.copyWith(
          color: context.colors.onSurface,
          height: 1.6,
        ),
        decoration: _buildSearchInputDecoration(),
      ),
    );
  }

  InputDecoration _buildSearchInputDecoration() {
    return InputDecoration(
      labelText: context.strings.searchByMoveName,
      labelStyle: PokeAppText.body2Style.copyWith(
        color: context.colors.onSurface,
        height: 1,
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
                color: context.colors.onSurface,
              ),
              onPressed: () {
                widget.searchTextController.clear();
              },
            )
          : null,
    );
  }

  SizedBox get _buildSmallMargin => const SizedBox(height: 8);
}
