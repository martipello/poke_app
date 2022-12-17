import 'package:flutter/material.dart';
import 'package:flutter_animate/animate.dart';
import 'package:flutter_animate/effects/effects.dart';
import 'package:flutter_animate/extensions/extensions.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../api/models/pokemon/pokemon.dart';
import '../../dependency_injection_container.dart';
import '../../theme/base_theme.dart';
import 'pokemon_sprite_image.dart';
import 'view_models/image_color_view_model.dart';

typedef ImageErrorBuilder = Widget Function(BuildContext context, Object? object, StackTrace? stacktrace);
typedef ImageColorCallback = Function(PaletteGenerator palette);

const kDefaultImageHeight = 150.0;

class PokemonImage extends StatefulWidget {
  const PokemonImage({
    Key? key,
    this.size,
    required this.pokemon,
    this.clipBehavior = Clip.none,
    this.imageColorCallback,
    this.color,
    this.forceSpriteImage,
  });

  final Pokemon pokemon;
  final Color? color;
  final ImageColorCallback? imageColorCallback;
  final Clip clipBehavior;
  final Size? size;
  final bool? forceSpriteImage;

  @override
  State<PokemonImage> createState() => _PokemonImageState();
}

class _PokemonImageState extends State<PokemonImage> {
  final mainImageColorViewModel = getIt.get<ImageColorViewModel>();

  late final NetworkImage mainImageProvider;

  @override
  void initState() {
    super.initState();
    mainImageProvider = NetworkImage(
      _createImageUrl(),
    );
    mainImageColorViewModel.updatePalette(mainImageProvider);
    mainImageColorViewModel.paletteGeneratorStream.listen((value) {
      widget.imageColorCallback?.call(value);
    });
  }

  @override
  void dispose() {
    mainImageColorViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: _buildImageHolder(
        context,
        true,
        mainImageProvider,
        mainImageColorViewModel.paletteGeneratorStream,
        (context, _, __) => PokemonSpriteImage(
          pokemon: widget.pokemon,
          spriteImageColorCallback: widget.imageColorCallback,
          size: widget.size,
          color: widget.color,
          clipBehavior: widget.clipBehavior,
        ),
      ),
    );
  }

  Widget _buildImageHolder(
    BuildContext context,
    bool buildHeroWidget,
    ImageProvider imageProvider,
    Stream<PaletteGenerator> paletteGeneratorStream,
    ImageErrorBuilder imageErrorBuilder,
  ) {
    return StreamBuilder<PaletteGenerator>(
      stream: paletteGeneratorStream,
      builder: (context, snapshot) {
        final palette = snapshot.data;
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
    PaletteGenerator? palette,
  ) {
    final dominantColor = palette?.dominantColor?.color;
    final lightVibrantColor = palette?.lightVibrantColor?.color;
    return ClipRRect(
      clipBehavior: widget.clipBehavior,
      borderRadius: _buildBorderRadius(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: widget.color ?? lightVibrantColor,
        ),
        padding: const EdgeInsets.all(6),
        child: Center(
          child: _buildCenterCircle(
            dominantColor,
          ),
        ),
      ),
    );
  }

  Widget _buildCenterCircle(
    Color? dominantColor,
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
    )
    .animate(
      onPlay: (controller) => controller.repeat(),
    )
    .shimmer(
      duration: 1200.ms,
      color: colors(context).textOnForeground,
    );
  }

  BorderRadius _buildBorderRadius() => BorderRadius.circular(180);

  String _createImageUrl() {
    if (widget.forceSpriteImage == true) {
      return '';
    }
    return 'https://firebasestorage.googleapis.com/v0/b/pokeapp-86eec.appspot.com/o/pokemon_image_${widget.pokemon.id}.png?alt=media';
  }

}
