import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart/cart_bloc.dart';
import '../models/product_model.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  const CartProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            width: 100,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  '\$${product.price}',
                  style: Theme.of(context).textTheme.labelLarge,
                )
              ],
            ),
          ),
          const SizedBox(width: 10.0),
          BlocBuilder<CartBloc, CartState>(builder: (context, state) {
            //we don't let the user to add to cart while loading
            if (state is CartLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CartLoaded) {
              return Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context
                          .read<CartBloc>()
                          .add(RemoveProductFromCart(product));
                    },
                    icon: const Icon(
                      Icons.remove_circle,
                    ),
                  ),
                  Text('1', style: Theme.of(context).textTheme.labelLarge),
                  IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(AddProductToCart(product));
                    },
                    icon: const Icon(
                      Icons.add_circle,
                    ),
                  ),
                ],
              );
            } else {
              return const Text('Something went wrong');
            }
          }),
          const SizedBox(width: 10.0),
        ],
      ),
    );
  }
}
