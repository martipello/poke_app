import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../api/models/pokemon/damage_type.dart';
import '../../api/models/pokemon/pokemon_type.dart';
import '../../dependency_injection_container.dart';
import '../../extensions/build_context_extension.dart';
import '../../theme/base_theme.dart';
import '../../theme/poke_app_text.dart';
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
    return StreamBuilder<List<PokemonType>>(
      initialData: [],
      stream: widget.filterViewModel.selectedTypeFiltersStream,
      builder: (context, selectedTypeFilterSnapshot) {
        return StreamBuilder<List<DamageType>>(
          initialData: [],
          stream: widget.filterViewModel.selectedDamageTypeFiltersStream,
          builder: (context, selectedDamageTypeFilterSnapshot) {
            final selectedTypeFilters = selectedTypeFilterSnapshot.data ?? [];
            final selectedDamageTypeFilters = selectedDamageTypeFilterSnapshot.data ?? [];
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                    selectedTypeFilters,
                    selectedDamageTypeFilters,
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildSelectedTypeFiltersHolder(
    List<PokemonType> selectedTypeFilters,
    List<DamageType> selectedDamageTypeFilters,
  ) {
    const clearFilterHeight = 48.0;

    final totalHeight = _calculateHeight(
      selectedTypeFilters,
      selectedDamageTypeFilters,
      clearFilterHeight,
    );

    if (selectedTypeFilters.isNotEmpty || selectedDamageTypeFilters.isNotEmpty) {
      return SizedBox(
        height: totalHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (selectedTypeFilters.isNotEmpty)
              Row(
                children: [
                  Expanded(
                    child: _buildSelectedTypeFilters(
                      selectedTypeFilters,
                    ),
                  ),
                ],
              ),
            if (selectedTypeFilters.isNotEmpty && selectedDamageTypeFilters.isNotEmpty)
              const SizedBox(
                height: 8,
              ),
            if (selectedDamageTypeFilters.isNotEmpty)
              Row(
                children: [
                  Expanded(
                    child: _buildSelectedDamageTypeFilters(
                      selectedDamageTypeFilters,
                    ),
                  ),
                ],
              ),
            if ((selectedTypeFilters.length + selectedDamageTypeFilters.length) > 1)
              _buildClearAllFiltersButton(
                clearFilterHeight,
              ),
            _buildSmallMargin,
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _buildClearAllFiltersButton(
    double clearFilterHeight,
  ) {
    return Container(
      height: clearFilterHeight,
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
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
                color: colors(context).textOnForeground,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedTypeFilters(
    List<PokemonType> selectedFilters,
  ) {
    return ChipGroup(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      scrollDirection: Axis.horizontal,
      scrollController: widget.filterViewModel.scrollController,
      chips: selectedFilters
          .map(
            (type) => TypeChip(
              chipType: ChipType.normal,
              pokemonType: type,
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

  Widget _buildSelectedDamageTypeFilters(
    List<DamageType> selectedFilters,
  ) {
    return ChipGroup(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      scrollDirection: Axis.horizontal,
      scrollController: widget.filterViewModel.scrollController,
      chips: selectedFilters
          .map(
            (type) => TypeChip(
              chipType: ChipType.normal,
              damageType: type,
              isSelected: true,
              onDelete: () {
                widget.filterViewModel.selectDamageTypeFilter(
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
        style: PokeAppText.body1Style.copyWith(color: colors(context).textOnForeground, height: 1.6),
        decoration: _buildSearchInputDecoration(),
      ),
    );
  }

  InputDecoration _buildSearchInputDecoration() {
    return InputDecoration(
      labelText: context.strings.searchByMoveName,
      labelStyle: PokeAppText.body2Style.copyWith(color: colors(context).textOnForeground, height: 1),
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
                color: colors(context).textOnForeground,
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
    List<DamageType> selectedDamageTypeFilters,
    double clearFilterHeight,
  ) {
    const chipPadding = 12.0;
    if (selectedTypeFilters.isNotEmpty && selectedDamageTypeFilters.isNotEmpty) {
      if (selectedTypeFilters.length + selectedDamageTypeFilters.length > 1) {
        return ((kChipHeight + chipPadding) * 2) + clearFilterHeight;
      } else {
        return ((kChipHeight + chipPadding) * 2);
      }
    }
    if (selectedTypeFilters.isNotEmpty || selectedDamageTypeFilters.isNotEmpty) {
      if (selectedTypeFilters.length + selectedDamageTypeFilters.length > 1) {
        return (kChipHeight + chipPadding) + clearFilterHeight;
      }
    }
    return kChipHeight + chipPadding;
  }
}
