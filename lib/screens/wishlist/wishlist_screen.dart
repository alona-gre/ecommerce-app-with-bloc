import 'package:flutter/material.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_navbar.dart';

class WishListScreen extends StatelessWidget {
  static const String routeName = '/wishlist';
  const WishListScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const WishListScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'WishList',
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
