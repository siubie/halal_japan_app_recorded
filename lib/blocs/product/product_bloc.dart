import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:halal_japan_recorded/models/product_response.dart';
import 'package:halal_japan_recorded/repositories/product_repository.dart';
import 'package:halal_japan_recorded/screens/product/product_page.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({required ProductRepository productRepository})
      : super(ProductLoading()) {
    on<ProductFetch>((event, emit) async {
      emit(ProductLoading());
      try {
        //call product repository
        final products = await productRepository.fetchProducts();
        emit(ProductLoaded(products.data ?? []));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}
