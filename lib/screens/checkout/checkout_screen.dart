import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/checkout/checkout_bloc.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/order_summary.dart';

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
                CustomTextFormField(
                  labelText: 'Email',
                  onChanged: (value) {
                    context.read<CheckoutBloc>().add(
                          UpdateCheckoutEvent(email: value),
                        );
                  },
                ),
                CustomTextFormField(
                  labelText: 'Name',
                  onChanged: (value) {
                    context.read<CheckoutBloc>().add(
                          UpdateCheckoutEvent(fullName: value),
                        );
                  },
                ),
                Text(
                  'DELIVERY INFORMATION',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                CustomTextFormField(
                  labelText: 'Address',
                  onChanged: (value) {
                    context.read<CheckoutBloc>().add(
                          UpdateCheckoutEvent(address: value),
                        );
                  },
                ),
                CustomTextFormField(
                  labelText: 'City',
                  onChanged: (value) {
                    context.read<CheckoutBloc>().add(
                          UpdateCheckoutEvent(city: value),
                        );
                  },
                ),
                CustomTextFormField(
                  labelText: 'Country',
                  onChanged: (value) {
                    context.read<CheckoutBloc>().add(
                          UpdateCheckoutEvent(country: value),
                        );
                  },
                ),
                CustomTextFormField(
                  labelText: 'ZipCode',
                  onChanged: (value) {
                    context.read<CheckoutBloc>().add(
                          UpdateCheckoutEvent(zipCode: value),
                        );
                  },
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(color: Colors.black),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: Text(
                          'SELECT A PAYMENT METHOD',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/payment_selection');
                        },
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
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
}
