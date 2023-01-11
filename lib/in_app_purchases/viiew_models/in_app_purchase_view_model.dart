// import 'dart:async';
//
// import 'package:in_app_purchase/in_app_purchase.dart';
//
// import '../../extensions/purchase_details_extension.dart';
// import '../../flavors.dart';
// import '../../utils/console_output.dart';
//
// const kPremium = 'premium';
//
// class InAppPurchaseViewModel {
//   StreamSubscription? _storeConnection;
//
//   ProductDetailsResponse? _productDetailsResponse;
//
//   Future<void> restorePurchases() async {
//     //TODO this doesn't work at all, method gets called, listener never fires
//     //TODO consider making this an inherited widget
//     log('InAppPurchaseViewModel').d('restorePurchases');
//     _storeConnection = purchaseStream.listen(
//       (purchases) async {
//         log('InAppPurchaseViewModel').d('purchases $purchases');
//         final productDetails = _productDetailsResponse?.productDetails ?? [];
//         for (var products in productDetails) {
//           final _hasPurchasedPremium = purchases.hasPurchasedPremium(
//             products,
//           );
//           if (_hasPurchasedPremium) {
//             log('InAppPurchaseViewModel').d('_hasPurchasedPremium $_hasPurchasedPremium');
//             F.appFlavor = Flavor.paid;
//           }
//         }
//       },
//     );
//     _productDetailsResponse = await productDetailsResponse();
//   }
//
//   final _inAppPurchase = InAppPurchase.instance;
//
//   Future<ProductDetailsResponse> productDetailsResponse() {
//     return _inAppPurchase.queryProductDetails({kPremium});
//   }
//
//   Future<bool> get isAvailable => _inAppPurchase.isAvailable();
//
//   Stream<List<PurchaseDetails>> get purchaseStream => _inAppPurchase.purchaseStream;
//
//   void dispose() {
//     _storeConnection?.cancel();
//   }
// }
