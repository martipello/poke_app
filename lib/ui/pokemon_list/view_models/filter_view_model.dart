import 'package:rxdart/rxdart.dart';
import 'package:tuple/tuple.dart';

import '../../../api/models/pokemon/pokemon_type.dart';
import '../../../utils/stream_helper.dart';

class FilterViewModel {

  void init(){
    _isFloatingActionButtonShownStream
        .debounceTime(
      const Duration(
        seconds: 1,
      ),
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

  Stream<Tuple2<bool, bool>> get filterUIState => combine2(
        _isFloatingActionButtonShownStream,
        _isFilterBottomSheetShownStream,
        debounceTime: const Duration(
          milliseconds: 10,
        ),
      ).distinct().asyncMap((event) async {
        final _showFloatingActionButton = event.item1;
        final _showFilterBottomSheet = event.item2;
        if (_showFloatingActionButton && _showFilterBottomSheet) {
          return const Tuple2(false, true);
        }
        return Tuple2(_showFloatingActionButton, _showFilterBottomSheet);

        // if (_showFloatingActionButton && _showFilterBottomSheet) {
        //           return const Tuple2(false, true);
        // } else if (!_showFloatingActionButton && _showFilterBottomSheet) {
        //   return const Tuple2(false, true);
        // } else if (_showFloatingActionButton && !_showFilterBottomSheet) {
        //   return const Tuple2(true, false);
        // } else {
        //   return const Tuple2(false, false);
        // }
      });

  final _isFloatingActionButtonShownStream = BehaviorSubject<bool>.seeded(true);
  final _isFilterBottomSheetShownStream = BehaviorSubject<bool>.seeded(false);
  final selectedFilters = BehaviorSubject<List<PokemonType>>();

  void setFilterUIState() {
    final _isFilterBottomSheetShown = _isFilterBottomSheetShownStream.value;
    if(_isFilterBottomSheetShown) {
      _isFloatingActionButtonShownStream.add(true);
      _isFilterBottomSheetShownStream.add(false);
    } else {
      _isFloatingActionButtonShownStream.add(false);
      _isFilterBottomSheetShownStream.add(true);
    }
  }

  void setActionButtonVisibility() {
    _isFloatingActionButtonShownStream.add(false);
  }

  void dispose() {
    _isFloatingActionButtonShownStream.close();
    _isFilterBottomSheetShownStream.close();
  }
}
