import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/category/category_bloc.dart';
import '../blocs/product/product_bloc.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_navbar.dart';
import '../widgets/hero_carousel_card.dart';
import '../widgets/product_card.dart';
import '../widgets/product_carousel.dart';
import '../widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  const HomeScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'My Shop name',
      ),
      bottomNavigationBar: const CustomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CategoryLoaded) {
                  return CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: false,
                        aspectRatio: 1.5,
                        viewportFraction: 0.9,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height),
                    items: state.categories
                        .map((ctgr) => HeroCarouselCard(category: ctgr))
                        .toList(),
                  );
                } else {
                  return const Text('Something went wrong');
                }
              },
            ),
            const SectionTitle(title: 'RECOMMENDED'),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductLoaded) {
                  return ProductCarousel(
                    products: state.products
                        .where(
                          (prd) => prd.isRecommended,
                        )
                        .toList(),
                  );
                } else {
                  return const Text("Something is wrong");
                }
              },
            ),
            const SectionTitle(title: 'POPULAR'),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductLoaded) {
                  return ProductCarousel(
                    products: state.products
                        .where(
                          (prd) => prd.isPopular,
                        )
                        .toList(),
                  );
                } else {
                  return const Text("Something is wrong");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
