import 'dart:async';

import 'package:in_app_purchase/in_app_purchase.dart';

import '../../extensions/purchase_details_extension.dart';
import '../../flavors.dart';

const kPremium = 'premium';

class InAppPurchaseViewModel {
  InAppPurchaseViewModel() {
    addListener();
  }

  late StreamSubscription? storeConnection;

  bool hasPurchasedPremium = false;

  Future<void> restorePurchases() async {
    //ARTIFICIAL DELAY BECAUSE THE PLUGIN SUCKS
    Future.delayed(
      const Duration(milliseconds: 200),
    ).then(
      (_) {
        return _inAppPurchase.restorePurchases();
      },
    );
  }

  final _inAppPurchase = InAppPurchase.instance;

  Future<bool> get isAvailable => _inAppPurchase.isAvailable();

  Stream<List<PurchaseDetails>> get purchaseStream => _inAppPurchase.purchaseStream;

  void buyPremium(
    ProductDetails productDetail,
  ) {
    final purchaseParam = PurchaseParam(
      productDetails: productDetail,
    );
    InAppPurchase.instance.buyNonConsumable(
      purchaseParam: purchaseParam,
    );
  }

  Future<ProductDetailsResponse> productDetailsResponse() {
    return _inAppPurchase.queryProductDetails({kPremium});
  }

  void addListener() {
    storeConnection = purchaseStream.listen(
      (purchases) async {
        final _hasPurchasedPremium = purchases.hasPurchasedPremium();
        if (_hasPurchasedPremium) {
          hasPurchasedPremium = true;
          F.appFlavor = Flavor.paid;
        }
        for (var purchase in purchases) {
          if (purchase.pendingCompletePurchase) {
            _inAppPurchase.completePurchase(purchase);
          }
        }
      },
    );
  }

  void dispose() {
    storeConnection?.cancel();
  }
}
