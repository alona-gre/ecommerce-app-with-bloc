import 'package:ecommerce_app/screens/cart_screen.dart';
import 'package:ecommerce_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../screens/catalog/catalog_screen.dart';
import '../screens/product/product_screen.dart';
import '../screens/wishlist/wishlist_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is route: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();

      case CartScreen.routeName:
        return CartScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route();

      case CatalogScreen.routeName:
        return CatalogScreen.route();

      case WishListScreen.routeName:
        return WishListScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
      ),
    );
  }
}
