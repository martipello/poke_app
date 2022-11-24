import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../api/models/pokemon/pokemon.dart';
import '../../api/models/pokemon/sprite.dart';
import '../../dependency_injection_container.dart';
import 'view_models/image_color_view_model.dart';

typedef ImageErrorBuilder = Widget Function(BuildContext context, Object? object, StackTrace? stacktrace);
typedef ImageColorCallback = Function(PaletteGenerator palette);

class PokemonImage extends StatefulWidget {
  const PokemonImage({
    Key? key,
    this.size,
    required this.pokemon,
    this.clipBehavior = Clip.none,
    this.imageColorCallback,
    this.spriteImageColorCallback,
    this.color,
  });

  final Pokemon pokemon;
  final Color? color;
  final ImageColorCallback? imageColorCallback;
  final ImageColorCallback? spriteImageColorCallback;
  final Clip clipBehavior;
  final Size? size;

  @override
  State<PokemonImage> createState() => _PokemonImageState();
}

class _PokemonImageState extends State<PokemonImage> {
  final mainImageColorViewModel = getIt.get<ImageColorViewModel>();
  final secondaryImageColorViewModel = getIt.get<ImageColorViewModel>();

  late final NetworkImage mainImageProvider;
  late final NetworkImage secondaryImageProvider;

  @override
  void initState() {
    super.initState();
    mainImageProvider = NetworkImage(
      _createImageUrl(),
    );
    secondaryImageProvider = NetworkImage(
      _createSpriteImageUrl(),
    );
    mainImageColorViewModel.updatePaletteGenerator(mainImageProvider);
    secondaryImageColorViewModel.updatePaletteGenerator(secondaryImageProvider);
    mainImageColorViewModel.paletteGeneratorStream.listen((value) {
      widget.imageColorCallback?.call(value);
    });
    secondaryImageColorViewModel.paletteGeneratorStream.listen((value) {
      widget.spriteImageColorCallback?.call(value);
    });
  }

  @override
  void dispose() {
    mainImageColorViewModel.dispose();
    secondaryImageColorViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: _buildImageHolder(
        context,
        mainImageProvider,
        mainImageColorViewModel.paletteGeneratorStream,
        (context, _, __) => _buildImageHolder(
          context,
          secondaryImageProvider,
          secondaryImageColorViewModel.paletteGeneratorStream,
          (context, _, __) => _buildEmptyImage(),
        ),
      ),
    );
  }

  Widget _buildImageHolder(
    BuildContext context,
    ImageProvider imageProvider,
    Stream<PaletteGenerator> paletteGeneratorStream,
    ImageErrorBuilder imageErrorBuilder,
  ) {
    return StreamBuilder<PaletteGenerator>(
      stream: paletteGeneratorStream,
      builder: (context, snapshot) {
        final palette = snapshot.data;
        return _buildOuterCircle(
          imageProvider,
          imageErrorBuilder,
          palette,
        );
      },
    );
  }

  Widget _buildOuterCircle(
    ImageProvider<Object> imageProvider,
    ImageErrorBuilder imageErrorBuilder,
    PaletteGenerator? palette,
  ) {
    final dominantColor = palette?.dominantColor?.color;
    final lightVibrantColor = palette?.lightVibrantColor?.color;
    return ClipRRect(
      clipBehavior: widget.clipBehavior,
      borderRadius: _buildBorderRadius(),
      child: Container(
        decoration: BoxDecoration(
          color: widget.color ?? lightVibrantColor,
        ),
        padding: const EdgeInsets.all(6),
        child: Center(
          child: _buildCenterCircle(
            dominantColor,
            imageProvider,
            imageErrorBuilder,
          ),
        ),
      ),
    );
  }

  Widget _buildCenterCircle(
    Color? dominantColor,
    ImageProvider imageProvider,
    ImageErrorBuilder imageErrorBuilder,
  ) {
    return ClipRRect(
      clipBehavior: widget.clipBehavior,
      borderRadius: _buildBorderRadius(),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: widget.color ?? dominantColor,
        ),
        child: _buildImage(
          imageProvider,
          imageErrorBuilder,
        ),
      ),
    );
  }

  Widget _buildImage(
    ImageProvider imageProvider,
    ImageErrorBuilder imageErrorBuilder,
  ) {
    return Hero(
      tag: '${widget.pokemon.id}',
      child: Image(
        image: imageProvider,
        fit: BoxFit.cover,
        gaplessPlayback: true,
        height: widget.size?.height ?? 150,
        width: widget.size?.width ?? 150,
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
      ),
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
          height: widget.size?.height ?? 150,
          width: widget.size?.width ?? 150,
          child: Center(
            child: isLoading ? _buildLoadingImage() : _buildEmptyImage(),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyImage() {
    return Hero(
      tag: 'empty',
      child: Image.asset(
        'assets/images/pokeball_outline.png',
        gaplessPlayback: true,
      ),
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
          color: const Color(
            0xFF80DDFF,
          ),
        );
  }

  BorderRadius _buildBorderRadius() => BorderRadius.circular(180);

  String _createImageUrl() {
    return 'https://firebasestorage.googleapis.com/v0/b/pokeapp-86eec.appspot.com/o/pokemon_image_${widget.pokemon.id}.png?alt=media';
  }

  String _createSpriteImageUrl() {
    final spriteData = jsonDecode(widget.pokemon.pokemon_v2_pokemonsprites.first.sprites ?? '');
    final sprite = Sprite.fromJson(spriteData);
    return sprite.front_default ?? '';
  }
}
