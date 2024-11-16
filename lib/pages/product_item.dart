import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;
  const ProductItem(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text('Price: \$${price.toStringAsFixed(2)}'),
      leading: Image.network(
        imageUrl,
        height: 100,
        width: 100,
      ),
    );
  }
}
