import 'package:shared_preferences/shared_preferences.dart';

import '../dependency_injection_container.dart';
import 'language_service.dart';
import 'pokemon_service.dart';

const kLanguage = 'SELECTED_LANGUAGE';
const kWinsScore = 'WINS_SCORE';
const kLossesScore = 'LOSSES_SCORE';
const kSkipsScore = 'SKIPS_SCORE';
const kDarkMode = 'DARK_MODE';
const kAudioMuted = 'AUDIO_MUTED';

class SharedPreferencesService extends PokemonService {
  final _sharedPreferences = getIt.getAsync<SharedPreferences>();

  Future<SharedPreferences> sharedPreferences() {
    return _sharedPreferences;
  }

  Future<int?> getLanguageId() async {
    final sharedPreferences = await _sharedPreferences;
    return sharedPreferences.getInt(kLanguage);
  }

  Future<void> setLanguageId(SupportedLanguage language) async {
    final sharedPreferences = await _sharedPreferences;
    sharedPreferences.setInt(kLanguage, language.id);
  }

  Future<int?> getWinsScore() async {
    final sharedPreferences = await _sharedPreferences;
    return sharedPreferences.getInt(kWinsScore);
  }

  Future<void> setWinsScore(int score) async {
    final sharedPreferences = await _sharedPreferences;
    sharedPreferences.setInt(kWinsScore, score);
  }

  Future<int?> getLossesScore() async {
    final sharedPreferences = await _sharedPreferences;
    return sharedPreferences.getInt(kLossesScore);
  }

  Future<void> setLossesScore(int score) async {
    final sharedPreferences = await _sharedPreferences;
    sharedPreferences.setInt(kLossesScore, score);
  }

  Future<int?> getSkipsScore() async {
    final sharedPreferences = await _sharedPreferences;
    return sharedPreferences.getInt(kSkipsScore);
  }

  Future<void> setSkipsScore(int score) async {
    final sharedPreferences = await _sharedPreferences;
    sharedPreferences.setInt(kSkipsScore, score);
  }

  Future<bool> isDarkMode() async {
    final sharedPreferences = await _sharedPreferences;
    return sharedPreferences.getBool(kDarkMode) ?? false;
  }

  Future<void> setDarkMode({required bool isDarkMode}) async {
    final sharedPreferences = await _sharedPreferences;
    sharedPreferences.setBool(kDarkMode, isDarkMode);
  }

  Future<bool> isAudioMuted() async {
    final sharedPreferences = await _sharedPreferences;
    return sharedPreferences.getBool(kAudioMuted) ?? false;
  }

  Future<void> setAudioMuted({required bool isAudioMuted}) async {
    final sharedPreferences = await _sharedPreferences;
    sharedPreferences.setBool(kAudioMuted, isAudioMuted);
  }

  @override
  void dispose() {}

  @override
  void init() {}
}
