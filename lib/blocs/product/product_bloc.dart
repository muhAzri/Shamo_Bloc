import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shamo/models/category_model.dart';
import 'package:shamo/services/product_service.dart';

import '../../models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>(
      (event, emit) async {
        if (event is CategoriesGet) {
          try {
            emit(ProductLoading());

            final categories = await ProductService().getCategories();

            emit(CategoriesSuccess(categories));
          } catch (e) {
            emit(
              ProductFailed(
                e.toString(),
              ),
            );
          }
        }
        if (event is GetPopularProduct) {
          try {
            emit(ProductLoading());

            final products = await ProductService().getPopularProduct();

            emit(
              ProductSucces(products),
            );
          } catch (e) {
            emit(
              ProductFailed(
                e.toString(),
              ),
            );
          }
        }
      },
    );
  }
}
