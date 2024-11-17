import 'package:flutter/material.dart';
import 'package:halal_japan_recorded/repositories/product_repository.dart';
import 'package:halal_japan_recorded/models/product_response.dart';
import 'package:halal_japan_recorded/screens/product/product_item.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductRepository _productRepository = ProductRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductResponse>(
      future: _productRepository.fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final products = snapshot.data!.data?.length;
          //create listview builder using ProductItem widget
          return ListView.builder(
            itemCount: products,
            itemBuilder: (context, index) {
              final product = snapshot.data!.data![index];
              return ProductItem(
                title: product.name ?? 'No title',
                imageUrl: product.image ?? 'default_image_url',
                price: 1000,
              );
            },
          );
        } else {
          return const Center(child: Text('No products found'));
        }
      },
    );
  }
}
