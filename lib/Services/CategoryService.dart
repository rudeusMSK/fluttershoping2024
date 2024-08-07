// ignore_for_file: non_constant_identifier_names, avoid_print
import 'package:dio/dio.dart';
import 'package:mainpage_detailuser_v1/Model/CategoryModel.dart';

class Categoryservice {
  static Future<List<Category>> fetch_List_Category() async {
    try {
      final Dio dio = Dio();

      Response response = await dio .get(
        'http://backendflutter2024.somee.com/api/CategoryDTO'
        );
      List<dynamic> data = response.data;
      List<Category> categorylist = [];
      categorylist =
          data.map((item) => Category.fromJson(item)).toList();
      return categorylist;
    } catch (e) {
      print('Error fetching product card list: $e');
      rethrow;
    }
  }
}
