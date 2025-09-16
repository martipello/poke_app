import 'package:flutter/material.dart';

import '../../api/models/filter_type.dart';
import '../../api/models/pokemon/damage_type.dart';
import '../../api/models/pokemon/gen_type.dart';
import '../../api/models/pokemon/pokemon_type.dart';
import '../../extensions/build_context_extension.dart';
import '../../extensions/media_query_context_extension.dart';
import '../../theme/poke_app_text.dart';
import '../pokemon_list/view_models/filter_view_model.dart';
import '../shared_widgets/chip_group.dart';
import '../shared_widgets/type_chip.dart';

class FilterView extends StatefulWidget {
  const FilterView({
    Key? key,
    required this.filterViewModel,
    required this.onClose,
  }) : super(key: key);

  final FilterViewModel filterViewModel;
  final VoidCallback onClose;

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: context.colors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).filterBottomSheetHeight,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
              ),
              child: _buildFilterHeader(),
            ),
            _buildFilters(),
          ],
        ),
      ),
    );
  }

  Widget _buildFilters() {
    return StreamBuilder<List<FilterType>>(
      initialData: [],
      stream: widget.filterViewModel.selectedFiltersStream,
      builder: (context, snapshot) {
        final selectedFiltersStream = snapshot.data ?? [];
        return Expanded(
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: _buildFilterTypeSections(selectedFiltersStream),
          ),
        );
      },
    );
  }

  Widget _buildFilterTypeSections(
    List<FilterType> selectedFilterTypes,
  ) {
    return StreamBuilder(
      stream: widget.filterViewModel.filters,
      builder: (context, snapshot) {
        final filters = snapshot.data ?? [];
        final pokemonFilterTypes = filters.whereType<PokemonType>().toList();
        final damageFilterTypes = filters.whereType<DamageType>().toList();
        final genFilterTypes = filters.whereType<GenType>().toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildPokemonTypeFiltersSection(
              pokemonFilterTypes,
              selectedFilterTypes,
            ),
            _buildDamageTypeFiltersSection(
              damageFilterTypes,
              selectedFilterTypes,
            ),
            _buildGenTypeFiltersSection(
              genFilterTypes,
              selectedFilterTypes,
            ),
          ],
        );
      },
    );
  }

  Widget _buildPokemonTypeFiltersSection(
    List<PokemonType> filters,
    List<FilterType> selectedFilters,
  ) {
    if (filters.isEmpty) {
      return const SizedBox();
    }
    return _buildFilterTypeSection(
      filters,
      selectedFilters,
      context.strings.types,
    );
  }

  Widget _buildDamageTypeFiltersSection(
    List<DamageType> filters,
    List<FilterType> selectedFilters,
  ) {
    if (filters.isEmpty) {
      return const SizedBox();
    }
    return _buildFilterTypeSection(
      filters,
      selectedFilters,
      context.strings.damageTypes,
    );
  }

  Widget _buildGenTypeFiltersSection(
    List<GenType> filters,
    List<FilterType> selectedFilters,
  ) {
    if (filters.isEmpty) {
      return const SizedBox();
    }
    return _buildFilterTypeSection(
      filters,
      selectedFilters,
      context.strings.generation,
    );
  }

  Widget _buildFilterTypeSection(
    List<FilterType> filters,
    List<FilterType> selectedFilters,
    String sectionName,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildSubtitle(
          sectionName, // context.strings.generation,
        ),
        _buildChipGroup(filters, selectedFilters),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildChipGroup(
    List<FilterType> types,
    List<FilterType> selectedPokemonTypes,
  ) {
    return ChipGroup(
      scrollPhysics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      chips: types
          .map(
            (type) => TypeChip(
              chipType: ChipType.filter,
              filterType: type,
              isSelected: selectedPokemonTypes.any(
                    (selectedType) => selectedType == type,
                  ) ==
                  true,
              onSelected: (isSelected) {
                widget.filterViewModel.selectTypeFilter(
                  type,
                );
              },
            ),
          )
          .toList(),
    );
  }

  Widget _buildFilterHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),
        _buildCloseButton(),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      context.strings.filters,
      style: PokeAppText.subtitle1Style.copyWith(
        color: context.colors.onSurface,
      ),
    );
  }

  Widget _buildSubtitle(String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 8,
        top: 4,
      ),
      child: Text(
        subtitle,
        style: PokeAppText.body1Style.copyWith(
          color: context.colors.onSurface,
        ),
      ),
    );
  }

  Widget _buildCloseButton() {
    return IconButton(
      icon: Icon(
        Icons.close,
        size: 20,
        color: context.colors.onSurface,
      ),
      onPressed: widget.onClose,
    );
  }
}
