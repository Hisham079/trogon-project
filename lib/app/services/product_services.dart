import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductService {
  static const String apiUrl =
      'https://fake-store-api.mock.beeceptor.com/api/products';

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<Product> res = productFromJson(response.body);

        return res;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error: $e');

      throw Exception('Error fetching products: $e');
    }
  }
}
