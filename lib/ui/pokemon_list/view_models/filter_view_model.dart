import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tuple/tuple.dart';

import '../../../api/models/pokemon/pokemon_type.dart';
import '../../../utils/stream_helper.dart';

class FilterViewModel {
  final _isFloatingActionButtonShownStream = BehaviorSubject<bool>.seeded(true);
  final _isFilterBottomSheetShownStream = BehaviorSubject<bool>.seeded(false);
  final selectedFiltersStream = BehaviorSubject<List<PokemonType>>.seeded([]);

  Stream<Tuple2<bool, bool>> get filterUIState => combine2(
        _isFloatingActionButtonShownStream,
        _isFilterBottomSheetShownStream,
        debounceTime: const Duration(
          milliseconds: 10,
        ),
      ).distinct().asyncMap(
        (event) async {
          final _showFloatingActionButton = event.item1;
          final _showFilterBottomSheet = event.item2;
          if (_showFloatingActionButton && _showFilterBottomSheet) {
            return const Tuple2(false, true);
          }
          return Tuple2(_showFloatingActionButton, _showFilterBottomSheet);
        },
      );

  double get filterHeight => 320.0;

  ScrollController get scrollController =>  _scrollController ??= ScrollController();
  ScrollController? _scrollController;

  void init() {
    _isFloatingActionButtonShownStream
        .debounceTime(
      const Duration(seconds: 1),
    )
        .listen(
          (value) {
        if (!value) {
          _isFloatingActionButtonShownStream.add(
            true,
          );
        }
      },
    );
  }

  void setFilterUIState() {
    final _isFilterBottomSheetShown = _isFilterBottomSheetShownStream.value;
    if (_isFilterBottomSheetShown) {
      _isFloatingActionButtonShownStream.add(true);
      _isFilterBottomSheetShownStream.add(false);
    } else {
      _isFloatingActionButtonShownStream.add(false);
      _isFilterBottomSheetShownStream.add(true);
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

  void setActionButtonVisibility() {
    _isFloatingActionButtonShownStream.add(false);
  }

  void dispose() {
    _isFloatingActionButtonShownStream.close();
    _isFilterBottomSheetShownStream.close();
    selectedFiltersStream.close();
    _scrollController?.dispose();
  }
}
