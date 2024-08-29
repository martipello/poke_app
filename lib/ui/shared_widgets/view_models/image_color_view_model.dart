import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../services/shared_preferences_service.dart';

class ImageColorViewModel {
  ImageColorViewModel(this.sharedPreferencesService);

  final SharedPreferencesService sharedPreferencesService;

  // Future<ColorScheme> colorScheme(
  //   CachedNetworkImageProvider imageProvider,
  // ) async {
  //   final isDarkMode = await sharedPreferencesService.isDarkMode();
  //   return ColorScheme.fromImageProvider(
  //     provider: imageProvider,
  //     brightness: isDarkMode ? Brightness.dark : Brightness.light,
  //   );
  // }

  Future<({Color? primaryColor, Color? secondaryColor})> palette(
    CachedNetworkImageProvider imageProvider,
  ) async {
    final palette = await PaletteGenerator.fromImageProvider(imageProvider, maximumColorCount: 8);
    return (primaryColor : palette.colors.firstOrNull, secondaryColor : palette.colors.lastOrNull);
  }
}
