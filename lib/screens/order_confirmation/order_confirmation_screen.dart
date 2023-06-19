import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/order_summary.dart';
import 'package:ecommerce_app/widgets/order_summary_product_card.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_navbar.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key});

  static const String routeName = '/order_confirmation';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const OrderConfirmationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    String url = 'https://cdn-icons-png.flaticon.com/512/1511/1511853.png';

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Order confirmation',
      ),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: 300,
                ),
                Positioned(
                  top: (MediaQuery.of(context).size.height - 100) / 10,
                  child: Image.network(
                    url,
                    width: MediaQuery.of(context).size.width,
                    height: 225,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ORDER CODE: 5603',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'Thank you for your purchase with us!',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'ORDER CODE: 5603',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 10.0),
                  const OrderSummary(),
                  const Divider(thickness: 2),
                  const SizedBox(height: 5),
                  ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ProductCard.summary(
                        product: Product.products[0],
                        quantity: 2,
                      ),
                      ProductCard.summary(
                        product: Product.products[1],
                        quantity: 3,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
