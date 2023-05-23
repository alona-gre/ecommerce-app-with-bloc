import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart/cart_bloc.dart';
import '../blocs/checkout/checkout_bloc.dart';
import '../blocs/wishlist/wishlist_bloc.dart';
import '/models/models.dart';

// class CustomNavBar extends StatelessWidget {
//   final String screen;
//   final Product? product;

//   const CustomNavBar({
//     Key? key,
//     required this.screen,
//     this.product,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       color: Colors.black,
//       child: Container(
//         height: 70,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: _selectNavBar(context, screen)!,
//         ),
//       ),
//     );
//   }

//   List<Widget>? _selectNavBar(context, screen) {
//     switch (screen) {
//       case '/':
//         return _buildNavBar(context);
//       case '/catalog':
//         return _buildNavBar(context);
//       case '/wishlist':
//         return _buildNavBar(context);
//       case '/product':
//         return _buildAddToCartNavBar(context, product);
//       case '/cart':
//         return _buildGoToCheckoutNavBar(context);
//       case '/checkout':
//         return _buildOrderNowNavBar(context);

//       default:
//         _buildNavBar(context);
//     }
//   }

//   List<Widget> _buildNavBar(context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.home, color: Colors.white),
//         onPressed: () {
//           Navigator.pushNamed(context, '/');
//         },
//       ),
//       IconButton(
//         icon: Icon(Icons.shopping_cart, color: Colors.white),
//         onPressed: () {
//           Navigator.pushNamed(context, '/cart');
//         },
//       ),
//       IconButton(
//         icon: Icon(Icons.person, color: Colors.white),
//         onPressed: () {
//           Navigator.pushNamed(context, '/user');
//         },
//       )
//     ];
//   }

//   List<Widget> _buildAddToCartNavBar(context, product) {
//     return [
//       IconButton(
//         icon: Icon(Icons.share, color: Colors.white),
//         onPressed: () {},
//       ),
//       BlocBuilder<WishlistBloc, WishlistState>(
//         builder: (context, state) {
//           if (state is WishlistLoading) {
//             return CircularProgressIndicator();
//           }
//           if (state is WishlistLoaded) {
//             return IconButton(
//               icon: Icon(Icons.favorite, color: Colors.white),
//               onPressed: () {
//                 final snackBar =
//                     SnackBar(content: Text('Added to your Wishlist!'));
//                 ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                 context.read<WishlistBloc>().add(AddProductToWishlist(product));
//               },
//             );
//           }
//           return Text('Something went wrong!');
//         },
//       ),
//       BlocBuilder<CartBloc, CartState>(
//         builder: (context, state) {
//           if (state is CartLoading) {
//             return CircularProgressIndicator();
//           }
//           if (state is CartLoaded) {
//             return ElevatedButton(
//               onPressed: () {
//                 context.read<CartBloc>().add(AddProductToCart(product));
//                 Navigator.pushNamed(context, '/cart');
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.white,
//                 shape: RoundedRectangleBorder(),
//               ),
//               child: Text(
//                 'ADD TO CART',
//                 style: Theme.of(context).textTheme.headline3,
//               ),
//             );
//           }
//           return Text('Something went wrong!');
//         },
//       )
//     ];
//   }

//   List<Widget> _buildGoToCheckoutNavBar(context) {
//     return [
//       ElevatedButton(
//         onPressed: () {
//           Navigator.pushNamed(context, '/checkout');
//         },
//         style: ElevatedButton.styleFrom(
//           primary: Colors.white,
//           shape: RoundedRectangleBorder(),
//         ),
//         child: Text(
//           'GO TO CHECKOUT',
//           style: Theme.of(context).textTheme.headline3,
//         ),
//       )
//     ];
//   }

//   List<Widget> _buildOrderNowNavBar(context) {
//     return [
//       BlocBuilder<CheckoutBloc, CheckoutState>(
//         builder: (context, state) {
//           if (state is CheckoutLoading) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           if (state is CheckoutLoaded) {
//             return ElevatedButton(
//               onPressed: () {
//                 context
//                     .read<CheckoutBloc>()
//                     .add(ConfirmCheckoutEvent(checkout: state.checkout));
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.white,
//                 shape: RoundedRectangleBorder(),
//               ),
//               child: Text(
//                 'ORDER NOW',
//                 style: Theme.of(context).textTheme.headline3,
//               ),
//             );
//           } else {
//             return Text('Something went wrong');
//           }
//         },
//       )
//     ];
//   }
// }

class CustomNavBar extends StatelessWidget {
  final String screen;
  final Product? product;

  const CustomNavBar({
    Key? key,
    required this.screen,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Container(
        height: 70,
        child: (screen == '/product')
            ? AddToCartNavBar(product: product!)
            : (screen == '/cart')
                ? const GoToCheckoutNavBar()
                : (screen == '/checkout')
                    ? const OrderNowNavBar()
                    : const HomeNavBar(),
      ),
    );
  }
}

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.home, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
        ),
        IconButton(
          icon: const Icon(Icons.person, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/user');
          },
        )
      ],
    );
  }
}

class AddToCartNavBar extends StatelessWidget {
  const AddToCartNavBar({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share, color: Colors.white),
        ),
        BlocBuilder<WishlistBloc, WishlistState>(
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                context.read<WishlistBloc>().add(AddProductToWishlist(product));

                const snackBar = SnackBar(content: Text('Added to Wishlist'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              icon: const Icon(Icons.favorite, color: Colors.white),
            );
          },
        ),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return ElevatedButton(
                onPressed: () {
                  context.read<CartBloc>().add(AddProductToCart(product));
                  Navigator.pushNamed(context, '/cart');
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: Text(
                  'ADD TO CART',
                  style: Theme.of(context).textTheme.displayMedium,
                ));
          },
        )
      ],
    );
  }
}

class GoToCheckoutNavBar extends StatelessWidget {
  const GoToCheckoutNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/checkout');
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            child: Text(
              'GO TO CHECKOUT',
              style: Theme.of(context).textTheme.displayMedium,
            ))
      ],
    );
  }
}

class OrderNowNavBar extends StatelessWidget {
  const OrderNowNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            if (state is CheckoutLoaded) {
              return ElevatedButton(
                onPressed: () {
                  context.read<CheckoutBloc>().add(
                        ConfirmCheckoutEvent(checkout: state.checkout),
                      );
                  print('order now pushed');
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: Text(
                  'ORDER NOW',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              );
            } else {
              return const Text('Something went wrong');
            }
          },
        ),
      ],
    );
  }
}
