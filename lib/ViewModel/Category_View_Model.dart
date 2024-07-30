import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/Model/CategoryModel.dart';
import 'package:mainpage_detailuser_v1/Services/CategoryService.dart';

class CategoryViewModel extends ChangeNotifier {
  late List<Category> categorys = [];
  // ignore: non_constant_identifier_names
  void fetch_List_Category() async {
    categorys = (await Categoryservice.fetch_List_Category());
    // ignore: avoid_print
    print("product cart: $Category");
    notifyListeners();
  }
}
