part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

final class ProductFetch extends ProductEvent {}

final class ProductFetchNextPage extends ProductEvent {}

//add event for product search
final class ProductSearch extends ProductEvent {
  final String query;

  const ProductSearch({required this.query});

  @override
  List<Object> get props => [query];
}