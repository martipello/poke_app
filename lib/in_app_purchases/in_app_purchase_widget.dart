import 'package:flutter/widgets.dart';

class InAppPurchaseWidget extends InheritedWidget {
  const InAppPurchaseWidget( {
    Key? key,
    required this.hasPurchasedPremium,
    required Widget child,
  }) : super(key: key, child: child);

  final bool hasPurchasedPremium;

  static InAppPurchaseWidget of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<InAppPurchaseWidget>();
    assert(result != null, 'No InAppPurchaseWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(InAppPurchaseWidget old) {
    return true;
  }
}
