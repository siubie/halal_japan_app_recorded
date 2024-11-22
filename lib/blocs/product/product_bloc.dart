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
        final ProductResponse products =
            await productRepository.fetchProducts();
        //get the current page from products
        final int? currentPage = products.meta!.currentPage;
        //get the has reached max from products
        final bool hasReachedMax = products.meta?.lastPage == currentPage;
        emit(
          ProductLoaded(
              products: products.data ?? [],
              hasReachedMax: hasReachedMax,
              currentPage: currentPage!),
        );
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });

    on<ProductFetchNextPage>((event, emit) async {
      try {
        final state = this.state as ProductLoaded;
        //create query parameters
        final Map<String, dynamic> queryParameters = {
          'page': state.currentPage + 1,
        };
        //call product repository
        final ProductResponse products = await productRepository.fetchProducts(
            queryParameters: queryParameters);
        //get the current page from products
        final int? currentPage = products.meta!.currentPage;
        //get the has reached max from products
        final bool hasReachedMax = products.meta?.lastPage == currentPage;
        emit(
          ProductLoaded(
              products: [...state.products, ...?products.data],
              // products: products.data ?? [],
              hasReachedMax: hasReachedMax,
              currentPage: currentPage!),
        );
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });

    on<ProductSearch>((event, emit) async {
      //when search event is called, emit loading state
      emit(ProductLoading());
    });
  }
}
