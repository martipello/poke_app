import 'package:shared_preferences/shared_preferences.dart';

import '../dependency_injection_container.dart';
import 'language_service.dart';
import 'pokemon_service.dart';

const kLanguage = 'SELECTED_LANGUAGE';
const kDarkMode = 'DARK_MODE';

class SharedPreferencesService extends PokemonService {

  final _sharedPreferences = getIt.getAsync<SharedPreferences>();


  Future<SharedPreferences> sharedPreferences() {
    return _sharedPreferences;
  }

  Future<int> getLanguageId() async {
    final sharedPreferences = await _sharedPreferences;
    return sharedPreferences.getInt(kLanguage) ?? SupportedLanguage.english.id;
  }

  Future<void> setLanguageId(SupportedLanguage language) async {
    final sharedPreferences = await _sharedPreferences;
    sharedPreferences.setInt(kLanguage, language.id);
  }

  Future<bool> isDarkMode() async {
    final sharedPreferences = await _sharedPreferences;
    return sharedPreferences.getBool(kDarkMode) ?? false;
  }

  Future<void> setDarkMode({required bool isDarkMode}) async {
    final sharedPreferences = await _sharedPreferences;
    sharedPreferences.setBool(kDarkMode, isDarkMode);
  }

  @override
  void dispose() {
  }

  @override
  void init() {
  }


}
