import 'package:flutter/material.dart';
import 'package:halal_japan_recorded/repositories/product_repository.dart';
import 'package:halal_japan_recorded/models/product_response.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductRepository _productRepository = ProductRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Page'),
      ),
      body: FutureBuilder<ProductResponse>(
        future: _productRepository.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final products = snapshot.data!.data?.length;
            return Text('Products: Ada jumlahnya $products');
          } else {
            return const Center(child: Text('No products found'));
          }
        },
      ),
    );
  }
}
