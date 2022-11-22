import 'package:flutter/material.dart';

import '../../api/models/pokemon/pokemon_type.dart';
import '../../extensions/build_context_extension.dart';
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
  }) : super(key: key);

  final FilterViewModel filterViewModel;
  final VoidCallback onClose;

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
          height: widget.filterViewModel.filterHeight,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildFilterHeader(),
                _buildFilterChipsHolder(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChipsHolder() {
    return StreamBuilder<List<PokemonType>>(
      initialData: [],
      stream: widget.filterViewModel.selectedFiltersStream,
      builder: (context, snapshot) {
        return ChipGroup(
          chips: PokemonType.values
              .map(
                (type) => TypeChip(
                  chipType: ChipType.filter,
                  pokemonType: type,
                  isSelected: snapshot.data?.any(
                        (selectedType) => selectedType == type,
                      ) ==
                      true,
                  onSelected: (isSelected) {
                    widget.filterViewModel.selectFilter(type);
                  },
                ),
              )
              .toList(),
        );
      },
    );
  }

  Widget _buildFilterHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTitle(),
        _buildCloseButton(),
      ],
    );
  }

  Text buildTitle() {
    return Text(
      context.strings.filters,
      style: PokeAppText.subtitle1Style,
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
