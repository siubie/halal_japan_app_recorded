import 'package:flutter/material.dart';
import 'package:halal_japan_recorded/models/product_response.dart';

class ProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Status subtitle;

  const ProductItem({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Builder(
        builder: (context) {
          switch (subtitle) {
            case Status.HALAL:
              return Text('Halal');
            case Status.HARAM:
              return Text('Haram');
            case Status.NO_CONTAMINATION:
              return Text('No Contamination');
            default:
              return Text('Unknown');
          }
        },
      ),
      leading: Image.network(
        imageUrl,
        height: 100,
        width: 100,
      ),
    );
  }
}
