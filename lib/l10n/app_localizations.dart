import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @app_name.
  ///
  /// In en, this message translates to:
  /// **'PokéApp'**
  String get app_name;

  /// No description provided for @pokedex.
  ///
  /// In en, this message translates to:
  /// **'Pokédex'**
  String get pokedex;

  /// No description provided for @pokemon.
  ///
  /// In en, this message translates to:
  /// **'PoKéMoN'**
  String get pokemon;

  /// No description provided for @searchByName.
  ///
  /// In en, this message translates to:
  /// **'Search by name or ID'**
  String get searchByName;

  /// No description provided for @searchByMoveName.
  ///
  /// In en, this message translates to:
  /// **'Search by move name...'**
  String get searchByMoveName;

  /// No description provided for @abilities.
  ///
  /// In en, this message translates to:
  /// **'Abilities'**
  String get abilities;

  /// No description provided for @species.
  ///
  /// In en, this message translates to:
  /// **'Species'**
  String get species;

  /// No description provided for @forms.
  ///
  /// In en, this message translates to:
  /// **'Forms'**
  String get forms;

  /// No description provided for @filters.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filters;

  /// No description provided for @types.
  ///
  /// In en, this message translates to:
  /// **'Types'**
  String get types;

  /// No description provided for @damageTypes.
  ///
  /// In en, this message translates to:
  /// **'Damage types'**
  String get damageTypes;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @submitScore.
  ///
  /// In en, this message translates to:
  /// **'Submit Score'**
  String get submitScore;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @confirmReset.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you would like to reset your wins and losses.'**
  String get confirmReset;

  /// No description provided for @stats.
  ///
  /// In en, this message translates to:
  /// **'Stats'**
  String get stats;

  /// No description provided for @moves.
  ///
  /// In en, this message translates to:
  /// **'Moves'**
  String get moves;

  /// No description provided for @evolutions.
  ///
  /// In en, this message translates to:
  /// **'Evolutions'**
  String get evolutions;

  /// No description provided for @info.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get info;

  /// No description provided for @its.
  ///
  /// In en, this message translates to:
  /// **'It\'s'**
  String get its;

  /// No description provided for @correct.
  ///
  /// In en, this message translates to:
  /// **'Correct'**
  String get correct;

  /// No description provided for @incorrect.
  ///
  /// In en, this message translates to:
  /// **'Incorrect'**
  String get incorrect;

  /// No description provided for @tooBad.
  ///
  /// In en, this message translates to:
  /// **'Too bad!'**
  String get tooBad;

  /// No description provided for @encounters.
  ///
  /// In en, this message translates to:
  /// **'Encounters'**
  String get encounters;

  /// No description provided for @allGenerations.
  ///
  /// In en, this message translates to:
  /// **'All generations'**
  String get allGenerations;

  /// No description provided for @couldntFindMap.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t find map for region.'**
  String get couldntFindMap;

  /// No description provided for @tmTitle.
  ///
  /// In en, this message translates to:
  /// **'TMs'**
  String get tmTitle;

  /// No description provided for @tm.
  ///
  /// In en, this message translates to:
  /// **'TM-{number} '**
  String tm(int number);

  /// No description provided for @shape.
  ///
  /// In en, this message translates to:
  /// **'Shape'**
  String get shape;

  /// No description provided for @habitat.
  ///
  /// In en, this message translates to:
  /// **'Habitat'**
  String get habitat;

  /// No description provided for @color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get color;

  /// No description provided for @heightLabel.
  ///
  /// In en, this message translates to:
  /// **'Height :'**
  String get heightLabel;

  /// No description provided for @weightLabel.
  ///
  /// In en, this message translates to:
  /// **'Weight :'**
  String get weightLabel;

  /// No description provided for @generationLabel.
  ///
  /// In en, this message translates to:
  /// **'Generation :'**
  String get generationLabel;

  /// No description provided for @moveMetaData.
  ///
  /// In en, this message translates to:
  /// **'Move meta data'**
  String get moveMetaData;

  /// No description provided for @questionMark.
  ///
  /// In en, this message translates to:
  /// **'??'**
  String get questionMark;

  /// No description provided for @evolutionMethod.
  ///
  /// In en, this message translates to:
  /// **'Evolution Methods'**
  String get evolutionMethod;

  /// No description provided for @baseHappiness.
  ///
  /// In en, this message translates to:
  /// **'Base happiness'**
  String get baseHappiness;

  /// No description provided for @captureRate.
  ///
  /// In en, this message translates to:
  /// **'Capture rate'**
  String get captureRate;

  /// No description provided for @steps.
  ///
  /// In en, this message translates to:
  /// **'Steps'**
  String get steps;

  /// No description provided for @genderRate.
  ///
  /// In en, this message translates to:
  /// **'Gender rate'**
  String get genderRate;

  /// No description provided for @eggGroup.
  ///
  /// In en, this message translates to:
  /// **'Egg group'**
  String get eggGroup;

  /// No description provided for @hatchCounter.
  ///
  /// In en, this message translates to:
  /// **'Hatch counter'**
  String get hatchCounter;

  /// No description provided for @legendary.
  ///
  /// In en, this message translates to:
  /// **'Legendary'**
  String get legendary;

  /// No description provided for @mythical.
  ///
  /// In en, this message translates to:
  /// **'Mythical'**
  String get mythical;

  /// No description provided for @baby.
  ///
  /// In en, this message translates to:
  /// **'Baby'**
  String get baby;

  /// No description provided for @generation.
  ///
  /// In en, this message translates to:
  /// **'Generation :'**
  String get generation;

  /// No description provided for @unknownPokemon.
  ///
  /// In en, this message translates to:
  /// **'Unknown Pokemon'**
  String get unknownPokemon;

  /// No description provided for @unknownVersion.
  ///
  /// In en, this message translates to:
  /// **'Unknown Version'**
  String get unknownVersion;

  /// No description provided for @effect.
  ///
  /// In en, this message translates to:
  /// **'Effect'**
  String get effect;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @mainSeries.
  ///
  /// In en, this message translates to:
  /// **'Main series'**
  String get mainSeries;

  /// No description provided for @hidden.
  ///
  /// In en, this message translates to:
  /// **'(Hidden)'**
  String get hidden;

  /// No description provided for @baseStats.
  ///
  /// In en, this message translates to:
  /// **'Base stats'**
  String get baseStats;

  /// No description provided for @physicalStatLabel.
  ///
  /// In en, this message translates to:
  /// **'Physical stat :'**
  String get physicalStatLabel;

  /// No description provided for @timeOfDayLabel.
  ///
  /// In en, this message translates to:
  /// **'Time of day :'**
  String get timeOfDayLabel;

  /// No description provided for @turnUpsideDownLabel.
  ///
  /// In en, this message translates to:
  /// **'Turn upside down :'**
  String get turnUpsideDownLabel;

  /// No description provided for @genderIdLabel.
  ///
  /// In en, this message translates to:
  /// **'Gender id :'**
  String get genderIdLabel;

  /// No description provided for @tradeSpeciesIdLabel.
  ///
  /// In en, this message translates to:
  /// **'Trade species id :'**
  String get tradeSpeciesIdLabel;

  /// No description provided for @heldItemLabel.
  ///
  /// In en, this message translates to:
  /// **'Held item :'**
  String get heldItemLabel;

  /// No description provided for @knownMoveTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Known move type :'**
  String get knownMoveTypeLabel;

  /// No description provided for @knownMoveIdLabel.
  ///
  /// In en, this message translates to:
  /// **'Known move id :'**
  String get knownMoveIdLabel;

  /// No description provided for @affectionLabel.
  ///
  /// In en, this message translates to:
  /// **'Affection :'**
  String get affectionLabel;

  /// No description provided for @beautyLabel.
  ///
  /// In en, this message translates to:
  /// **'Beauty :'**
  String get beautyLabel;

  /// No description provided for @happinessLabel.
  ///
  /// In en, this message translates to:
  /// **'Happiness :'**
  String get happinessLabel;

  /// No description provided for @levelLabel.
  ///
  /// In en, this message translates to:
  /// **'Level :'**
  String get levelLabel;

  /// No description provided for @itemLabel.
  ///
  /// In en, this message translates to:
  /// **'Item :'**
  String get itemLabel;

  /// No description provided for @locationLabel.
  ///
  /// In en, this message translates to:
  /// **'Location :'**
  String get locationLabel;

  /// No description provided for @openLocationButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Open location'**
  String get openLocationButtonLabel;

  /// No description provided for @trueLabel.
  ///
  /// In en, this message translates to:
  /// **'true'**
  String get trueLabel;

  /// No description provided for @power.
  ///
  /// In en, this message translates to:
  /// **'Power :'**
  String get power;

  /// No description provided for @accuracy.
  ///
  /// In en, this message translates to:
  /// **'Accuracy :'**
  String get accuracy;

  /// No description provided for @pp.
  ///
  /// In en, this message translates to:
  /// **'PP :'**
  String get pp;

  /// No description provided for @noDescription.
  ///
  /// In en, this message translates to:
  /// **'No description.'**
  String get noDescription;

  /// No description provided for @moveDetails.
  ///
  /// In en, this message translates to:
  /// **'Move Details'**
  String get moveDetails;

  /// No description provided for @learningMethods.
  ///
  /// In en, this message translates to:
  /// **'Learning Methods'**
  String get learningMethods;

  /// No description provided for @ailment.
  ///
  /// In en, this message translates to:
  /// **'Ailment name :'**
  String get ailment;

  /// No description provided for @criticalRate.
  ///
  /// In en, this message translates to:
  /// **'Critical :'**
  String get criticalRate;

  /// No description provided for @healing.
  ///
  /// In en, this message translates to:
  /// **'Healing :'**
  String get healing;

  /// No description provided for @ailmentChance.
  ///
  /// In en, this message translates to:
  /// **'Ailment :'**
  String get ailmentChance;

  /// No description provided for @flinchChance.
  ///
  /// In en, this message translates to:
  /// **'Flinch :'**
  String get flinchChance;

  /// No description provided for @statChance.
  ///
  /// In en, this message translates to:
  /// **'Stat change :'**
  String get statChance;

  /// No description provided for @drain.
  ///
  /// In en, this message translates to:
  /// **'Drain :'**
  String get drain;

  /// No description provided for @minHits.
  ///
  /// In en, this message translates to:
  /// **'Min hits :'**
  String get minHits;

  /// No description provided for @maxHits.
  ///
  /// In en, this message translates to:
  /// **'Max hits :'**
  String get maxHits;

  /// No description provided for @minTurns.
  ///
  /// In en, this message translates to:
  /// **'Min turns :'**
  String get minTurns;

  /// No description provided for @maxTurns.
  ///
  /// In en, this message translates to:
  /// **'Max turns :'**
  String get maxTurns;

  /// No description provided for @minLevel.
  ///
  /// In en, this message translates to:
  /// **'Min level :'**
  String get minLevel;

  /// No description provided for @maxLevel.
  ///
  /// In en, this message translates to:
  /// **'Max level :'**
  String get maxLevel;

  /// No description provided for @rarity.
  ///
  /// In en, this message translates to:
  /// **'Rarity'**
  String get rarity;

  /// No description provided for @method.
  ///
  /// In en, this message translates to:
  /// **'Method'**
  String get method;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @megaForm.
  ///
  /// In en, this message translates to:
  /// **'Mega'**
  String get megaForm;

  /// No description provided for @defaultForm.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get defaultForm;

  /// No description provided for @battleOnlyForm.
  ///
  /// In en, this message translates to:
  /// **'Battle only'**
  String get battleOnlyForm;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @typeEffectiveness.
  ///
  /// In en, this message translates to:
  /// **'Type Effectiveness'**
  String get typeEffectiveness;

  /// No description provided for @error_getting_page.
  ///
  /// In en, this message translates to:
  /// **'Error getting new page...'**
  String get error_getting_page;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @thanks.
  ///
  /// In en, this message translates to:
  /// **'Thanks for using the PokéApp, this app is not affiliated with the Pokémon company.'**
  String get thanks;

  /// No description provided for @fairUse.
  ///
  /// In en, this message translates to:
  /// **'Fair Use'**
  String get fairUse;

  /// No description provided for @fairUseDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Fair Use Disclaimer. We may use copyrighted material which has not always been specifically authorized by the copyright owner. The company is making such material available for criticism, comment, news reporting, teaching, scholarship or research. The company believes this constitutes a \'fair use\' of any such copyrighted as provided for in section 107 of the United States Copyright law. If you wish to use copyrighted material from the service for your own purposes that go beyond fair use you must obtain permission from the copyright owner.'**
  String get fairUseDisclaimer;

  /// No description provided for @licences.
  ///
  /// In en, this message translates to:
  /// **'Licences'**
  String get licences;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @sendFeedback.
  ///
  /// In en, this message translates to:
  /// **'Send feedback'**
  String get sendFeedback;

  /// No description provided for @feedbackLabel.
  ///
  /// In en, this message translates to:
  /// **'Report issues or suggest new features'**
  String get feedbackLabel;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @clearFilters.
  ///
  /// In en, this message translates to:
  /// **'Clear filters'**
  String get clearFilters;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Please select a language'**
  String get selectLanguage;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @premium.
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get premium;

  /// No description provided for @review.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @shareWithFriends.
  ///
  /// In en, this message translates to:
  /// **'Share with friends'**
  String get shareWithFriends;

  /// No description provided for @shareLabel.
  ///
  /// In en, this message translates to:
  /// **'Check out the PokéApp : https://play.google.com/store/apps/details?id=com.sealstudios.pokeapp.prod&gl=GB'**
  String get shareLabel;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @emptyMessage.
  ///
  /// In en, this message translates to:
  /// **'No Results, you can swipe down to refresh.'**
  String get emptyMessage;

  /// No description provided for @errorMessage.
  ///
  /// In en, this message translates to:
  /// **'Oops that\'s an error...'**
  String get errorMessage;

  /// No description provided for @weaknessLabel.
  ///
  /// In en, this message translates to:
  /// **'Weakness to :'**
  String get weaknessLabel;

  /// No description provided for @resistantLabel.
  ///
  /// In en, this message translates to:
  /// **'Resistant to :'**
  String get resistantLabel;

  /// No description provided for @neutralLabel.
  ///
  /// In en, this message translates to:
  /// **'Neutral to :'**
  String get neutralLabel;

  /// No description provided for @unknownDamageLabel.
  ///
  /// In en, this message translates to:
  /// **'Unknown damage'**
  String get unknownDamageLabel;

  /// No description provided for @normalDamageLabel.
  ///
  /// In en, this message translates to:
  /// **'Normal damage :'**
  String get normalDamageLabel;

  /// No description provided for @whoDatPokemon.
  ///
  /// In en, this message translates to:
  /// **'Who\'s that PoKéMoN?'**
  String get whoDatPokemon;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
