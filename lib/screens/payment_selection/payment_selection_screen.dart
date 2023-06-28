import 'dart:io';

import 'package:ecommerce_app/blocs/payment/payment_bloc.dart';
import 'package:ecommerce_app/models/payment_method_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay/pay.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_navbar.dart';

class PaymentSelectionScreen extends StatelessWidget {
  const PaymentSelectionScreen({super.key});

  static const String routeName = '/payment_selection';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const PaymentSelectionScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Select a payment method',
      ),
      bottomNavigationBar: const CustomNavBar(screen: routeName),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<PaymentBloc, PaymentState>(
          builder: (context, state) {
            if (state is PaymentLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PaymentLoaded) {
              return ListView(
                padding: const EdgeInsets.all(20.0),
                children: [
                  Platform.isIOS
                      ? RawApplePayButton(
                          style: ApplePayButtonStyle.black,
                          type: ApplePayButtonType.buy,
                          onPressed: () {
                            context.read<PaymentBloc>().add(
                                  const SelectPaymentMethodEvent(
                                    paymentMethod: PaymentMethod.apple_pay,
                                  ),
                                );
                            Navigator.pop(context);
                          },
                        )
                      : const SizedBox(height: 10),
                  Platform.isAndroid
                      ? RawGooglePayButton(
                          type: GooglePayButtonType.pay,
                          onPressed: () {
                            context.read<PaymentBloc>().add(
                                  const SelectPaymentMethodEvent(
                                    paymentMethod: PaymentMethod.apple_pay,
                                  ),
                                );
                            Navigator.pop(context);
                          },
                        )
                      : const SizedBox(),
                  ElevatedButton(
                    onPressed: () {
                      context.read<PaymentBloc>().add(
                            const SelectPaymentMethodEvent(
                              paymentMethod: PaymentMethod.credit_card,
                            ),
                          );
                      Navigator.pop(context);
                    },
                    child: const Text('Pay with Credit Card'),
                  ),
                ],
              );
            } else {
              return const Text('Something went wrong');
            }
          },
        ),
      ),
    );
  }
}
