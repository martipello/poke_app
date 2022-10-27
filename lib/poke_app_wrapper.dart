import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'dependency_injection_container.dart' as di;
import 'poke_app.dart';
import 'theme/base_theme.dart';
import 'theme/poke_app_theme.dart';


// ignore_for_file: avoid_classes_with_only_static_members
class PokeAppWrapper {
  static void init() async {
    runZonedGuarded<Future<void>>(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        await Firebase.initializeApp();
        FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
        if (kDebugMode) {
          await FirebaseCrashlytics.instance
              .setCrashlyticsCollectionEnabled(false);
        }
        await di.init();
        final appDocumentDir = await getApplicationDocumentsDirectory();
        Hive.init(appDocumentDir.path);
        runApp(
          BaseTheme(
            appTheme: pokeAppTheme,
            child: Builder(
              builder: (context) {
                return PokeApp(
                  theme: BaseTheme.of(context),
                );
              },
            ),
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
