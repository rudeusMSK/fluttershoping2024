import 'package:dio/dio.dart';
import 'package:mainpage_detailuser_v1/Model/Product.dart';
import 'package:mainpage_detailuser_v1/Model/Products/ProductCartItem.dart';

class ProductServices {
  static Future<List<ProductCart>> fetchProductCardList(int id) async {
    try {
      final Dio dio = Dio();

      dio.options.headers = {
        "Accept": "application/json",
        "Content-Type": "application/json"
      };

      String get = 
      id == 0
        ? "http://backendflutter2024.somee.com/api/ProductCartItem"
        : "http://backendflutter2024.somee.com/api/ProductCartItem?=$id";

      Response response = await dio
          .get('http://backendflutter2024.somee.com/api/ProductCartItem');

      List<dynamic> data = response.data;
      List<ProductCart> productCardList =
          data.map((item) => ProductCart.fromJson(item)).toList();
      return productCardList;
    } catch (e) {
      print('Error fetching product card list: $e');
      rethrow;
    }
  }

  static Future<Product> fetch_Product_Details(int? id) async {
    try {
      final Dio dio = Dio();
      dio.options.headers = {
        "Accept": "application/json",
        "Content-Type": "application/json"
      };

      Response response = await dio
          .get('http://backendflutter2024.somee.com/api/DetailProduct?id=$id');

      Map<String, dynamic> data = response.data;
      Product product = Product.fromJson(data);
      return product;
    } catch (e) {
      print('Error fetching product: $e');
      rethrow;
    }
  }
}
