import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  const SplashScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () => Navigator.pushNamed(context, '/'));

    const String url =
        'https://thumbs.dreamstime.com/b/simple-gradient-fire-phoenix-bird-logo-158339374.jpg';
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.network(
              url,
              width: 325,
              height: 325,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              color: Colors.black,
              child: Text(
                'My Super Store',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
