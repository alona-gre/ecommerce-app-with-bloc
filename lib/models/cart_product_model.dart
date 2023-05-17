import 'package:ecommerce_app/models/product_model.dart';
import 'package:equatable/equatable.dart';

class CartProduct extends Equatable {
  final List<Product> products;
  const CartProduct({this.products = const <Product>[]});

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  String get subtotalToString => subtotal.toStringAsFixed(2);

  double deliveryFee(subtotal) {
    if (subtotal >= 30.0) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

  String get deliveryFeeToString => deliveryFee(subtotal).toStringAsFixed(2);

  String freeDelivery(subtotal) {
    if (subtotal > 30) {
      return 'You will have Free Delivery';
    } else {
      double missing = 30.0 - subtotal;
      return 'Add \$${missing.toStringAsFixed(2)} for Free Delivery';
    }
  }

  String get freeDeliveryFeeToString => freeDelivery(subtotal);

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  String get totalToString => total(subtotal, deliveryFee).toStringAsFixed(2);

  @override
  List<Object?> get props => [products];
}
