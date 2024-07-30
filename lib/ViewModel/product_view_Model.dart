// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/Model/Product.dart';
import 'package:mainpage_detailuser_v1/Model/Products/ProductCartItem.dart';
import 'package:mainpage_detailuser_v1/Services/ProductServices.dart';

class ProductViewModel extends ChangeNotifier {
  late List<Product> products = [];
  late List<ProductCart> productCards = [];
  late Product product;

  void fetch_Product_Card_List() async {
    int id = 0; 
    productCards = (await ProductServices.fetchProductCardList(id));
    print("product cart: $productCards");
    notifyListeners();
  }

  Future<Product> fetch_Product_Details(int? id) async {
    try {
      print("id truyền vào hàm fetch :$id");
      product = await ProductServices.fetch_Product_Details(id);
      notifyListeners();
      return product;
    } catch (e) {
      print("Error fetching product details: $e");
      rethrow;
    }
  }
}
