import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../dependency_injection_container.dart';
import 'view_models/pokeball_loading_view_model.dart';

class PokeballLoadingWidget extends StatefulWidget {
  const PokeballLoadingWidget({Key? key, this.size}) : super(key: key);

  final Size? size;

  @override
  _PokeballLoadingWidgetState createState() => _PokeballLoadingWidgetState();
}

class _PokeballLoadingWidgetState extends State<PokeballLoadingWidget> {

  final _pokeballLoadingViewModel = getIt.get<PokeballLoadingViewModel>();

  @override
  void dispose() {
    _pokeballLoadingViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: widget.size?.height ?? 100,
        width: widget.size?.width ?? 100,
        child: RiveAnimation.asset(
          _pokeballLoadingViewModel.animationDirectory,
          controllers: [_pokeballLoadingViewModel.controller],
        ),
      ),
    );
  }
}