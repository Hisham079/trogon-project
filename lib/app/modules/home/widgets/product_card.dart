import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductCard extends StatelessWidget {
  ProductCard(
      {super.key,
      required this.image,
      required this.productName,
      required this.brand,
      required this.discount,
      required this.rating,
      required this.price});
  String image;
  String productName;
  String brand;
  String price;
  String discount;
  String rating;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.network(image,
                  width: MediaQuery.of(context).size.width,
                  height: 110,
                  fit: BoxFit.cover),
            ),
            SizedBox(height: 8),
            Text(productName, style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Brand: ${brand}', style: TextStyle(fontSize: 12)),
            Text('Price: \$${price}', style: TextStyle(fontSize: 12)),
            Text('Discount: \$${discount}',
                style: TextStyle(color: Colors.red)),
            Row(
              children: [
                Icon(Icons.star, size: 14, color: Colors.orange),
                Text('${rating}', style: TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
