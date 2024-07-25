import 'package:dio/dio.dart';
import 'package:mainpage_detailuser_v1/Model/Products/ProductCartItem.dart';

class ProductServices {
  static Future<List<ProductCart>> fetchProductCardList() async {
    try {
      final Dio dio = Dio();
      // End Point:
      Response response =
          await dio.get('http://backendflutter2024.somee.com/api/ProductServices');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<ProductCart> productList =
            data.map((item) => ProductCart.fromJson(item)).toList();
        return productList;
      } else {
        throw Exception('Failed to load products card item -⁠﹏⁠-');
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}



