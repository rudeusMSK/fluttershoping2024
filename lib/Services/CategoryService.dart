// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:mainpage_detailuser_v1/Model/Catregorys/CategoryModel.dart';
import 'package:mainpage_detailuser_v1/Services/API/api_Url.dart';

class Categoryservice {
  static Future<List<Category>> fetchListCategory() async {
    try {
      final Dio dio = Dio();

      Response response = await dio .get(
        ApiUrls.getListCategory
      );

      List<dynamic> data = response.data;
      List<Category> categorylist = [];
      categorylist =
        data.map((item) => Category
        .fromJson(item))
        .toList();
        
      return categorylist;
      
    } catch (e) {
      print('Error fetching product card list: $e');
      rethrow;
    }
  }
}
