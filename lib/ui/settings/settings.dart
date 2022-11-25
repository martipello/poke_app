import 'dart:io';

import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../dependency_injection_container.dart';
import '../../extensions/build_context_extension.dart';
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
    SupportedLanguage? _language,
  ) {
    return SettingsTile.navigation(
      leading: const Icon(
        Icons.language,
      ),
      title: Text(
        context.strings.language,
      ),
      value: Text(
        _language!.name,
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
