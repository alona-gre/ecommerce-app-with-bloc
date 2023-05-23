import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/checkout/checkout_bloc.dart';
import '../../widgets/order_summary.dart';

// class CheckoutScreen extends StatelessWidget {
//   static const String routeName = '/checkout';

//   const CheckoutScreen({super.key});

//   static Route route() {
//     return MaterialPageRoute(
//       settings: RouteSettings(name: routeName),
//       builder: (context) => CheckoutScreen(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: 'Checkout'),
//       bottomNavigationBar: CustomNavBar(screen: routeName),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: BlocBuilder<CheckoutBloc, CheckoutState>(
//           builder: (context, state) {
//             if (state is CheckoutLoading) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             if (state is CheckoutLoaded) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'CUSTOMER INFORMATION',
//                     style: Theme.of(context).textTheme.headline3,
//                   ),
//                   _buildTextFormField((value) {
//                     context
//                         .read<CheckoutBloc>()
//                         .add(UpdateCheckoutEvent(email: value));
//                   }, context, 'Email'),
//                   _buildTextFormField((value) {
//                     context
//                         .read<CheckoutBloc>()
//                         .add(UpdateCheckoutEvent(fullName: value));
//                   }, context, 'Full Name'),
//                   SizedBox(height: 20),
//                   Text(
//                     'DELIVERY INFORMATION',
//                     style: Theme.of(context).textTheme.headline3,
//                   ),
//                   _buildTextFormField((value) {
//                     context
//                         .read<CheckoutBloc>()
//                         .add(UpdateCheckoutEvent(address: value));
//                   }, context, 'Address'),
//                   _buildTextFormField((value) {
//                     context
//                         .read<CheckoutBloc>()
//                         .add(UpdateCheckoutEvent(city: value));
//                   }, context, 'City'),
//                   _buildTextFormField((value) {
//                     context
//                         .read<CheckoutBloc>()
//                         .add(UpdateCheckoutEvent(country: value));
//                   }, context, 'Country'),
//                   _buildTextFormField((value) {
//                     context
//                         .read<CheckoutBloc>()
//                         .add(UpdateCheckoutEvent(zipCode: value));
//                   }, context, 'ZIP Code'),
//                   SizedBox(height: 20),
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 60,
//                     alignment: Alignment.bottomCenter,
//                     decoration: BoxDecoration(color: Colors.black),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Center(
//                           child: Text(
//                             'SELECT A PAYMENT METHOD',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .headline3!
//                                 .copyWith(color: Colors.white),
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: () {},
//                           icon: Icon(
//                             Icons.arrow_forward,
//                             color: Colors.white,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     'ORDER SUMMARY',
//                     style: Theme.of(context).textTheme.headline3,
//                   ),
//                   OrderSummary()
//                 ],
//               );
//             } else {
//               return Text('Something went wrong');
//             }
//           },
//         ),
//       ),
//     );
//   }

//   Padding _buildTextFormField(
//     Function(String)? onChanged,
//     BuildContext context,
//     String labelText,
//   ) {
//     return Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: Row(
//         children: [
//           SizedBox(
//             width: 75,
//             child: Text(
//               labelText,
//               style: Theme.of(context).textTheme.bodyText1,
//             ),
//           ),
//           Expanded(
//             child: TextFormField(
//               onChanged: onChanged,
//               decoration: InputDecoration(
//                 isDense: true,
//                 contentPadding: const EdgeInsets.only(left: 10),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';
  const CheckoutScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Checkout',
      ),
      bottomNavigationBar: const CustomNavBar(screen: routeName),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:
            BlocBuilder<CheckoutBloc, CheckoutState>(builder: (context, state) {
          if (state is CheckoutLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CheckoutLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CUSTOMER INFORMATION',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                _buildTextFormField((value) {
                  context.read<CheckoutBloc>().add(
                        UpdateCheckoutEvent(email: value),
                      );
                }, context, 'Email'),
                _buildTextFormField((value) {
                  context.read<CheckoutBloc>().add(
                        UpdateCheckoutEvent(fullName: value),
                      );
                }, context, 'Name'),
                _buildTextFormField((value) {
                  context.read<CheckoutBloc>().add(
                        UpdateCheckoutEvent(address: value),
                      );
                }, context, 'Address'),
                Text(
                  'DELIVERY INFORMATION',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                _buildTextFormField((value) {
                  context.read<CheckoutBloc>().add(
                        UpdateCheckoutEvent(city: value),
                      );
                }, context, 'City'),
                _buildTextFormField((value) {
                  context.read<CheckoutBloc>().add(
                        UpdateCheckoutEvent(country: value),
                      );
                }, context, 'Country'),
                _buildTextFormField((value) {
                  context.read<CheckoutBloc>().add(
                        UpdateCheckoutEvent(zipCode: value),
                      );
                }, context, 'ZipCode'),
                Text(
                  'ORDER SUMMARY',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const OrderSummary(),
              ],
            );
          } else {
            return const Text('Something went wrong');
          }
        }),
      ),
    );
  }

  Padding _buildTextFormField(
    Function(String)? onChanged,
    BuildContext context,
    String labelText,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        SizedBox(
          width: 75,
          child: Text(
            labelText,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        Expanded(
          child: TextFormField(
            onChanged: onChanged,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.only(left: 10.0),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
