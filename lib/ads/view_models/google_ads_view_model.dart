import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rxdart/rxdart.dart';

import '../../extensions/build_context_extension.dart';
import '../../flavors.dart';

const kDebugAndroidInterstitialAdUnitId = 'ca-app-pub-3940256099942544/1033173712';
const kIOSInterstitialAdUnitId = 'ca-app-pub-1989939591379723/4626800281';
const kAndroidInterstitialAdUnitId = 'ca-app-pub-1989939591379723/3449449986';

const kIOSAdUnitId = 'ca-app-pub-1989939591379723/1756704065';
const kAndroidAdUnitId = 'ca-app-pub-1989939591379723/1756704065';
const kDebugAdUnitId = 'ca-app-pub-3940256099942544/2247696110';

const kDefaultListAdFrequency = 10;
const kInterstitialAdFrequency = 6;

class GoogleAdsViewModel {
  InterstitialAd? _interstitialAd;

  final nativeAdIsLoaded = BehaviorSubject<bool>.seeded(false);

  NativeAd createNative(BuildContext context) {
    return NativeAd(
      adUnitId: kDebugMode
          ? kDebugAdUnitId
          : Platform.isIOS
              ? kIOSAdUnitId
              : kAndroidAdUnitId,
      nativeTemplateStyle: NativeTemplateStyle(
        templateType: TemplateType.medium,
        mainBackgroundColor: context.colors.onSurface,
        cornerRadius: 16.0,
        callToActionTextStyle: _createNativeTemplateTextStyle(context),
        primaryTextStyle: _createNativeTemplateTextStyle(context),
        secondaryTextStyle: _createNativeTemplateTextStyle(context),
        tertiaryTextStyle: _createNativeTemplateTextStyle(context),
      ),
      request: const AdRequest(
        nonPersonalizedAds: true,
      ),
      listener: NativeAdListener(
        onAdLoaded: (_) {
          nativeAdIsLoaded.add(true);
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
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

  NativeTemplateTextStyle _createNativeTemplateTextStyle(
    BuildContext context,
  ) {
    return NativeTemplateTextStyle(
      textColor: context.colors.onSurface,
      backgroundColor: context.colors.onSurface,
      style: NativeTemplateFontStyle.normal,
      size: 16.0,
    );
  }

  bool showAdAtIndex(
    int index, {
    int adPerItemFrequency = kDefaultListAdFrequency,
  }) =>
      F.appFlavor != Flavor.paid && index == adPerItemFrequency;

  void dispose() {
    nativeAdIsLoaded.close();
    _interstitialAd?.dispose();
  }
}
