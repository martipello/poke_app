import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rxdart/rxdart.dart';

import '../../flavors.dart';

const kDebugAndroidInterstitialAdUnitId = 'ca-app-pub-3940256099942544/1033173712';
const kIOSInterstitialAdUnitId = 'ca-app-pub-1989939591379723/4626800281';
const kAndroidInterstitialAdUnitId = 'ca-app-pub-1989939591379723/3449449986';

const kIOSAdUnitId = 'ca-app-pub-1989939591379723/1756704065';
const kAndroidAdUnitId = 'ca-app-pub-1989939591379723/1756704065';
const kDebugAdUnitId = 'ca-app-pub-3940256099942544/2247696110';

const kDefaultListAdFrequency = 8;
const kInterstitialAdFrequency = 6;

class GoogleAdsViewModel {
  final inlineAdaptiveBannerSize = BehaviorSubject<AdSize>();

  NativeAd? _nativeAd;
  InterstitialAd? _interstitialAd;

  AdWidget nativeAdWidget(
    BuildContext context,
  ) {
    return AdWidget(
      ad: NativeAd(
        adUnitId: kDebugMode
            ? kDebugAdUnitId
            : Platform.isIOS
                ? kIOSAdUnitId
                : kAndroidAdUnitId,
        request: const AdRequest(
          nonPersonalizedAds: true,
        ),
        listener: NativeAdListener(
          onAdLoaded: (ad) async {
            _nativeAd = (ad as NativeAd);
          },
          onAdFailedToLoad: (ad, _) {
            ad.dispose();
          },
        ),
        nativeTemplateStyle: NativeTemplateStyle(
          templateType: TemplateType.medium,
          cornerRadius: 16.0,
        ),
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
      request: const AdRequest(
        nonPersonalizedAds: true,
      ),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _interstitialAd?.setImmersiveMode(false);
        },
        onAdFailedToLoad: (error) {
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
    _nativeAd?.dispose();
    _interstitialAd?.dispose();
  }
}
