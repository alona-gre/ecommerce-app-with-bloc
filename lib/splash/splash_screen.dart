import 'dart:async';

import 'package:ecommerce_app/blocs/auth/auth_bloc.dart';
import 'package:ecommerce_app/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    Timer(
        const Duration(seconds: 1),
        () => Navigator.pushNamedAndRemoveUntil(
            context, LoginScreen.routeName, (_) => false));

    const String url =
        'https://thumbs.dreamstime.com/b/simple-gradient-fire-phoenix-bird-logo-158339374.jpg';

    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) => previous.authUser != current.authUser!,
      listener: (context, state) {
        print('Splash screen Auth listener');
      },
      child: Scaffold(
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
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
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
      ),
    );
  }
}
