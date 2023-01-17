import 'package:in_app_purchase/in_app_purchase.dart';

import '../in_app_purchases/view_models/in_app_purchase_view_model.dart';

extension PurchaseDetailsExtension on List<PurchaseDetails> {
  bool hasPurchasedPremium() {
    return where(
      (purchase) => purchase.productID == kPremium,
    ).any(
      (purchase) => purchase.status == PurchaseStatus.purchased || purchase.status == PurchaseStatus.restored,
    );
  }
}
