import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../dependency_injection_container.dart';
import '../../theme/base_theme.dart';
import '../../theme/poke_app_text.dart';
import 'view_models/expansion_card_state_view_model.dart';

typedef ExpansionCardBuilder = Widget Function(bool isExapnded);

class ExpansionCard extends StatefulWidget {
  ExpansionCard({
    Key? key,
    this.onTap,
    required this.title,
    required this.expandedChildren,
    this.subtitle,
    required this.bottomWidgetBuilder,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final List<Widget> expandedChildren;
  final VoidCallback? onTap;
  final ExpansionCardBuilder bottomWidgetBuilder;

  @override
  State<ExpansionCard> createState() => _ExpansionCardState();
}

class _ExpansionCardState extends State<ExpansionCard> with TickerProviderStateMixin {
  final _expansionCardStateViewModel = getIt.get<ExpansionCardStateViewModel>();
  late AnimationController _controller;
  final _expandableController = ExpandableController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _expandableController.dispose();
    _expansionCardStateViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      initialData: false,
      stream: _expansionCardStateViewModel.isExpandedStateStream,
      builder: (context, snapshot) {
        final _isExpanded = snapshot.data ?? false;
        return Theme(
          data: ThemeData(
            cardColor: colors(context).cardBackground,
          ),
          child: _buildCard(_isExpanded),
        );
      },
    );
  }

  Widget _buildCard(bool _isExpanded) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.all(
          16,
        ),
        child: _buildCardBody(
          _isExpanded,
        ),
      ),
    );
  }

  Widget _buildCardBody(
    bool _isExpanded,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildTitle(),
                  if (widget.subtitle != null) _buildSubtitle(),
                ],
              ),
            ),
            _buildRotatingIconButton(
              _isExpanded,
            ),
          ],
        ),
        _buildExpandable(_isExpanded),
        widget.bottomWidgetBuilder(_isExpanded),
      ],
    );
  }

  Widget _buildExpandable(bool isExpanded) {
    return Expandable(
      controller: _expandableController,
      collapsed: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(),
        ],
      ),
      expanded: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: widget.expandedChildren,
      ),
    );
  }

  Widget _buildTitle() {
    return Flexible(
      child: Text(
        widget.title,
        style: PokeAppText.subtitle3Style,
      ),
    );
  }

  Widget _buildSubtitle() {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          widget.subtitle ?? '',
          style: PokeAppText.body4Style,
        ),
      ),
    );
  }

  Widget _buildRotatingIconButton(bool _isExpanded) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 0.5).animate(_controller),
      child: IconButton(
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: colors(context).textOnForeground,
        ),
        onPressed: () {
          if (_isExpanded) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
          _expansionCardStateViewModel.isExpandedStateStream.add(
            !_isExpanded,
          );
          _expandableController.toggle();
          widget.onTap?.call();
        },
      ),
    );
  }
}
