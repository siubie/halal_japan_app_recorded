import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halal_japan_recorded/blocs/product/product_bloc.dart';
import 'package:halal_japan_recorded/models/product_response.dart';
import 'package:halal_japan_recorded/screens/product/product_item.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  //call product fetch event
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(ProductFetch());
  }

  @override
  Widget build(BuildContext context) {
    //return bloc builder
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductLoaded) {
          return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products[index];
              return ProductItem(
                title: product.name ?? '',
                imageUrl: product.image ?? '',
                subtitle: product.status ?? Status.HARAM,
              );
            },
          );
        } else if (state is ProductError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
