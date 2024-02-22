import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../api/models/pokemon/pokemon.dart';
import '../../extensions/build_context_extension.dart';

typedef ImageErrorBuilder = Widget Function(BuildContext context, Object? object, StackTrace? stacktrace);

const kDefaultImageHeight = 150.0;

String createImageUrl(int id) {
  return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
}

String createAudioUrl(int id) {
  return 'https://raw.githubusercontent.com/PokeAPI/cries/main/cries/pokemon/latest/$id.ogg';
}

class PokemonImage extends StatelessWidget {
  const PokemonImage({
    Key? key,
    required this.pokemon,
    required this.imageProvider,
    this.size,
    this.maskColor,
    this.colorScheme,
    this.includeHero = true,
    this.drawOuterCircle = true,
    this.clipBehavior = Clip.none,
  });

  final Pokemon pokemon;
  final CachedNetworkImageProvider imageProvider;
  final ColorScheme? colorScheme;
  final Clip clipBehavior;
  final Size? size;
  final bool includeHero;
  final bool drawOuterCircle;
  final Color? maskColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size?.height ?? kDefaultImageHeight,
      width: size?.width ?? kDefaultImageHeight,
      child: Material(
        type: MaterialType.transparency,
        child: _buildImageHolder(
          context,
          includeHero,
          imageProvider,
          (context, _, __) => _buildEmptyImage(),
        ),
      ),
    );
  }

  Widget _buildImageHolder(
    BuildContext context,
    bool buildHeroWidget,
    ImageProvider imageProvider,
    ImageErrorBuilder imageErrorBuilder,
  ) {
    return Stack(
      children: [
        if (drawOuterCircle)
        _buildOuterCircle(
          imageErrorBuilder,
          colorScheme,
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: buildHeroWidget
                ? _buildImageWithHero(
                    imageProvider,
                    imageErrorBuilder,
                  )
                : _buildImage(
                    imageProvider,
                    imageErrorBuilder,
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildOuterCircle(
    ImageErrorBuilder imageErrorBuilder,
    ColorScheme? colorScheme,
  ) {
    final primaryColor = colorScheme?.primary ?? Colors.white;
    final secondaryColor = colorScheme?.primaryContainer ?? Colors.white;

    return ClipRRect(
      clipBehavior: clipBehavior,
      borderRadius: _buildBorderRadius(),
      child: AnimatedContainer(
        height: size?.height ?? kDefaultImageHeight,
        width: size?.width ?? kDefaultImageHeight,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: primaryColor,
        ),
        padding: const EdgeInsets.all(6),
        child: Center(
          child: _buildCenterCircle(
            secondaryColor,
          ),
        ),
      ),
    );
  }

  Widget _buildCenterCircle(
    Color? secondaryColor,
  ) {
    return ClipRRect(
      clipBehavior: clipBehavior,
      borderRadius: _buildBorderRadius(),
      child: AnimatedContainer(
        height: size?.height ?? kDefaultImageHeight,
        width: size?.width ?? kDefaultImageHeight,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: secondaryColor,
        ),
      ),
    );
  }

  Widget _buildImageWithHero(
    ImageProvider imageProvider,
    ImageErrorBuilder imageErrorBuilder,
  ) {
    return Hero(
      tag: '${pokemon.id}',
      transitionOnUserGestures: true,
      child: _buildImage(
        imageProvider,
        imageErrorBuilder,
      ),
    );
  }

  Widget _buildImage(
    ImageProvider imageProvider,
    ImageErrorBuilder imageErrorBuilder,
  ) {
    return Image(
      image: imageProvider,
      fit: BoxFit.cover,
      gaplessPlayback: true,
      color: maskColor,
      height: size?.height ?? kDefaultImageHeight,
      width: size?.width ?? kDefaultImageHeight,
      loadingBuilder: (context, child, chunk) {
        if (chunk == null) {
          return child;
        }
        return _buildEmptyImageHolder(
          context,
          isLoading: true,
        );
      },
      errorBuilder: imageErrorBuilder,
    );
  }

  Widget _buildEmptyImageHolder(
    BuildContext context, {
    bool isLoading = false,
  }) {
    return Center(
      child: ClipRRect(
        clipBehavior: clipBehavior,
        borderRadius: _buildBorderRadius(),
        child: SizedBox(
          height: size?.height ?? kDefaultImageHeight,
          width: size?.width ?? kDefaultImageHeight,
          child: Center(
            child: isLoading ? _buildLoadingImage(context) : _buildEmptyImage(),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyImage() {
    return Image.asset(
      'assets/images/pokeball_outline.png',
      gaplessPlayback: true,
    );
  }

  Widget _buildLoadingImage(BuildContext context) {
    return Image.asset(
      'assets/images/pokeball_outline.png',
      gaplessPlayback: true,
    )
        .animate(
          onPlay: (controller) => controller.repeat(),
        )
        .shimmer(
          duration: 1200.ms,
          color: context.colors.onSurface,
        );
  }

  BorderRadius _buildBorderRadius() => BorderRadius.circular(180);

// @override
// void didUpdateWidget(covariant PokemonImage oldWidget) {
//   super.didUpdateWidget(oldWidget);
//   if (pokemon.id != oldWidget.pokemon.id) {
//     mainImageProvider = CachedNetworkImageProvider(
//       _createImageUrl(),
//     );
//   }
// }
}
