import 'package:flutter/material.dart';

import '../../api/models/pokemon/pokemon.dart';
import '../../extensions/build_context_extension.dart';
import '../../theme/base_theme.dart';
import '../../utils/irregular_trapezium_clipper.dart';
import '../shared_widgets/pokemon_image.dart';

class PokemonDetailPageArguments {
  PokemonDetailPageArguments({
    required this.pokemon,
  });

  final Pokemon pokemon;
}

class PokemonDetailPage extends StatefulWidget {
  const PokemonDetailPage({
    Key? key,
  }) : super(key: key);
  static const String routeName = '/detail';

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  PokemonDetailPageArguments get pokemonDetailArguments => context.routeArguments as PokemonDetailPageArguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipPath(
                clipper: IrregularTrapeziumClipper(),
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 56,),
              PokemonImage(
                pokemon: pokemonDetailArguments.pokemon,
                size: const Size(
                  200,
                  200,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBar(
                automaticallyImplyLeading: true,
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
