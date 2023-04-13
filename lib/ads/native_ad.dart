import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../dependency_injection_container.dart';
import '../extensions/build_context_extension.dart';
import 'view_models/google_ads_view_model.dart';

class NativeAd extends StatefulWidget {
  @override
  State<NativeAd> createState() => _NativeAdState();
}

class _NativeAdState extends State<NativeAd> {
  final _googleAdsViewModel = getIt.get<GoogleAdsViewModel>();

  AdWidget? nativeAd;

  double get _adWidth => context.screenWidth - (2 * 16);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        nativeAd = _googleAdsViewModel.nativeAdWidget(context);
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
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: _adWidth,
        maxWidth: _adWidth,
        minHeight: 320,
        maxHeight: 400,
      ),
      child: nativeAd,
    );
  }
}
