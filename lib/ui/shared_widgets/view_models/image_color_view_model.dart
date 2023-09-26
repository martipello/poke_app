import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../services/shared_preferences_service.dart';

class ImageColorViewModel {
  ImageColorViewModel(this.sharedPreferencesService);

  final SharedPreferencesService sharedPreferencesService;

  final colorSchemeStream = BehaviorSubject<ColorScheme?>();

  Future<void> colorScheme(
    CachedNetworkImageProvider imageProvider,
  ) async {
    final isDarkMode = await sharedPreferencesService.isDarkMode();
    final colorScheme = await ColorScheme.fromImageProvider(
      provider: imageProvider,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
    );
    colorSchemeStream.add(colorScheme);
  }

  void dispose() {
    colorSchemeStream.close();
  }
}
