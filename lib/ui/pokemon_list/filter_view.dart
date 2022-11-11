import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';
import 'package:local_hero_with_callback/local_hero_with_callback.dart';
import 'package:tuple/tuple.dart';

import '../../utils/console_output.dart';
import 'filter_button.dart';
import 'view_models/filter_view_model.dart';

class FilterView extends StatefulWidget {
  const FilterView({
    super.key,
    required this.filterViewModel,
  });

  final FilterViewModel filterViewModel;

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> with SingleTickerProviderStateMixin {
  late final _circleRevealAnimationController = AnimationController(
    vsync: this,
    duration: _duration,
  );

  late final _circleRevealAnimation = CurvedAnimation(
    parent: _circleRevealAnimationController,
    curve: Curves.easeIn,
  );

  final _duration = const Duration(milliseconds: 300);
  final filterHeight = 300.0;

  @override
  void initState() {
    super.initState();
    widget.filterViewModel.init();
  }

  @override
  void dispose() {
    widget.filterViewModel.dispose();
    _circleRevealAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LocalHeroWithCallbackScope(
      curve: Curves.fastOutSlowIn,
      child: StreamBuilder<Tuple2<bool, bool>>(
        initialData: const Tuple2(true, false),
        stream: widget.filterViewModel.filterUIState,
        builder: (context, snapshot) {
          final _isFloatingActionButtonShown = snapshot.data?.item1 == true;
          final _isFilterBottomSheetShown = snapshot.data?.item2 == true;
          log('FILTER').d(
              '_isFloatingActionButtonShown $_isFloatingActionButtonShown _isFilterBottomSheetShown $_isFilterBottomSheetShown');
          return SizedBox(
            height: filterHeight,
            width: double.infinity,
            child: Stack(
              children: [
                Align(
                  alignment: _isFilterBottomSheetShown ? Alignment.center : Alignment.bottomRight,
                  child: FilterButton(
                    isFilterBottomSheetShown: _isFilterBottomSheetShown,
                    isFloatingActionButtonShown: _isFloatingActionButtonShown,
                    onTap: () {
                      widget.filterViewModel.setActionButtonVisibility();
                      widget.filterViewModel.setFilterUIState();
                    },
                    onAnimationEnd: () {
                      if (_isFilterBottomSheetShown) {
                        _circleRevealAnimationController.forward();
                      }
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _buildFilterViewHolder(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFilterViewHolder() {
    return CircularRevealAnimation(
      animation: _circleRevealAnimation,
      //TODO round corners
      child: Container(
        height: filterHeight,
        width: double.infinity,
        color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 18,
                  ),
                  onPressed: (){
                    _circleRevealAnimationController.reverse().then((value) {
                      widget.filterViewModel.setFilterUIState();
                    });
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
