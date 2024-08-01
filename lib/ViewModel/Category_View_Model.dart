// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/Model/CategoryModel.dart';
import 'package:mainpage_detailuser_v1/Services/CategoryService.dart';

class CategoryViewModel extends ChangeNotifier {
  late List<Category> categorys = [];

  void fetch_List_Category() async {
    categorys = (await Categoryservice.fetch_List_Category());
    // Defaul: All
    final Category allCategory = Category(iDLoai: 0, tenLoai: 'Tất cả');
    categorys.insert(0, allCategory);
    print("product cart: $Category");
    notifyListeners();
  }

  void addNewCategory(Category newCategory) {
    categorys.insert(0, newCategory);
    notifyListeners();
  }
}
