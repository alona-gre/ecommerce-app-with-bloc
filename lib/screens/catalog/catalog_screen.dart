import 'package:flutter/material.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_navbar.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';
  const CatalogScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CatalogScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Catalog',
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
