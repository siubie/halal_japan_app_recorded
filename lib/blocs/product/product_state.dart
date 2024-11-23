part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductLoading extends ProductState {}

final class ProductLoaded extends ProductState {
  final List<Product> products;
  final bool hasReachedMax;
  final int currentPage;

  const ProductLoaded({
    required this.products,
    required this.hasReachedMax,
    required this.currentPage,
  });

  @override
  List<Object> get props => [products, hasReachedMax, currentPage];

  ProductLoaded copyWith({
    List<Product>? products,
    bool? hasReachedMax,
    int? currentPage,
  }) {
    return ProductLoaded(
      products: products ?? this.products,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}

final class ProductError extends ProductState {
  final String message;

  const ProductError(this.message);

  @override
  List<Object> get props => [message];
}

final class ProductEmpty extends ProductState {}
