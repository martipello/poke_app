import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../dependency_injection_container.dart';
import 'view_models/google_ads_view_model.dart';

class ListBannerAd extends StatefulWidget {
  @override
  State<ListBannerAd> createState() => _ListBannerAdState();
}

class _ListBannerAdState extends State<ListBannerAd> {
  final _googleAdsViewModel = getIt.get<GoogleAdsViewModel>();

  late AdWidget bannerAd;

  @override
  void initState() {
    super.initState();
    bannerAd = _googleAdsViewModel.bannerAdWidget();
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
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: AdSize.banner.height.toDouble(),
        child: bannerAd,
      ),
    );
  }
}
