import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../../../api/models/pokemon/pokemon_type.dart';

class FilterViewModel {
  final isFilterBottomSheetShownStream = BehaviorSubject<bool>.seeded(false);
  final selectedFiltersStream = BehaviorSubject<List<PokemonType>>.seeded([]);

  double get filterHeight => 360.0;

  ScrollController get scrollController =>  _scrollController ??= ScrollController();
  ScrollController? _scrollController;

  void setFilterUIState() {
    final _isFilterBottomSheetShown = isFilterBottomSheetShownStream.value;
    if (_isFilterBottomSheetShown) {
      isFilterBottomSheetShownStream.add(false);
    } else {
      isFilterBottomSheetShownStream.add(true);
    }
  }

  void selectFilter(PokemonType type){
    final _selectedFilters = selectedFiltersStream.value;
    if(_selectedFilters.any((selectedType) => selectedType == type)){
      _selectedFilters.remove(type);
    } else {
      _selectedFilters.add(type);
    }
    selectedFiltersStream.add(_selectedFilters);
  }

  void clearFilters(){
    selectedFiltersStream.add([]);
  }

  void dispose() {
    isFilterBottomSheetShownStream.close();
    selectedFiltersStream.close();
    _scrollController?.dispose();
  }
}
