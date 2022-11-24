import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../api/models/pokemon/pokemon.dart';
import '../../theme/base_theme.dart';
import '../../utils/irregular_trapezium_clipper.dart';
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
    return WillPopScope(
      onWillPop: () async {
        await _circleRevealAnimationController.reverse().then(
              (value) => Navigator.of(context).pop(),
        );
        return true;
      },
      child: SliverAppBar(
        pinned: false,
        expandedHeight: 440,
        backgroundColor: colors(context).cardBackground,
        titleSpacing: 0,
        title: _buildEmbeddedAppBar(),
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

  Widget _buildEmbeddedAppBar() {
    return Stack(
      children: [
        _buildAppBarClip(),
        _buildAppBarBackButton(),
      ],
    );
  }

  Widget _buildAppBarClip() {
    return ClipPath(
      clipper: IrregularTrapeziumClipper(),
      child: Container(
        height: kToolbarHeight,
        decoration: BoxDecoration(
          color: widget.primaryColor,
        ),
      ),
    );
  }

  Widget _buildAppBarBackButton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: colors(context).cardBackground,
        ),
        onPressed: () {
          _circleRevealAnimationController.reverse().then(
                (value) => Navigator.of(context).pop(),
              );
        },
      ),
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
        Align(
          alignment: Alignment.bottomCenter,
          child: Theme(
            data: ThemeData(
              cardTheme: _buildCardTheme(),
            ),
            child: const Card(
              child: SizedBox(
                height: 276,
                width: double.infinity,
              ),
            ),
          ),
        ),
        PokemonDetailHeader(
          pokemon: widget.pokemon,
        ),
      ],
    );
  }

  CardTheme _buildCardTheme() {
    return CardTheme(
      color: colors(context).white,
      clipBehavior: Clip.hardEdge,
      elevation: 4,
      margin: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(48),
          topRight: Radius.circular(48),
        ),
      ),
    );
  }
}
