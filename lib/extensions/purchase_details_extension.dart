import 'package:in_app_purchase/in_app_purchase.dart';

extension PurchaseDetailsExtension on List<PurchaseDetails> {
  bool hasPurchasedPremium(ProductDetails productDetail) {
    return where(
      (purchase) => purchase.productID == productDetail.id,
    ).any(
      (purchase) => purchase.status == PurchaseStatus.purchased,
    );
  }
}
