import 'dart:io';

import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../dependency_injection_container.dart';
import '../../extensions/build_context_extension.dart';
import '../../extensions/string_extension.dart';
import '../../services/language_service.dart';
import '../../services/theme_service.dart';
import '../../theme/base_theme.dart';
import '../../theme/poke_app_text.dart';
import 'about.dart';

class Settings extends StatelessWidget {
  Settings({Key? key}) : super(key: key);

  static const String routeName = '/settings';

  final _languageService = getIt.get<LanguageService>();
  final _themeService = getIt.get<ThemeService>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SupportedLanguage>(
      initialData: SupportedLanguage.english,
      stream: _languageService.languageStream,
      builder: (context, languageSnapshot) {
        return StreamBuilder<bool?>(
          stream: _themeService.isDarkModeStream,
          builder: (context, isDarkModeSnapshot) {
            final _language = languageSnapshot.data;
            final _isDarkMode = isDarkModeSnapshot.data == true;
            return Scaffold(
              appBar: _buildSettingsAppBar(context),
              body: SettingsList(
                sections: [
                  SettingsSection(
                    tiles: <SettingsTile>[
                      _buildLanguageSettingsTile(
                        context,
                        _language,
                      ),
                      _buildDarkModeSettingsTile(
                        context,
                        _isDarkMode,
                      ),
                      _buildReviewSettingsTile(context),
                      _buildShareSettingsTile(context),
                      _buildFeedbackSettingsTile(context),
                      _buildAboutSettingsTile(context),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  AppBar _buildSettingsAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: Text(
        context.strings.settings,
        style: PokeAppText.subtitle2Style.copyWith(
          height: 1,
        ),
      ),
      leading: IconButton(
        icon: Icon(
          Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
          color: colors(context).textOnPrimary,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  SettingsTile _buildLanguageSettingsTile(
    BuildContext context,
    SupportedLanguage? _currentlySelectedLanguage,
  ) {
    return SettingsTile.navigation(
      leading: const Icon(
        Icons.language,
      ),
      title: Text(
        context.strings.language,
      ),
      value: Text(
        _currentlySelectedLanguage!.name.capitalize(),
      ),
      onPressed: (_) {
        _showSelectLanguageDialog(
          context,
          _currentlySelectedLanguage,
        );
      },
    );
  }

  Future<void> _showSelectLanguageDialog(
    BuildContext context,
    SupportedLanguage _currentlySelectedLanguage,
  ) {
    return showDialog(
      context: context,
      builder: (context) {
        return StreamBuilder<SupportedLanguage>(
          initialData: _currentlySelectedLanguage,
          stream: _languageService.tempSelectedLanguageStream,
          builder: (context, snapshot) {
            final _tempSelectedLanguage = snapshot.data ?? _currentlySelectedLanguage;
            return _buildSelectLanguageAlertDialog(
              context,
              _tempSelectedLanguage,
            );
          },
        );
      },
    );
  }

  Widget _buildSelectLanguageAlertDialog(
    BuildContext context,
    SupportedLanguage _tempSelectedLanguage,
  ) {
    return AlertDialog(
      title: _buildSelectLanguageAlertDialogTitle(context),
      actionsPadding: const EdgeInsets.only(
        right: 16,
        bottom: 8,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSelectLanguageAlertDialogSubtitle(context),
          ...SupportedLanguage.values.reversed.whereType<SupportedLanguage>().map(
                (language) => _buildSelectedLanguageAlertDialogRadioTile(
                  context,
                  language,
                  _tempSelectedLanguage,
                ),
              ),
        ],
      ),
      actions: [
        _buildSelectLanguageAlertDialogAction(
          context,
          'Cancel',
          null,
        ),
        _buildSelectLanguageAlertDialogAction(
          context,
          'Ok',
          () {
            _languageService.setLanguage(_tempSelectedLanguage);
          },
        ),
      ],
    );
  }

  Widget _buildSelectLanguageAlertDialogTitle(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Text(
        context.strings.language,
        style: PokeAppText.subtitle1Style.copyWith(
          color: colors(context).textOnForeground,
          height: 1,
        ),
      ),
    );
  }

  Widget _buildSelectLanguageAlertDialogSubtitle(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        context.strings.selectLanguage,
        style: PokeAppText.body4Style.copyWith(
          color: colors(context).textOnForeground,
        ),
      ),
    );
  }

  RadioListTile<SupportedLanguage> _buildSelectedLanguageAlertDialogRadioTile(
    BuildContext context,
    SupportedLanguage language,
    SupportedLanguage _tempSelectedLanguage,
  ) {
    return RadioListTile(
      value: language,
      groupValue: _tempSelectedLanguage,
      selected: language == _tempSelectedLanguage,
      title: Text(
        language.name.capitalize(),
        style: PokeAppText.body4Style.copyWith(
          color: colors(context).textOnForeground,
        ),
      ),
      onChanged: (_) {
        _languageService.tempSelectedLanguageStream.add(
          language,
        );
      },
      contentPadding: EdgeInsets.zero,
    );
  }

  Widget _buildSelectLanguageAlertDialogAction(
    BuildContext context,
    String label,
    VoidCallback? onTap,
  ) {
    return TextButton(
      onPressed: () {
        onTap?.call();
        Navigator.of(context).pop();
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 16,
          ),
        ),
      ),
      child: Text(
        label,
        style: PokeAppText.body4Style.copyWith(
          color: colors(context).textOnForeground,
        ),
      ),
    );
  }

  SettingsTile _buildDarkModeSettingsTile(
    BuildContext context,
    bool _isDarkMode,
  ) {
    return SettingsTile.switchTile(
      leading: const Icon(
        Icons.dark_mode,
      ),
      initialValue: _isDarkMode,
      onToggle: (toggle) {
        _themeService.setDarkMode(
          isDarkMode: toggle,
        );
      },
      title: Text(
        context.strings.darkMode,
      ),
    );
  }

  SettingsTile _buildReviewSettingsTile(
    BuildContext context,
  ) {
    return SettingsTile.navigation(
      leading: const Icon(
        Icons.star,
      ),
      title: Text(
        context.strings.review,
      ),
    );
  }

  SettingsTile _buildShareSettingsTile(
    BuildContext context,
  ) {
    return SettingsTile.navigation(
      leading: const Icon(
        Icons.share,
      ),
      title: Text(
        context.strings.share,
      ),
      description: Text(
        context.strings.shareWithFriends,
      ),
    );
  }

  SettingsTile _buildFeedbackSettingsTile(
    BuildContext context,
  ) {
    return SettingsTile.navigation(
      leading: const Icon(
        Icons.star,
      ),
      title: Text(
        context.strings.sendFeedback,
      ),
      description: const Text(
        'Report issues or suggest new features',
      ),
    );
  }

  SettingsTile _buildAboutSettingsTile(
    BuildContext context,
  ) {
    return SettingsTile.navigation(
      leading: const Icon(
        Icons.info_outline,
      ),
      title: Text(
        context.strings.about,
      ),
      onPressed: (context) {
        Navigator.of(context).pushNamed(About.routeName);
      },
    );
  }
}
