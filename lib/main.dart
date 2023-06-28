import 'package:ecommerce_app/blocs/auth/auth_bloc.dart';
import 'package:ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_app/blocs/payment/payment_bloc.dart';
import 'package:ecommerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_app/cubits/signup/signup_cubit.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/repositories/auth/auth_repository.dart';
import 'package:ecommerce_app/repositories/category/category_repository.dart';
import 'package:ecommerce_app/repositories/local_storage/local_storage_repository.dart';
import 'package:ecommerce_app/repositories/product/product_repository.dart';
import 'package:ecommerce_app/repositories/user/user_repository.dart';
import 'package:ecommerce_app/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'blocs/category/category_bloc.dart';
import 'blocs/checkout/checkout_bloc.dart';
import 'blocs/product/product_bloc.dart';
import 'config/app_router.dart';
import 'config/theme.dart';
import 'cubits/login/login_cubit.dart';
import 'repositories/checkout/checkout_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider(
          create: (context) => UserRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SignupCubit>(
            create: (context) => SignupCubit(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
              userRepository: context.read<UserRepository>(),
            ),
          ),
          BlocProvider(
            create: (_) => CartBloc()..add(LoadCart()),
          ),
          BlocProvider(
            create: (_) => PaymentBloc()
              ..add(
                LoadPaymentMethodEvent(),
              ),
          ),
          BlocProvider(
            create: (context) => CheckoutBloc(
              cartBloc: context.read<CartBloc>(),
              paymentBloc: context.read<PaymentBloc>(),
              checkoutRepository: CheckoutRepository(),
            ),
          ),
          BlocProvider(
            create: (_) => WishlistBloc(
              localStorageRepository: LocalStorageRepository(),
            )..add(StartWishlist()),
          ),
          BlocProvider(
            create: (_) => CategoryBloc(
              categoryRepository: CategoryRepository(),
            )..add(LoadCategoriesEvent()),
          ),
          BlocProvider(
            create: (_) => ProductBloc(
              productRepository: ProductRepository(),
            )..add(LoadProductsEvent()),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: theme(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: SplashScreen.routeName,
        ),
      ),
    );
  }
}
