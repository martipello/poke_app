import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../../../api/models/pokemon/damage_type.dart';
import '../../../api/models/pokemon/pokemon_type.dart';

class FilterViewModel {
  final isFilterBottomSheetShownStream = BehaviorSubject<bool>.seeded(false);
  final selectedTypeFiltersStream = BehaviorSubject<List<PokemonType>>.seeded([]);
  final selectedDamageTypeFiltersStream = BehaviorSubject<List<DamageType>>.seeded([]);

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

  void selectTypeFilter(PokemonType type){
    final _selectedFilters = selectedTypeFiltersStream.value;
    if(_selectedFilters.any((selectedType) => selectedType == type)){
      _selectedFilters.remove(type);
    } else {
      _selectedFilters.add(type);
    }
    selectedTypeFiltersStream.add(_selectedFilters);
  }

  void selectDamageTypeFilter(DamageType type){
    final _selectedFilters = selectedDamageTypeFiltersStream.value;
    if(_selectedFilters.any((selectedType) => selectedType == type)){
      _selectedFilters.remove(type);
    } else {
      _selectedFilters.add(type);
    }
    selectedDamageTypeFiltersStream.add(_selectedFilters);
  }

  void clearTypeFilters(){
    selectedTypeFiltersStream.add([]);
  }

  void clearDamageTypeFilters(){
    selectedDamageTypeFiltersStream.add([]);
  }

  void clearFilters(){
    clearTypeFilters();
    clearDamageTypeFilters();
  }

  void dispose() {
    isFilterBottomSheetShownStream.close();
    selectedTypeFiltersStream.close();
    _scrollController?.dispose();
  }
}
