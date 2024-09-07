import 'package:get/get.dart';
import 'package:trogenstore/app/models/product.dart';
import 'package:trogenstore/app/services/product_services.dart';

class HomeController extends GetxController {
  var newArrivals = <Product>[].obs;
  var trendingProducts = <Product>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  final ProductService productService = ProductService();

  Future<void> fetchProducts({bool isRefresh = false}) async {
    try {
      if (!isRefresh) isLoading(true);

      var products = await productService.fetchProducts();
      if (products.isNotEmpty) {
        newArrivals.assignAll(products.take(5));
        trendingProducts.assignAll(products.skip(5).take(5));
      } else {
        errorMessage.value = 'No products found';
      }
    } catch (error) {
      errorMessage.value = 'Failed to load products. Please try again.';
    } finally {
      isLoading(false);
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    fetchProducts();
  }

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }
}
