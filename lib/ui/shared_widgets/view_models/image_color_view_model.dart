import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../services/shared_preferences_service.dart';

class ImageColorViewModel {
  ImageColorViewModel(this.sharedPreferencesService);

  final SharedPreferencesService sharedPreferencesService;

  Future<ColorScheme> colorScheme(
    CachedNetworkImageProvider imageProvider,
  ) async {
    final isDarkMode = await sharedPreferencesService.isDarkMode();
    return ColorScheme.fromImageProvider(
      provider: imageProvider,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
    );
  }
}
