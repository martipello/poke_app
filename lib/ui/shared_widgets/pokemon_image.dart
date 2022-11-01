import 'dart:convert';

import 'package:flutter/material.dart';

import '../../api/models/pokemon/pokemon.dart';
import '../../api/models/pokemon/sprite.dart';
import 'loading_widget.dart';

class PokemonImage extends StatelessWidget {
  const PokemonImage({
    Key? key,
    this.size,
    required this.pokemon,
  });

  final Pokemon pokemon;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return _buildProfileImage(context);
  }

  String _createImageUrl() {
    if (pokemon.id == 3) {
      return '';
    }
    return 'https://firebasestorage.googleapis.com/v0/b/pokeapp-86eec.appspot.com/o/pokemon_image_${pokemon.id}.png?alt=media';
  }

  Widget _buildProfileImage(
    BuildContext context,
  ) {
    final imageUrl = _createImageUrl();
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(180),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          height: size?.height ?? 150,
          width: size?.width ?? 150,
          loadingBuilder: (context, child, chunk) {
            if (chunk == null) {
              return child;
            }
            return _buildLoadingImage();
          },
          errorBuilder: (context, object, stacktrace) {
            return _buildSpriteImage(
              context,
            );
          },
        ),
      ),
    );
  }

  Widget _buildSpriteImage(
    BuildContext context,
  ) {
    final spriteData = jsonDecode(pokemon.pokemon_v2_pokemonsprites.first.sprites ?? '');
    final sprite = Sprite.fromJson(spriteData);
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(180),
        child: Image.network(
          sprite.front_default ?? '',
          fit: BoxFit.cover,
          height: size?.height ?? 150,
          width: size?.width ?? 150,
          loadingBuilder: (context, child, chunk) {
            if (chunk == null) {
              return child;
            }
            return _buildLoadingImage();
          },
          errorBuilder: (context, object, stacktrace) {
            return _buildEmptyImage(
              context,
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmptyImage(
    BuildContext context,
  ) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(180),
        child: SizedBox(
          height: size?.height ?? 150,
          width: size?.width ?? 150,
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.grey,
              BlendMode.color,
            ),
            child: Center(
              child: Image.asset(
                'assets/images/pokeball.png',
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingImage() {
    //TODO make this shimmer loading
    return Center(
      child: SizedBox(
        height: size?.height ?? 150,
        width: size?.width ?? 150,
        child: const Padding(
          padding: EdgeInsets.all(4.0),
          child: Center(
            child: LoadingWidget(),
          ),
        ),
      ),
    );
  }
}
