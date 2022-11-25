import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  static const String routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return SettingsList(
      sections: [
        SettingsSection(
          title: Text(
            'Common',
          ),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: Icon(
                Icons.language,
              ),
              title: Text(
                'Language',
              ),
              value: Text(
                'English',
              ),
            ),
            SettingsTile.switchTile(
              leading: Icon(
                Icons.dark_mode,
              ),
              initialValue: false,
              onToggle: (toggle) {},
              title: Text(
                'Dark Mode',
              ),
            ),
            SettingsTile.navigation(
              leading: Icon(
                Icons.star,
              ),
              title: Text(
                'Review',
              ),
            ),
            SettingsTile.navigation(
              leading: Icon(
                Icons.share,
              ),
              title: Text(
                'Share',
              ),
              description: Text(
                'Share with friends',
              ),
            ),
            SettingsTile.navigation(
              leading: Icon(
                Icons.star,
              ),
              title: Text(
                'Send feedback',
              ),
              description: Text(
                'Report issues or suggest new features',
              ),
            ),
            SettingsTile.navigation(
              leading: Icon(
                Icons.info_outline,
              ),
              title: Text(
                'About',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
