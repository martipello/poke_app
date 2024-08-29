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
import 'utils/console_output.dart';

// ignore_for_file: avoid_classes_with_only_static_members
class PokeAppWrapper {
  static void init() async {
    runZonedGuarded<Future<void>>(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
        await di.init();
        if (!kIsWeb) {
          await initAds();
          FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
          if (kDebugMode) {
            await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
          }
          final _inAppPurchaseViewModel = getIt.get<InAppPurchaseViewModel>();
          await _inAppPurchaseViewModel.restorePurchases();
        }

        runApp(const PokeApp());
      },
      (error, stack) {
        if(kIsWeb) {
          log('Zoned Error').e('Error: $error\nStack: $stack');
        } else {
          FirebaseCrashlytics.instance.recordError(
            error,
            stack,
            reason: 'Zoned Error',
          );
        }
      }
    );
  }
}

Future<void> initAds() async {
  await MobileAds.instance.initialize();
  final requestConfiguration = RequestConfiguration(
    testDeviceIds: [
      '992DEA92BE3FB29E0B8D6646B55BBA4F',//PIXEL 6 PRO
    ],
    tagForChildDirectedTreatment: TagForChildDirectedTreatment.yes,
    maxAdContentRating: MaxAdContentRating.g,
  );
  await MobileAds.instance.updateRequestConfiguration(
    requestConfiguration,
  );
}
