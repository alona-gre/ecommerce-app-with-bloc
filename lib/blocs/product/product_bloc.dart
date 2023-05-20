import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/product_model.dart';
import '../../repositories/product/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading()) {
    on<LoadProductsEvent>(_onLoadProductsEvent);
    on<UpdateProductsEvent>(_onUpdateProductsEvent);
  }

  void _onLoadProductsEvent(
    LoadProductsEvent event,
    Emitter<ProductState> emit,
  ) {
    _productSubscription?.cancel();
    _productSubscription = _productRepository.getAllProducts().listen(
          (products) => add(
            UpdateProductsEvent(
              products: products,
            ),
          ),
        );
  }

  void _onUpdateProductsEvent(
    UpdateProductsEvent event,
    Emitter<ProductState> emit,
  ) {
    emit(ProductLoaded(products: event.products));
  }
}
