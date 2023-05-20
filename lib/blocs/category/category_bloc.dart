// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:ecommerce_app/repositories/category/category_repository.dart';

import '../../models/category_model.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubscription;

  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoading()) {
    on<LoadCategoriesEvent>(_onLoadCategories);
    on<UpdateCategoriesEvent>(_onUpdateCategories);
  }

  void _onLoadCategories(
    LoadCategoriesEvent event,
    Emitter<CategoryState> emit,
  ) {
    _categorySubscription?.cancel();
    _categorySubscription = _categoryRepository.getAllCategories().listen(
          (categories) => add(
            UpdateCategoriesEvent(
              categories: categories,
            ),
          ),
        );
  }

  void _onUpdateCategories(
    UpdateCategoriesEvent event,
    Emitter<CategoryState> emit,
  ) {
    emit(CategoryLoaded(categories: event.categories));
  }
}
