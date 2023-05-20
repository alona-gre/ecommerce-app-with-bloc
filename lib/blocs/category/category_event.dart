// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

// initializes the CategoryBloc
class LoadCategoriesEvent extends CategoryEvent {}

// checks teh actual categories and displays them
class UpdateCategoriesEvent extends CategoryEvent {
  final List<Category> categories;

  const UpdateCategoriesEvent({
    required this.categories,
  });

  @override
  List<Object> get props => [categories];
}
