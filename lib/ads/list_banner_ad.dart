import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../dependency_injection_container.dart';
import '../extensions/build_context_extension.dart';
import 'view_models/google_ads_view_model.dart';

class ListBannerAd extends StatefulWidget {
  @override
  State<ListBannerAd> createState() => _ListBannerAdState();
}

class _ListBannerAdState extends State<ListBannerAd> {
  final _googleAdsViewModel = getIt.get<GoogleAdsViewModel>();

  AdWidget? bannerAd;

  double get _adWidth => context.screenWidth - (2 * 16);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        final adSize = AdSize.getCurrentOrientationInlineAdaptiveBannerAdSize(
          _adWidth.truncate(),
        );
        bannerAd = _googleAdsViewModel.bannerAdWidget(adSize);
      },
    );
  }

  @override
  void dispose() {
    _googleAdsViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: StreamBuilder<AdSize>(
          stream: _googleAdsViewModel.inlineAdaptiveBannerSize,
          builder: (context, snapshot) {
            final _adSize = snapshot.data;
            return Container(
              alignment: Alignment.center,
              width: _adWidth,
              height: _adSize?.height.toDouble(),
              child: bannerAd,
            );
          }),
    );
  }
}
