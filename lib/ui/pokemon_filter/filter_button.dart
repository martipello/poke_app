import 'package:flutter/material.dart';
import 'package:local_hero_with_callback/local_hero_with_callback.dart';

class FilterButton extends StatefulWidget {
  FilterButton({
    required this.onTap,
    required this.onAnimationEnd,
  });

  final VoidCallback onTap;
  final VoidCallback onAnimationEnd;

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> with SingleTickerProviderStateMixin {

  final filterButtonTag = 'filterButtonTag';

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildFloatingActionButtonHolder();
  }

  Widget _buildFloatingActionButtonHolder() {
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
