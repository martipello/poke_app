import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'dependency_injection_container.dart' as di;
import 'dependency_injection_container.dart';
import 'firebase_options.dart';
import 'in_app_purchases/view_models/in_app_purchase_view_model.dart';
import 'poke_app.dart';
import 'services/theme_service.dart';
import 'theme/base_theme.dart';
import 'theme/poke_app_theme.dart';

// ignore_for_file: avoid_classes_with_only_static_members
class PokeAppWrapper {
  static void init() async {
    runZonedGuarded<Future<void>>(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        await di.init();
        MobileAds.instance.initialize();
        final requestConfiguration = RequestConfiguration(
            tagForChildDirectedTreatment: TagForChildDirectedTreatment.yes, maxAdContentRating: MaxAdContentRating.g);
        MobileAds.instance.updateRequestConfiguration(
          requestConfiguration,
        );
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
        if (!kIsWeb) {
          FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
          if (kDebugMode) {
            await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
          }
        }
        final themeService = getIt.get<ThemeService>();
        final _inAppPurchaseViewModel = getIt.get<InAppPurchaseViewModel>();
        _inAppPurchaseViewModel.restorePurchases();

        runApp(
          StreamBuilder<bool?>(
            stream: themeService.isDarkModeStream,
            builder: (context, snapshot) {
              final isDarkMode = snapshot.data == true;
              return BaseTheme(
                appTheme: isDarkMode ? pokeAppDarkTheme : pokeAppTheme,
                child: Builder(
                  builder: (context) {
                    return PokeApp(
                      theme: BaseTheme.of(context),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
      (error, stack) => FirebaseCrashlytics.instance.recordError(
        error,
        stack,
        reason: 'Zoned Error',
      ),
    );
  }
}
