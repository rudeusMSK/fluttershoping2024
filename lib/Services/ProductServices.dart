// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:mainpage_detailuser_v1/Model/Products/Product.dart';
import 'package:mainpage_detailuser_v1/Model/Products/ProductCartItem.dart';
import 'package:mainpage_detailuser_v1/Services/API/api_Url.dart';

class ProductServices {
  static Future<List<ProductCart>> fetchProductCardList(int id) async {
    try {
      final Dio dio = Dio();

      dio.options.headers = {
        "Accept": "application/json",
        "Content-Type": "application/json"
      };

      String get_ = id == 0
          ? ApiUrls.getListProductCartItem
          : ApiUrls.getListProducByCategory + id.toString();

      print(get_);

      Response response = await dio.get(get_);

      List<dynamic> data = response.data;
      List<ProductCart> productCardList =
          data.map((item) => ProductCart.fromJson(item)).toList();
      return productCardList;
    } catch (e) {
      print('Error fetching product card list: $e');
      rethrow;
    }
  }

  static Future<Product> fetchProductDetails(int? id) async {
    try {
      final Dio dio = Dio();
      dio.options.headers = {
        "Accept": "application/json",
        "Content-Type": "application/json"
      };

      Response response =
          await dio.get(ApiUrls.getPorductDetail + id.toString());

      print(ApiUrls.getPorductDetail + id.toString());

      Map<String, dynamic> data = response.data;
      Product product = Product.fromJson(data);
      return product;
    } catch (e) {
      print('Error fetching product: $e');
      rethrow;
    }
  }
}
