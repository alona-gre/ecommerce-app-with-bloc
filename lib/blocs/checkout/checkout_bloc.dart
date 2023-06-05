import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/cart_model.dart';
import '../../models/checkout_model.dart';
import '../cart/cart_bloc.dart';
import '/models/models.dart';
import '/repositories/checkout/checkout_repository.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final CheckoutRepository _checkoutRepository;
  StreamSubscription? _cartSubscription;
  StreamSubscription? _checkoutSubscription;

  CheckoutBloc({
    required CartBloc cartBloc,
    required CheckoutRepository checkoutRepository,
  })  : _cartBloc = cartBloc,
        _checkoutRepository = checkoutRepository,
        super(
          cartBloc.state is CartLoaded
              ? CheckoutLoaded(
                  products: (cartBloc.state as CartLoaded).cart.products,
                  deliveryFee:
                      (cartBloc.state as CartLoaded).cart.deliveryFeeToString,
                  subtotal:
                      (cartBloc.state as CartLoaded).cart.subtotalToString,
                  total: (cartBloc.state as CartLoaded).cart.totalToString,
                )
              : CheckoutLoading(),
        ) {
    on<UpdateCheckoutEvent>(_onUpdateCheckout);
    on<ConfirmCheckoutEvent>(_onConfirmCheckout);

// we are listeninng to the cartBloc to make sure we are up to date
    _cartSubscription = _cartBloc.stream.listen(
      (state) {
        if (state is CartLoaded) {
          add(
            UpdateCheckoutEvent(cart: state.cart),
          );
        }
      },
    );
  }

  void _onUpdateCheckout(
    UpdateCheckoutEvent event,
    Emitter<CheckoutState> emit,
  ) {
    if (state is CheckoutLoaded) {
      final state = this.state as CheckoutLoaded;
      emit(
        CheckoutLoaded(
            email: event.email ?? state.email,
            fullName: event.fullName ?? state.fullName,
            products: event.cart?.products ?? state.products,
            deliveryFee: event.cart?.deliveryFeeToString ?? state.deliveryFee,
            subtotal: event.cart?.subtotalToString ?? state.subtotal,
            total: event.cart?.totalToString ?? state.total,
            address: event.address ?? state.address,
            city: event.city ?? state.city,
            country: event.country ?? state.country,
            zipCode: event.zipCode ?? state.zipCode),
      );
    }
  }

  void _onConfirmCheckout(
    ConfirmCheckoutEvent event,
    Emitter<CheckoutState> emit,
  ) async {
    _checkoutSubscription?.cancel();
    if (state is CheckoutLoaded) {
      try {
        await _checkoutRepository.addCheckout(event.checkout);
        print('Done');
        emit(CheckoutLoading());
      } catch (_) {}
    }
  }

  @override
  Future<void> close() {
    _cartSubscription?.cancel();
    return super.close();
  }
}
