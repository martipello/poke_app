import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../services/pokemon_service.dart';
import '../services/shared_preferences_service.dart';

class ThemeViewModel extends PokemonService {
  ThemeViewModel(this.sharedPreferencesService);

  final SharedPreferencesService sharedPreferencesService;

  final themeMode = BehaviorSubject<ThemeMode?>();

  Future<void> init() async {
    final isDarkMode = await sharedPreferencesService.isDarkMode();
    themeMode.add(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }

  @override
  void dispose() {
    themeMode.close();
  }

  Future<bool> isDarkMode() async {
    return sharedPreferencesService.isDarkMode();
  }

  Future<void> setDarkMode(ThemeMode themeMode) async {
    sharedPreferencesService.setDarkMode(isDarkMode: themeMode == ThemeMode.dark);
    this.themeMode.add(themeMode);
  }
}
