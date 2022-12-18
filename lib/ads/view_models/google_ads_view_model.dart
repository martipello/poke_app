import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../flavors.dart';

const kIOSAdUnitId = 'ca-app-pub-1989939591379723/7840951715';
const kAndroidAdUnitId = 'ca-app-pub-1989939591379723/6308378199';
const kDebugAdUnitId = 'ca-app-pub-3940256099942544/6300978111';
const kDefaultListAdFrequency = 6;

class GoogleAdsViewModel {
  BannerAd? _bannerAd;

  AdWidget bannerAdWidget() {
    return AdWidget(
      ad: BannerAd(
        size: AdSize.banner,
        adUnitId: kDebugMode
            ? kDebugAdUnitId
            : Platform.isIOS
            ? kIOSAdUnitId
            : kAndroidAdUnitId,
        request: const AdRequest(),
        listener: const BannerAdListener(),
      )..load(),
    );
  }

  bool showAdAtIndex(
    int index, {
    int adPerItemFrequency = kDefaultListAdFrequency,
  }) =>
      F.appFlavor != Flavor.paid && index % adPerItemFrequency == 0;

  void dispose() {
    _bannerAd?.dispose();
  }
}
