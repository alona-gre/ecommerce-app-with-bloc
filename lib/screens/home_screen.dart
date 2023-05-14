import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';

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
            CarouselSlider(
              options: CarouselOptions(
                  autoPlay: false,
                  aspectRatio: 1.5,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height),
              items: Category.categories
                  .map((ctgr) => HeroCarouselCard(category: ctgr))
                  .toList(),
            ),
            const SectionTitle(title: 'RECOMMENDED'),
            ProductCarousel(
              products: Product.products
                  .where(
                    (prd) => prd.isRecommended,
                  )
                  .toList(),
            ),
            const SectionTitle(title: 'POPULAR'),
            ProductCarousel(
              products: Product.products
                  .where(
                    (prd) => prd.isPopular,
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
