import 'package:flutter/material.dart';

import '../models/product_model.dart';
import 'product_card.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  const ProductCarousel({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              right: 5.0,
            ),
            child: ProductCard(
              product: products[index],
            ),
          );
        }),
      ),
    );
  }
}
