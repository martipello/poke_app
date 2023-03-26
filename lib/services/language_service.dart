import 'dart:ui';

import 'package:rxdart/rxdart.dart';
import 'package:universal_io/io.dart';

import 'pokemon_service.dart';
import 'shared_preferences_service.dart';

enum SupportedLanguage {
  france(5, 'france', Locale('fr')),
  german(6, 'german', Locale('ge')),
  spanish(7, 'spanish', Locale('es')),
  italian(8, 'italian', Locale('it')),
  english(9, 'english', Locale('en'));

  const SupportedLanguage(
    this.id,
    this.name,
    this.locale,
  );

  final int id;
  final String name;
  final Locale locale;

  static SupportedLanguage getSupportedLanguageById(
    int id,
  ) {
    switch (id) {
      case 4:
        return SupportedLanguage.france;
      case 6:
        return SupportedLanguage.german;
      case 7:
        return SupportedLanguage.spanish;
      case 8:
        return SupportedLanguage.italian;
      default:
        return SupportedLanguage.english;
    }
  }

  static SupportedLanguage getSupportedLanguageForLocale(
    Locale? locale,
  ) {
    switch (locale?.languageCode) {
      case 'fr':
        return SupportedLanguage.france;
      case 'ge':
        return SupportedLanguage.german;
      case 'es':
        return SupportedLanguage.spanish;
      case 'it':
        return SupportedLanguage.italian;
      default:
        return SupportedLanguage.english;
    }
  }
}

class LanguageService extends PokemonService {
  LanguageService(this.sharedPreferencesService);

  final SharedPreferencesService sharedPreferencesService;

  final languageStream = BehaviorSubject<SupportedLanguage>.seeded(SupportedLanguage.english);
  final tempSelectedLanguageStream = BehaviorSubject<SupportedLanguage>();

  @override
  Future<void> init() async {
    final _languageId = await sharedPreferencesService.getLanguageId();
    if (_languageId != null) {
      languageStream.add(SupportedLanguage.getSupportedLanguageById(_languageId));
    } else {
      final supportedLanguageForDeviceLocale =
          SupportedLanguage.getSupportedLanguageForLocale(Locale(Platform.localeName));
      languageStream.add(SupportedLanguage.getSupportedLanguageById(supportedLanguageForDeviceLocale.id));
    }
  }

  @override
  void dispose() {
    languageStream.close();
    tempSelectedLanguageStream.close();
  }

  SupportedLanguage getLanguageSnapshot() {
    return languageStream.value;
  }

  Future<SupportedLanguage> getLanguage() async {
    final _languageId = await sharedPreferencesService.getLanguageId() ?? SupportedLanguage.english.id;
    return SupportedLanguage.getSupportedLanguageById(_languageId);
  }

  void setLanguage(SupportedLanguage language) {
    sharedPreferencesService.setLanguageId(language);
    languageStream.add(language);
  }

  void setTempLanguage(SupportedLanguage language) {
    tempSelectedLanguageStream.add(language);
  }
}
