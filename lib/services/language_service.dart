import 'package:rxdart/rxdart.dart';

import 'pokemon_service.dart';
import 'shared_preferences_service.dart';

enum SupportedLanguage {
  france(4, 'france'),
  german(6, 'german'),
  spanish(7, 'spanish'),
  italian(8, 'italian'),
  english(9, 'english');


  const SupportedLanguage(this.id,
      this.name,);

  final int id;
  final String name;

  static SupportedLanguage getSupportedLanguageById(int id) {
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

}

class LanguageService extends PokemonService {
  LanguageService(this.sharedPreferencesService);

  final SharedPreferencesService sharedPreferencesService;

  final languageStream = BehaviorSubject<SupportedLanguage>.seeded(SupportedLanguage.english);

  @override
  void init() async {
    final _languageId = await sharedPreferencesService.getLanguageId();
    languageStream.add(SupportedLanguage.getSupportedLanguageById(_languageId));
  }

  @override
  void dispose() {
    languageStream.close();
  }


  SupportedLanguage getLanguageSnapshot() {
    return languageStream.value;
  }

  Future<void> setLanguage(SupportedLanguage language) async {
    sharedPreferencesService.setLanguageId(language);
    languageStream.add(language);
  }
}
