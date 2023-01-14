import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../api/models/pokemon/pokemon.dart';
import '../../api/models/pokemon/sprite.dart';
import '../../dependency_injection_container.dart';
import '../../extensions/iterable_extension.dart';
import 'pokemon_image.dart';
import 'view_models/image_color_view_model.dart';

class PokemonSpriteImage extends StatefulWidget {
  const PokemonSpriteImage({
    Key? key,
    this.size,
    required this.pokemon,
    this.clipBehavior = Clip.none,
    this.spriteImageColorCallback,
    this.color,
  });

  final Pokemon pokemon;
  final Color? color;
  final ImageColorCallback? spriteImageColorCallback;
  final Clip clipBehavior;
  final Size? size;

  @override
  State<PokemonSpriteImage> createState() => _PokemonSpriteImageState();
}

class _PokemonSpriteImageState extends State<PokemonSpriteImage> {
  final spriteImageColorViewModel = getIt.get<ImageColorViewModel>();

  late final CachedNetworkImageProvider spriteImageProvider;

  @override
  void initState() {
    super.initState();
    spriteImageProvider = CachedNetworkImageProvider(
      _createSpriteImageUrl(),
    );
    spriteImageColorViewModel.updatePalette(
      context,
      spriteImageProvider,
    );
    spriteImageColorViewModel.colorListStream.listen(
      (value) {
        widget.spriteImageColorCallback?.call(value);
      },
    );
  }

  @override
  void dispose() {
    spriteImageColorViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: _buildImageHolder(
        context,
        false,
        spriteImageProvider,
        spriteImageColorViewModel.colorListStream,
        (context, _, __) => _buildEmptyImage(),
      ),
    );
  }

  Widget _buildImageHolder(
    BuildContext context,
    bool buildHeroWidget,
    ImageProvider imageProvider,
    Stream<List<int>> paletteGeneratorStream,
    ImageErrorBuilder imageErrorBuilder,
  ) {
    return StreamBuilder<List<int>>(
      stream: paletteGeneratorStream,
      builder: (context, snapshot) {
        final palette = snapshot.data ?? [];
        return Stack(
          children: [
            _buildOuterCircle(
              imageErrorBuilder,
              palette,
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
      },
    );
  }

  Widget _buildOuterCircle(
    ImageErrorBuilder imageErrorBuilder,
    List<int> palette,
  ) {
    final primaryColor = palette.firstOrNull() != null
        ? Color(palette.first)
        : Colors.white;

    final secondaryColor = palette.lastOrNull() != null
        ? Color(palette.last)
        : Colors.white;

    return ClipRRect(
      clipBehavior: widget.clipBehavior,
      borderRadius: _buildBorderRadius(),
      child: Container(
        decoration: BoxDecoration(
          color: widget.color ?? primaryColor,
        ),
        padding: const EdgeInsets.all(6),
        child: Center(
          child: _buildCenterCircle(
            secondaryColor,
            imageErrorBuilder,
          ),
        ),
      ),
    );
  }

  Widget _buildCenterCircle(
    Color? dominantColor,
    ImageErrorBuilder imageErrorBuilder,
  ) {
    return ClipRRect(
      clipBehavior: widget.clipBehavior,
      borderRadius: _buildBorderRadius(),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: widget.color ?? dominantColor,
        ),
        child: SizedBox(
          height: widget.size?.height ?? kDefaultImageHeight,
          width: widget.size?.width ?? kDefaultImageHeight,
        ),
      ),
    );
  }

  Widget _buildImageWithHero(
    ImageProvider imageProvider,
    ImageErrorBuilder imageErrorBuilder,
  ) {
    return Hero(
      tag: '${widget.pokemon.id}',
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
      height: widget.size?.height ?? kDefaultImageHeight,
      width: widget.size?.width ?? kDefaultImageHeight,
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
        clipBehavior: widget.clipBehavior,
        borderRadius: _buildBorderRadius(),
        child: SizedBox(
          height: widget.size?.height ?? kDefaultImageHeight,
          width: widget.size?.width ?? kDefaultImageHeight,
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
      gaplessPlayback: true,
    );
  }

  Widget _buildLoadingImage() {
    return Image.asset(
      'assets/images/pokeball_outline.png',
      gaplessPlayback: true,
    );
    // .animate(
    //   onPlay: (controller) => controller.repeat(),
    // )
    // .shimmer(
    //   duration: 1200.ms,
    //   color: const Color(
    //     0xFF80DDFF,
    //   ),
    // );
  }

  BorderRadius _buildBorderRadius() => BorderRadius.circular(180);

  String _createSpriteImageUrl() {
    try {
      final spriteData = jsonDecode(widget.pokemon.pokemon_v2_pokemonsprites.firstOrNull()?.sprites ?? '');
      final sprite = Sprite.fromJson(spriteData);
      return sprite.front_default ?? '';
    } catch (_) {
      return '';
    }
  }
}
