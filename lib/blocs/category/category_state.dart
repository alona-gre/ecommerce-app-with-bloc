// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  List<Category> categories;

  CategoryLoaded({
    this.categories = const <Category>[],
  });

  @override
  List<Object> get props => [categories];
}
