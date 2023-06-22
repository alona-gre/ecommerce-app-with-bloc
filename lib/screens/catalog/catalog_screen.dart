import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/product/product_bloc.dart';
import '../../models/category_model.dart';
import '../../models/product_model.dart';

class CatalogScreen extends StatelessWidget {
  final Category category;
  static const String routeName = '/catalog';

  const CatalogScreen({
    super.key,
    required this.category,
  });

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(category: category),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: category.name,
      ),
      bottomNavigationBar: const CustomNavBar(screen: routeName),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          if (state is ProductLoaded) {
            final List<Product> categoryProducts = state.products
                .where((prd) => (prd.category == category.name))
                .toList();
            return GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 16.0,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.15,
                ),
                itemCount: categoryProducts.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: ProductCard.catalog(
                      product: categoryProducts[index],
                    ),
                  );
                });
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    );
  }
}
