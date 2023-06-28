import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

import '../models/product_model.dart';

class GooglePay extends StatelessWidget {
  final String total;
  final List<Product> products;

  const GooglePay({
    super.key,
    required this.total,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    // for each product in the list we are gonna have
    // a different PaymentItem object
    var paymentItems = products
        .map(
          (product) => PaymentItem(
            label: product.name,
            amount: product.price.toString(),
            type: PaymentItemType.item,
            status: PaymentItemStatus.final_price,
          ),
        )
        .toList();

    paymentItems.add(
      PaymentItem(
        label: 'Total',
        amount: total,
        type: PaymentItemType.total,
        status: PaymentItemStatus.final_price,
      ),
    );

    void onGooglePayResult(paymentResult) {
      debugPrint(paymentResult.toString());
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      child: GooglePayButton(
        paymentConfigurationAsset: 'payment_profile_google_pay.json',
        onPaymentResult: onGooglePayResult,
        paymentItems: paymentItems,
        type: GooglePayButtonType.pay,
        margin: const EdgeInsets.only(top: 10),
        loadingIndicator: const CircularProgressIndicator(),
      ),
    );
  }
}
