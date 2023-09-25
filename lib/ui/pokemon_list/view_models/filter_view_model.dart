import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../../../api/models/filter_type.dart';

class FilterViewModel {
  final isFilterBottomSheetShownStream = BehaviorSubject<bool>.seeded(false);
  final selectedFiltersStream = BehaviorSubject<List<FilterType>>.seeded([]);

  ScrollController get scrollController => _scrollController ??= ScrollController();
  ScrollController? _scrollController;

  void setFilterUIState() {
    final _isFilterBottomSheetShown = isFilterBottomSheetShownStream.value;
    if (_isFilterBottomSheetShown) {
      isFilterBottomSheetShownStream.add(false);
    } else {
      isFilterBottomSheetShownStream.add(true);
    }
  }

  void selectTypeFilter(FilterType type) {
    final _selectedFilters = selectedFiltersStream.value;
    if (_selectedFilters.any((selectedType) => selectedType == type)) {
      _selectedFilters.remove(type);
    } else {
      _selectedFilters.add(type);
    }
    selectedFiltersStream.add(_selectedFilters);
  }

  void clearTypeFilters() {
    selectedFiltersStream.add([]);
  }

  void clearFilters() {
    clearTypeFilters();
  }

  void dispose() {
    isFilterBottomSheetShownStream.close();
    _scrollController?.dispose();
  }
}
