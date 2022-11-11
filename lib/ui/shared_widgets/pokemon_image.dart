import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../api/models/pokemon/pokemon.dart';
import '../../api/models/pokemon/sprite.dart';

class PokemonImage extends StatelessWidget {
  const PokemonImage({
    Key? key,
    this.size,
    required this.pokemon,
    this.clipBehavior = Clip.none,
  });

  final Pokemon pokemon;
  final Clip clipBehavior;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Hero(
        tag: '${pokemon.id}',
        child: _buildProfileImage(context),
      ),
    );
  }

  String _createImageUrl() {
    return 'https://firebasestorage.googleapis.com/v0/b/pokeapp-86eec.appspot.com/o/pokemon_image_${pokemon.id}.png?alt=media';
  }

  Widget _buildProfileImage(
    BuildContext context,
  ) {
    final imageUrl = _createImageUrl();
    return Center(
      child: ClipRRect(
        clipBehavior: clipBehavior,
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
            return _buildEmptyImageHolder(
              context,
              isLoading: true,
            );
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
        clipBehavior: clipBehavior,
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
            return _buildEmptyImageHolder(
              context,
              isLoading: true,
            );
          },
          errorBuilder: (context, object, stacktrace) {
            return _buildEmptyImageHolder(
              context,
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmptyImageHolder(
    BuildContext context, {
    bool isLoading = false,
  }) {
    return Center(
      child: ClipRRect(
        clipBehavior: clipBehavior,
        borderRadius: BorderRadius.circular(180),
        child: SizedBox(
          height: size?.height ?? 150,
          width: size?.width ?? 150,
          child: Center(
            child: isLoading ? _buildLoadingImage() : _buildEmptyImage(),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyImage() {
    return Image.asset(
      'assets/images/pokeball_outline.png',
    );
  }

  Widget _buildLoadingImage() {
    return Image.asset(
      'assets/images/pokeball_outline.png',
    )
        .animate(
          onPlay: (controller) => controller.repeat(),
        )
        .shimmer(
          duration: 1200.ms,
          color: const Color(0xFF80DDFF),
        );
  }
}
