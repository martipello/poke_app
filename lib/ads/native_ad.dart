import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart' as ads;
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../dependency_injection_container.dart';
import '../extensions/media_query_context_extension.dart';
import '../ui/shared_widgets/view_constraint.dart';
import 'view_models/google_ads_view_model.dart';

const kIOSAdUnitId = 'ca-app-pub-1989939591379723/1756704065';
const kAndroidAdUnitId = 'ca-app-pub-1989939591379723/1756704065';
const kDebugAdUnitId = 'ca-app-pub-3940256099942544/2247696110';

class NativeAd extends StatefulWidget {
  @override
  State<NativeAd> createState() => _NativeAdState();
}

class _NativeAdState extends State<NativeAd> with AutomaticKeepAliveClientMixin {
  final googleAdsViewModel = getIt.get<GoogleAdsViewModel>();

  late ads.NativeAd _nativeAd;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        _nativeAd = googleAdsViewModel.createNative(context);
        _nativeAd.load();
      },
    );
  }

  @override
  void dispose() {
    _nativeAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder<bool>(
      stream: googleAdsViewModel.nativeAdIsLoaded,
      builder: (context, snapshot) {
        final nativeAdIsLoaded = snapshot.data == true;
        return nativeAdIsLoaded
            ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ViewConstraint(
                  constraints: const BoxConstraints(
                    maxWidth: kMaxScreenWidth,
                    minHeight: 320,
                    maxHeight: 320,
                  ),
                  child: AdWidget(ad: _nativeAd),
                ),
            )
            : const SizedBox();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
