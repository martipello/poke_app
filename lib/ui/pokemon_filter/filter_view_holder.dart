import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';
import 'package:local_hero_with_callback/local_hero_with_callback.dart';
import 'package:tuple/tuple.dart';

import '../../utils/console_output.dart';
import '../pokemon_list/view_models/filter_view_model.dart';
import 'filter_button.dart';
import 'filter_view.dart';

class FilterViewHolder extends StatefulWidget {
  const FilterViewHolder({
    super.key,
    required this.filterViewModel,
  });

  final FilterViewModel filterViewModel;

  @override
  State<FilterViewHolder> createState() => _FilterViewHolderState();
}

class _FilterViewHolderState extends State<FilterViewHolder> with SingleTickerProviderStateMixin {
  late final _circleRevealAnimationController = AnimationController(
    vsync: this,
    duration: _duration,
  );

  late final _circleRevealAnimation = CurvedAnimation(
    parent: _circleRevealAnimationController,
    curve: Curves.easeIn,
  );

  final _duration = const Duration(milliseconds: 300);

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
          final _isFilterBottomSheetShown = snapshot.data?.item2 == true;
          return SizedBox(
            height: _isFilterBottomSheetShown ? widget.filterViewModel.filterHeight : 100,
            width: double.infinity,
            child: Stack(
              children: [
                Align(
                  alignment: _isFilterBottomSheetShown ? Alignment.center : Alignment.bottomRight,
                  child: _buildFilterButton(
                    _isFilterBottomSheetShown,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _buildFilterViewHolder(
                    _isFilterBottomSheetShown,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFilterButton(
    bool _isFilterBottomSheetShown,
  ) {
    return FilterButton(
      onTap: () {
        widget.filterViewModel.setActionButtonVisibility();
        widget.filterViewModel.setFilterUIState();
      },
      onAnimationEnd: () {
        if (_isFilterBottomSheetShown) {
          _circleRevealAnimationController.forward();
        }
      },
    );
  }

  Widget _buildFilterViewHolder(
    bool _isFilterBottomSheetShown,
  ) {
    return CircularRevealAnimation(
      animation: _circleRevealAnimation,
      child: FilterView(
        filterViewModel: widget.filterViewModel,
        onClose: () {
          _circleRevealAnimationController.reverse().then(
                (value) {
              widget.filterViewModel.setFilterUIState();
            },
          );
        },
      ),
    );
  }
}
