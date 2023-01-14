part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class CategoriesGet extends ProductEvent{}

class GetPopularProduct extends ProductEvent{}

class GetProdcuts extends ProductEvent{}
