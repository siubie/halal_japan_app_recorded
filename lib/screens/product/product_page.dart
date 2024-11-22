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
  //add text controller for search input
  final TextEditingController _searchController = TextEditingController();

  //add dispose method to dispose text controller
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  //call product fetch event
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(ProductFetch());
  }

  @override
  Widget build(BuildContext context) {
    //return bloc builder
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search Product Or Scan Barcode',
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //print search input
              print(_searchController.text);
            },
            icon: const Icon(Icons.search),
          ),
          //icon button to scan barcode
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.qr_code),
          ),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<ProductBloc>().add(ProductFetch());
              },
              child: ListView.builder(
                itemCount: state.hasReachedMax
                    ? state.products.length
                    : state.products.length + 1,
                itemBuilder: (context, index) {
                  if (index >= state.products.length && !state.hasReachedMax) {
                    //return button to load more page
                    // return Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Center(
                    //     child: ElevatedButton(
                    //       onPressed: () {
                    //         context.read<ProductBloc>().add(
                    //               ProductFetchNextPage(),
                    //             );
                    //       },
                    //       child: const Text('Load More'),
                    //     ),
                    //   ),
                    // );
                    // show progres indicator
                    context.read<ProductBloc>().add(
                          ProductFetchNextPage(),
                        );
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    final product = state.products[index];
                    return ProductItem(
                      title: product.name ?? '',
                      imageUrl: product.image ?? '',
                      subtitle: product.status ?? Status.HARAM,
                    );
                  }
                },
              ),
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
      ),
    );
  }
}
