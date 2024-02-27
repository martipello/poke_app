import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../api/models/pokemon/pokemon.dart';
import '../../extensions/build_context_extension.dart';

const kDefaultImageHeight = 150.0;

String createImageUrl(int id) {
  return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
}

String createAudioUrl(int id) {
  return 'https://raw.githubusercontent.com/PokeAPI/cries/main/cries/pokemon/latest/$id.ogg';
}

class PokemonImage extends StatefulWidget {
  const PokemonImage({
    Key? key,
    required this.pokemon,
    required this.imageProvider,
    this.size,
    this.includeHero = true,
    this.drawOuterCircle = true,
    this.clipBehavior = Clip.none,
    this.maskColor,
    this.primary,
    this.secondary,
  });

  final Pokemon pokemon;
  final CachedNetworkImageProvider imageProvider;
  final Clip clipBehavior;
  final Size? size;
  final bool includeHero;
  final bool drawOuterCircle;
  final Color? maskColor;
  final Color? primary;
  final Color? secondary;

  @override
  State<PokemonImage> createState() => _PokemonImageState();
}

class _PokemonImageState extends State<PokemonImage> {
  bool _hasBegunLoading = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size?.height ?? kDefaultImageHeight,
      width: widget.size?.width ?? kDefaultImageHeight,
      child: Material(
        type: MaterialType.transparency,
        child: _buildImageHolder(
          context,
          widget.includeHero,
          widget.imageProvider,
        ),
      ),
    );
  }

  Widget _buildImageHolder(
    BuildContext context,
    bool buildHeroWidget,
    ImageProvider imageProvider,
  ) {
    return Stack(
      children: [
        if (widget.drawOuterCircle)
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: _buildOuterCircle(),
            ),
          ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: buildHeroWidget
                ? _buildImageWithHero(
                    context,
                    imageProvider,
                  )
                : _buildImage(
                    context,
                    imageProvider,
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildOuterCircle() {
    final primaryColor = widget.primary ?? context.colors.surface;
    final secondaryColor = widget.secondary ?? context.colors.surface;

    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: ClipRRect(
        clipBehavior: widget.clipBehavior,
        borderRadius: _buildBorderRadius(),
        child: Container(
          height: widget.size?.height ?? kDefaultImageHeight,
          width: widget.size?.width ?? kDefaultImageHeight,
          decoration: BoxDecoration(
            color: primaryColor,
          ),
          padding: const EdgeInsets.all(6.0),
          child: Center(
            child: _buildCenterCircle(
              secondaryColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCenterCircle(
    Color? secondaryColor,
  ) {
    return ClipRRect(
      clipBehavior: widget.clipBehavior,
      borderRadius: _buildBorderRadius(),
      child: Container(
        height: widget.size?.height ?? kDefaultImageHeight,
        width: widget.size?.width ?? kDefaultImageHeight,
        decoration: BoxDecoration(
          color: secondaryColor,
        ),
      ),
    );
  }

  Widget _buildImageWithHero(
    BuildContext context,
    ImageProvider imageProvider,
  ) {
    return Hero(
      tag: '${widget.pokemon.id}',
      transitionOnUserGestures: true,
      child: _buildImage(
        context,
        imageProvider,
      ),
    );
  }

  Widget _buildImage(
    BuildContext context,
    ImageProvider imageProvider,
  ) {
    return Image(
      image: imageProvider,
      fit: BoxFit.cover,
      gaplessPlayback: true,
      color: widget.maskColor,
      height: widget.size?.height ?? kDefaultImageHeight,
      width: widget.size?.width ?? kDefaultImageHeight,
      loadingBuilder: (context, child, chunk) {
        if (_hasBegunLoading && chunk == null) {
          return child;
        }
        return _buildEmptyImageHolder(
          context,
          isLoading: true,
        );
      },
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        _hasBegunLoading = frame != null;
        return child;
      },
      errorBuilder: (context, _, __) {
        return _buildEmptyImageHolder(
          context,
          isLoading: false,
        );
      },
    );
  }

  Widget _buildEmptyImageHolder(
    BuildContext context, {
    bool isLoading = true,
  }) {
    return Center(
      child: ClipRRect(
        clipBehavior: widget.clipBehavior,
        borderRadius: _buildBorderRadius(),
        child: SizedBox(
          height: widget.size?.height ?? kDefaultImageHeight,
          width: widget.size?.width ?? kDefaultImageHeight,
          child: Center(
            child: isLoading ? _buildLoadingImage(context) : _buildEmptyImage(),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyImage() {
    return _buildPlaceHolder();
  }

  Widget _buildLoadingImage(BuildContext context) {
    return _buildPlaceHolder()
        .animate(
          onPlay: (controller) => controller.repeat(),
        )
        .shimmer(
          duration: 1000.ms,
          color: context.colors.surface,
        );
  }

  Widget _buildPlaceHolder() {
    return Image.asset(
      'assets/images/pokeball_outline.png',
      gaplessPlayback: true,
      height: widget.size?.height ?? kDefaultImageHeight,
      width: widget.size?.width ?? kDefaultImageHeight,
    );
  }

  BorderRadius _buildBorderRadius() => BorderRadius.circular(180);

}
