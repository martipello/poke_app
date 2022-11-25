import 'package:rxdart/rxdart.dart';

import '../utils/console_output.dart';
import 'pokemon_service.dart';
import 'shared_preferences_service.dart';

class ThemeService extends PokemonService {
  ThemeService(this.sharedPreferencesService);

  final SharedPreferencesService sharedPreferencesService;

  final isDarkModeStream = BehaviorSubject<bool?>();

  @override
  void init() async {
    final _isDarkMode = await isDarkMode();
    isDarkModeStream.add(_isDarkMode);
  }

  @override
  void dispose() {
    isDarkModeStream.close();
  }

  Future<bool> isDarkMode() async {
    return sharedPreferencesService.isDarkMode();
  }

  Future<void> setDarkMode({required bool isDarkMode}) async {
    sharedPreferencesService.setDarkMode(isDarkMode: isDarkMode);
    isDarkModeStream.add(isDarkMode);
  }

}