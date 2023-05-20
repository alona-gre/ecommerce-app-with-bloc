part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

// initializes the ProductBloc
class LoadProductsEvent extends ProductEvent {}

// checks the actual products and displays them
class UpdateProductsEvent extends ProductEvent {
  final List<Product> products;

  const UpdateProductsEvent({
    required this.products,
  });

  @override
  List<Object> get props => [products];
}
