import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:share_plus/share_plus.dart';

import '../../dependency_injection_container.dart';
import '../../extensions/build_context_extension.dart';
import '../../extensions/string_extension.dart';
import '../../in_app_purchases/view_models/in_app_purchase_view_model.dart';
import '../../services/language_service.dart';
import '../../services/launch_service.dart';
import '../../services/theme_service.dart';
import '../../theme/poke_app_text.dart';
import '../../utils/constants.dart';
import '../shared_widgets/poke_dialog.dart';
import 'about.dart';

class Settings extends StatelessWidget {
  Settings({Key? key}) : super(key: key);

  static const String routeName = '/settings';

  final _languageService = getIt.get<LanguageService>();
  final _themeService = getIt.get<ThemeService>();
  final _launchService = getIt.get<LaunchService>();

  final _inAppPurchaseViewModel = getIt.get<InAppPurchaseViewModel>();

  @override
  Widget build(BuildContext context) {
    return _buildPurchaseState();
  }

  Widget _buildPurchaseState() {
    return FutureBuilder<ProductDetailsResponse?>(
      future: _inAppPurchaseViewModel.productDetailsResponse(),
      builder: (context, productResponse) {
        final products = productResponse.data;
        return _buildSelectedLanguageState(
          products,
        );
      },
    );
  }

  StreamBuilder<SupportedLanguage> _buildSelectedLanguageState(
    ProductDetailsResponse? products,
  ) {
    return StreamBuilder<SupportedLanguage>(
      initialData: SupportedLanguage.english,
      stream: _languageService.languageStream,
      builder: (context, languageSnapshot) {
        final _language = languageSnapshot.data;
        return _buildThemeState(
          _language,
          products,
        );
      },
    );
  }

  StreamBuilder<bool?> _buildThemeState(
    SupportedLanguage? _language,
    ProductDetailsResponse? products,
  ) {
    return StreamBuilder<bool?>(
      stream: _themeService.isDarkModeStream,
      builder: (context, isDarkModeSnapshot) {
        final _isDarkMode = isDarkModeSnapshot.data == true;
        return _buildSettingsScaffold(
          context,
          _language,
          _isDarkMode,
          products,
        );
      },
    );
  }

  Widget _buildSettingsScaffold(
    BuildContext context,
    SupportedLanguage? _language,
    bool _isDarkMode,
    ProductDetailsResponse? products,
  ) {
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
              ...products?.productDetails
                      .map(
                        (product) => _buildInAppPurchase(
                          context,
                          product,
                        ),
                      )
                      .toList() ??
                  [],
              _buildReviewSettingsTile(context),
              _buildShareSettingsTile(context),
              _buildFeedbackSettingsTile(context),
              _buildAboutSettingsTile(context),
            ],
          ),
        ],
      ),
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
          (!kIsWeb && Platform.isIOS) ? Icons.arrow_back_ios : Icons.arrow_back,
          color: context.colors.onSurface,
        ),
        onPressed: () {
          context.pop();
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
    return PokeDialog(
      title: context.strings.language,
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
      dialogActions: [
        _buildSelectLanguageAlertDialogAction(
          context,
          context.strings.cancel,
          null,
        ),
        _buildSelectLanguageAlertDialogAction(
          context,
          context.strings.ok,
          () {
            _languageService.setLanguage(_tempSelectedLanguage);
          },
        ),
      ],
    );
  }

  Widget _buildSelectLanguageAlertDialogSubtitle(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Text(
        context.strings.selectLanguage,
        style: PokeAppText.body3Style,
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
        style: PokeAppText.body4Style,
      ),
      onChanged: (_) {
        _languageService.tempSelectedLanguageStream.add(
          language,
        );
      },
      contentPadding: EdgeInsets.zero,
    );
  }

  DialogAction _buildSelectLanguageAlertDialogAction(
    BuildContext context,
    String label,
    VoidCallback? onTap,
  ) {
    return DialogAction(
      actionText: label,
      actionVoidCallback: () {
        onTap?.call();
        context.pop();
      },
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

  SettingsTile _buildInAppPurchase(
    BuildContext context,
    ProductDetails productDetail,
  ) {
    final _hasPurchasedPremium = _inAppPurchaseViewModel.hasPurchasedPremium;
    return SettingsTile.switchTile(
      leading: const Icon(
        Icons.monetization_on,
      ),
      initialValue: _hasPurchasedPremium,
      onToggle: (toggle) {
        if (!_hasPurchasedPremium) {
          _inAppPurchaseViewModel.buyPremium(productDetail);
        }
      },
      title: Text(
        context.strings.premium,
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
      onPressed: (_) {
        final inAppReview = InAppReview.instance;
        //TODO fix this for iOS
        inAppReview
            .openStoreListing(
              appStoreId: '...',
            )
            .onError(
              (error, stackTrace) => _launchService.launchSnackBar(
                context,
                error.toString(),
              ),
            );
      },
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
      onPressed: (_) async {
        final shareResult = await SharePlus.instance.share(
          ShareParams(text: context.strings.shareLabel),
        );
        if(shareResult == ShareResult.unavailable) {
          _launchService.launchSnackBar(
            context,
            'Share failed, please try again.',
          );
        }
      },
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
      description: Text(
        context.strings.feedbackLabel,
      ),
      onPressed: (_) {
        _launchService.launchEvent(
          context,
          Constants.kAppError.toEmailUri(
            queryParameters: {
              'subject': 'Feedback',
              'body': '',
            },
          ),
        );
      },
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
        context.push(About.routeName);
      },
    );
  }
}
