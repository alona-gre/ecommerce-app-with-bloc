import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/models/payment_method_model.dart';
import 'package:equatable/equatable.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentLoading()) {
    on<LoadPaymentMethodEvent>(_onLoadPaymentMethod);
    on<SelectPaymentMethodEvent>(_onSelectPaymentMethod);
  }

  void _onLoadPaymentMethod(
    LoadPaymentMethodEvent event,
    Emitter<PaymentState> emit,
  ) {
    emit(
      const PaymentLoaded(),
    );
  }

  void _onSelectPaymentMethod(
    SelectPaymentMethodEvent event,
    Emitter<PaymentState> emit,
  ) {
    emit(PaymentLoaded(
      paymentMethod: event.paymentMethod,
    ));
  }
}
