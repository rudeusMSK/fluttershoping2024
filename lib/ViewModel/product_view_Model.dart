// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/Model/Products/Product.dart';
import 'package:mainpage_detailuser_v1/Model/Products/ProductCartItem.dart';
import 'package:mainpage_detailuser_v1/Model/Products/DiscountTime.dart';
import 'package:mainpage_detailuser_v1/Services/ProductServices.dart';

class ProductViewModel extends ChangeNotifier {
  late List<Product> products = [];
  late List<ProductCart> productCards = [];
  late Product product;
  DiscountTime timeSale = DiscountTime();

  Future<void> fetchProductCardList(int id) async {
    productCards = (await ProductServices.fetchProductCardList(id));
    print("product cart: $productCards");
    notifyListeners();
  }

  Future<Product> fetchProductDetails(int? id) async {
    try {
      print("id truyền vào hàm fetch :$id");
      product = await ProductServices.fetchProductDetails(id);
      notifyListeners();
      return product;
    } catch (e) {
      print("Error fetching product details: $e");
      rethrow;
    }
  }

   Future<void> fetchTimeSaler() async {
    try {
      // Thời điểm hiện tại
      DateTime now = DateTime.now();

      // Thời điểm tương lai giải sử gọi api trả về:
      DateTime future = DateTime(2024, 8, 28, 00, 00, 00);

      // Tính khoảng thời gian còn lại
      Duration remaining = future.difference(now);

      // Tính giờ, phút, giây
      int hours = remaining.inHours;
      int minutes = remaining.inMinutes % 60;
      int seconds = remaining.inSeconds % 60;

      print('Còn lại: $hours giờ $minutes phút $seconds giây');

      var hh = hours, mm = minutes, ss = seconds;
      
      timeSale.hh = hh.toString();
      timeSale.mm = mm.toString();
      timeSale.ss = ss.toString();
    } catch (e) {
      print('Error fetching product: $e');
      rethrow;
    }
  }

}
