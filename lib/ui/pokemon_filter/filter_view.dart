import 'package:flutter/material.dart';

import '../../api/models/pokemon/damage_type.dart';
import '../../api/models/pokemon/pokemon_type.dart';
import '../../api/models/pokemon/version.dart';
import '../../extensions/build_context_extension.dart';
import '../../extensions/media_query_context_extension.dart';
import '../../theme/base_theme.dart';
import '../../theme/poke_app_text.dart';
import '../pokemon_list/view_models/filter_view_model.dart';
import '../shared_widgets/chip_group.dart';
import '../shared_widgets/type_chip.dart';

class FilterView extends StatefulWidget {
  const FilterView({
    Key? key,
    required this.filterViewModel,
    required this.onClose,
    this.showDamageTypeFilters = false,
    this.showVersionFilters = false,
  }) : super(key: key);

  final FilterViewModel filterViewModel;
  final VoidCallback onClose;
  final bool showDamageTypeFilters;
  final bool showVersionFilters;

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        cardTheme: _buildCardTheme(),
      ),
      child: Card(
        child: SizedBox(
          height: widget.showDamageTypeFilters
              ? MediaQuery.of(context).filterBottomSheetHeight
              : MediaQuery.of(context).singleFilterBottomSheetHeight,
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
      ),
    );
  }

  Widget _buildFilters() {
    return Expanded(
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.showDamageTypeFilters || widget.showVersionFilters)
              _buildSubtitle(
                context.strings.types,
              ),
            _buildTypeFilterChipsHolder(),
            if (widget.showDamageTypeFilters)
              _buildSubtitle(
                context.strings.damageTypes,
              ),
            if (widget.showDamageTypeFilters) _buildDamageTypeFilterChipsHolder(),
            if (widget.showVersionFilters)
              _buildSubtitle(
                context.strings.versions,
              ),
            if (widget.showVersionFilters) _buildVersionFilterChipsHolder(),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeFilterChipsHolder() {
    final pokemonTypes = PokemonType.values.toList();
    pokemonTypes.remove(PokemonType.shadow);
    pokemonTypes.remove(PokemonType.unknown);
    return StreamBuilder<List<PokemonType>>(
      initialData: [],
      stream: widget.filterViewModel.selectedTypeFiltersStream,
      builder: (context, snapshot) {
        final typeChips = pokemonTypes
            .map(
              (type) => _buildTypeChip(
                pokemonType: type,
                isSelected: snapshot.data?.any(
                      (selectedType) => selectedType == type,
                    ) ==
                    true,
              ),
            )
            .toList();
        return _buildTypeChipGroup(typeChips);
      },
    );
  }

  Widget _buildVersionFilterChipsHolder() {
    final versions = Version.values.toList();
    return StreamBuilder<List<Version>>(
      initialData: [],
      stream: widget.filterViewModel.selectedVersionFiltersStream,
      builder: (context, snapshot) {
        final typeChips = versions
            .map(
              (version) => _buildTypeChip(
                version: version,
                isSelected: snapshot.data?.any(
                      (selectedVersion) => selectedVersion == version,
                    ) ==
                    true,
              ),
            )
            .toList();
        return _buildTypeChipGroup(typeChips);
      },
    );
  }

  Widget _buildDamageTypeFilterChipsHolder() {
    final damageTypes = DamageType.values.toList();
    damageTypes.remove(DamageType.unknown);
    return StreamBuilder<List<DamageType>>(
      initialData: [],
      stream: widget.filterViewModel.selectedDamageTypeFiltersStream,
      builder: (context, snapshot) {
        final typeChips = damageTypes
            .map(
              (type) => _buildTypeChip(
                damageType: type,
                isSelected: snapshot.data?.any(
                      (selectedType) => selectedType == type,
                    ) ==
                    true,
              ),
            )
            .toList();
        return _buildTypeChipGroup(typeChips);
      },
    );
  }

  Widget _buildTypeChipGroup(List<Widget> typeChips) {
    return ChipGroup(
      scrollPhysics: widget.showDamageTypeFilters ? const NeverScrollableScrollPhysics() : null,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      chips: typeChips,
    );
  }

  Widget _buildTypeChip({
    DamageType? damageType,
    PokemonType? pokemonType,
    Version? version,
    bool isSelected = false,
  }) {
    if (damageType == null && pokemonType == null && version == null) {
      return const SizedBox();
    }
    return TypeChip(
      chipType: ChipType.filter,
      pokemonType: pokemonType,
      damageType: damageType,
      version: version,
      isSelected: isSelected,
      onSelected: (isSelected) {
        if (damageType != null) {
          widget.filterViewModel.selectDamageTypeFilter(
            damageType,
          );
        }
        if (pokemonType != null) {
          widget.filterViewModel.selectTypeFilter(
            pokemonType,
          );
        }
        if (version != null) {
          widget.filterViewModel.selectVersionFilter(
            version,
          );
        }
      },
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
        color: colors(context).textOnForeground,
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
        style: PokeAppText.body7Style.copyWith(
          color: colors(context).textOnForeground,
        ),
      ),
    );
  }

  Widget _buildCloseButton() {
    return IconButton(
      icon: Icon(
        Icons.close,
        size: 20,
        color: colors(context).textOnForeground,
      ),
      onPressed: widget.onClose,
    );
  }

  CardTheme _buildCardTheme() {
    return CardTheme(
      color: colors(context).cardBackground,
      clipBehavior: Clip.hardEdge,
      elevation: 4,
      margin: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
    );
  }
}
