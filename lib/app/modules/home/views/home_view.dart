import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trogenstore/app/models/product.dart';
import 'package:trogenstore/app/modules/home/controllers/home_controller.dart';
import 'package:trogenstore/app/modules/home/views/productdetail_view.dart';
import 'package:trogenstore/app/modules/home/widgets/product_card.dart';
import 'package:trogenstore/app/utils/app_colors.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'Trogon Store',
          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(controller.errorMessage.value),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    controller.errorMessage.value = '';
                    controller.isLoading.value = true;
                    await controller.fetchProducts();
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => controller.fetchProducts(isRefresh: true),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildCategorySection(
                    'New Arrivals', controller.newArrivals, context),
                buildCategorySection(
                    'Trending Products', controller.trendingProducts, context),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget buildCategorySection(
      String title, List<Product> products, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.32,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                var product = products[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(ProductdetailView(product: product));
                  },
                  child: buildProductCard(product),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProductCard(Product product) {
    double discountPrice = product.price - (product.price * 0.1);
    String randomImageUrl =
        'https://picsum.photos/200/300?random=${product.productId}';

    return ProductCard(
      image: randomImageUrl,
      productName: product.name,
      brand: product.brand,
      discount: discountPrice.toStringAsFixed(2),
      rating: product.rating.toString(),
      price: product.price.toStringAsFixed(2),
    );
  }
}
