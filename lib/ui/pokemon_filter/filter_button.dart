import 'package:flutter/material.dart';
import 'package:local_hero_with_callback/local_hero_with_callback.dart';

class FilterButton extends StatefulWidget {
  FilterButton({
    required this.isFloatingActionButtonShown,
    required this.isFilterBottomSheetShown,
    required this.onTap,
    required this.onAnimationEnd,
  });

  final bool isFloatingActionButtonShown;
  final bool isFilterBottomSheetShown;
  final VoidCallback onTap;
  final VoidCallback onAnimationEnd;

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> with SingleTickerProviderStateMixin {
  final _duration = const Duration(milliseconds: 300);

  final filterButtonTag = 'filterButtonTag';

  // late final AnimationController _controller = AnimationController(
  //   duration: const Duration(seconds: 2),
  //   vsync: this,
  // );

  // late final Animation<Offset> _offsetAnimation = Tween<Offset>(
  //   begin: Offset.zero,
  //   end: const Offset(0, 3),
  // ).animate(
  //   CurvedAnimation(
  //     parent: _controller,
  //     curve: Curves.fastOutSlowIn,
  //   ),
  // );

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildFloatingActionButtonHolder();
  }

  Widget _buildFloatingActionButtonHolder() {
    // final _hideFloatingActionButton = !widget.isFilterBottomSheetShown && !widget.isFloatingActionButtonShown;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LocalHeroWithCallback(
        tag: filterButtonTag,
        onAnimationEnd: widget.onAnimationEnd,
        child: _buildFilterFloatingActionButton(),
      ),
    );
  }

  Widget _buildFilterFloatingActionButton() {
    return FloatingActionButton(
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      backgroundColor: Colors.red,
      onPressed: null,
      child: Stack(
        children: [
          _buildFilterButtonImage(),
          _buildFilterButtonInkWell(),
        ],
      ),
    );
  }

  Widget _buildFilterButtonInkWell() {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        splashColor: Colors.red.withOpacity(
          0.5,
        ),
        onTap: widget.onTap,
      ),
    );
  }

  Widget _buildFilterButtonImage() {
    return Image.asset(
      'assets/images/pokeball_filter.png',
    );
  }
}
