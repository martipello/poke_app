import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../api/models/pokemon/pokemon.dart';
import '../../extensions/build_context_extension.dart';
import '../settings/settings.dart';
import '../shared_widgets/clipped_app_bar.dart';
import '../shared_widgets/type_chip.dart';
import '../shared_widgets/view_constraint.dart';
import 'pokemon_detail_header.dart';

class PokemonDetailAppBar extends StatefulWidget {
  const PokemonDetailAppBar({
    Key? key,
    required this.pokemon,
    required this.primaryColor,
    required this.secondaryColor,
  }) : super(key: key);

  final Pokemon pokemon;
  final Color primaryColor;
  final Color secondaryColor;

  @override
  State<PokemonDetailAppBar> createState() => _PokemonDetailAppBarState();
}

class _PokemonDetailAppBarState extends State<PokemonDetailAppBar> with TickerProviderStateMixin {
  final _duration = const Duration(milliseconds: 300);
  static const kDetailAppBarCardBackgroundHeight = 300.0;
  static const kExpandedHeight = 132.0 + kDetailAppBarCardBackgroundHeight + kChipHeight;

  late final _circleRevealAnimationController = AnimationController(
    vsync: this,
    duration: _duration,
  );

  late final _circleRevealAnimation = CurvedAnimation(
    parent: _circleRevealAnimationController,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 200),
    ).then(
      (value) => _circleRevealAnimationController.forward(),
    );
  }

  @override
  void dispose() {
    _circleRevealAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildSliverAppBar();
  }

  Widget _buildSliverAppBar() {
    return BackButtonListener(
      onBackButtonPressed: () async {
        await _circleRevealAnimationController.reverse().then(
              (value) => context.pop(),
            );
        return true;
      },
      child: SliverAppBar(
        pinned: false,
        expandedHeight: kIsWeb ? kExpandedHeight + 16 : kExpandedHeight,
        surfaceTintColor: Colors.transparent,
        titleSpacing: 0,
        title: ClippedAppBar(
          menuButton: _buildMenuButton(),
          clipColor: widget.primaryColor,
          onBackTap: () {
            _circleRevealAnimationController.reverse().then(
                  (value) => context.pop(),
                );
          },
        ),
        leadingWidth: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: widget.primaryColor,
        ),
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: _buildPokemonDetailHeader(),
        ),
      ),
    );
  }

  IconButton _buildMenuButton() {
    return IconButton(
      icon: Icon(
        Icons.more_vert_rounded,
        color: context.colors.onSurface,
      ),
      onPressed: () {
        context.push(
          Settings.routeName,
        );
      },
    );
  }

  Widget _buildPokemonDetailHeader() {
    return Stack(
      children: [
        Positioned.fill(
          child: CircularRevealAnimation(
            animation: _circleRevealAnimation,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: widget.secondaryColor,
              ),
            ),
          ),
        ),
        ViewConstraint(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: context.colors.surface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(48),
                  topRight: Radius.circular(48),
                ),
              ),
              child: const SizedBox(
                height: kDetailAppBarCardBackgroundHeight,
                width: double.infinity,
              ),
            ),
          ),
        ),
        PokemonDetailHeader(
          pokemon: widget.pokemon,
          primaryColor: widget.primaryColor,
        ),
      ],
    );
  }

}
