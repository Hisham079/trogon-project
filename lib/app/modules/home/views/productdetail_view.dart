import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trogenstore/app/models/product.dart';
import 'package:trogenstore/app/utils/app_colors.dart';

class ProductdetailView extends StatelessWidget {
  final Product product;

  const ProductdetailView({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String randomImageUrl =
        'https://picsum.photos/400/300?random=${product.productId}';
    double discountPrice = product.price - (product.price * 0.1);

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: AppColors.white,
              )),
          backgroundColor: AppColors.primary,
          title: Text(product.name,
              style: const TextStyle(
                  color: AppColors.white, fontWeight: FontWeight.w500))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(randomImageUrl,
                  width: double.infinity, height: 300, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            Text(product.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Brand: ${product.brand}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.orange, size: 20),
                const SizedBox(width: 5),
                Text('${product.rating}', style: const TextStyle(fontSize: 18)),
              ],
            ),
            const SizedBox(height: 10),
            Text('Price: \$${product.price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18)),
            Text('Discount Price: \$${discountPrice.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18, color: Colors.red)),
            const SizedBox(height: 20),
            const Text('Product Description',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(
              '${product.description}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
