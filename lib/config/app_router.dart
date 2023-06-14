import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/screens/cart_screen.dart';
import 'package:ecommerce_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../screens/catalog/catalog_screen.dart';
import '../screens/checkout/checkout_screen.dart';
import '../screens/order_confirmation/order_confirmation_screen.dart';
import '../screens/payment_selection/payment_selection_screen.dart';
import '../screens/product/product_screen.dart';
import '../screens/wishlist/wishlist_screen.dart';
import '../splash/splash_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is route: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();

      case CartScreen.routeName:
        return CartScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);

      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);

      case WishListScreen.routeName:
        return WishListScreen.route();

      case CheckoutScreen.routeName:
        return CheckoutScreen.route();

      case OrderConfirmationScreen.routeName:
        return OrderConfirmationScreen.route();

      case PaymentSelectionScreen.routeName:
        return PaymentSelectionScreen.route();

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
