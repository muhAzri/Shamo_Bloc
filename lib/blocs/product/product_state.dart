part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductFailed extends ProductState {
  final String e;

  const ProductFailed(this.e);

  @override
  List<Object> get props => ['e'];
}

class CategoriesSuccess extends ProductState {
  final List<CategoryModel> categories;

  const CategoriesSuccess(this.categories);

  @override
  List<Object> get props => ['categories'];
}

class ProductSucces extends ProductState {}
