part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class LoadPaymentMethodEvent extends PaymentEvent {}

class SelectPaymentMethodEvent extends PaymentEvent {
  final PaymentMethod paymentMethod;

  const SelectPaymentMethodEvent({required this.paymentMethod});

  @override
  List<Object> get props => [paymentMethod];
}
