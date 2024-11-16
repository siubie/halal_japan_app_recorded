import 'package:flutter/material.dart';
import 'package:halal_japan_recorded/pages/product_item.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  //generate 20 dummy products data
  final List<Map<String, dynamic>> _products = List.generate(
    20,
    (index) => {
      'id': index,
      'title': 'Product ${index + 1}',
      'imageUrl': 'https://picsum.photos/150?random=$index',
      'price': (index + 1) * 9.99,
    },
  );

  @override
  Widget build(BuildContext context) {
    //use listview.builder to display the products
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProductItem(
              title: _products[index]['title'],
              imageUrl: _products[index]['imageUrl'],
              price: _products[index]['price'],
            ),
          );
        },
      ),
    );
  }
}
