// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/Model/Catregorys/CategoryModel.dart';
import 'package:mainpage_detailuser_v1/Services/CategoryService.dart';

class CategoryViewModel extends ChangeNotifier {
  late List<Category> categorys = [];

  void fetchListCategory() async {
    categorys = (await Categoryservice.fetchListCategory());
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
