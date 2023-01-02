import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../flavors.dart';

const kDebugAndroidInterstitialAdUnitId = 'ca-app-pub-3940256099942544/1033173712';
const kIOSInterstitialAdUnitId = 'ca-app-pub-1989939591379723/4626800281';
const kAndroidInterstitialAdUnitId = 'ca-app-pub-1989939591379723/3449449986';

const kIOSAdUnitId = 'ca-app-pub-1989939591379723/7840951715';
const kAndroidAdUnitId = 'ca-app-pub-1989939591379723/6308378199';
const kDebugAdUnitId = 'ca-app-pub-3940256099942544/6300978111';

const kDefaultListAdFrequency = 6;

class GoogleAdsViewModel {
  BannerAd? _bannerAd;
  InterstitialAd? _interstitialAd;

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

  void createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: kDebugMode
          ? kDebugAndroidInterstitialAdUnitId
          : Platform.isIOS
              ? kIOSInterstitialAdUnitId
              : kAndroidInterstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _interstitialAd!.setImmersiveMode(true);
        },
        onAdFailedToLoad: ( error) {
          _interstitialAd = null;
        },
      ),
    );
  }

  void showInterstitialAd() {
    final ad = _interstitialAd;
    if (ad != null) {
      ad.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (_) {},
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
        },
      );
      ad.show();
      _interstitialAd = null;
    }
  }

  bool showAdAtIndex(
    int index, {
    int adPerItemFrequency = kDefaultListAdFrequency,
  }) =>
      F.appFlavor != Flavor.paid && index % adPerItemFrequency == 0;

  void dispose() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
  }
}
