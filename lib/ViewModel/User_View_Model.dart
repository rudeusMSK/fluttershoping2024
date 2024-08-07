// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/Model/CookieModel.dart';
import 'package:mainpage_detailuser_v1/Model/UserModel.dart';
import 'package:mainpage_detailuser_v1/Services/UserServices.dart';

class UserViewModel extends ChangeNotifier {
  UserCookie? cookie;
  User? user;
  String? errorMessage;
  bool isUserInitialized = false;

  void fetch_User_Account(String username, String password) async {
    try {
      var fetchedCookie =
          await UserServices.fetch_User_Account(username, password);
      if (fetchedCookie != null) {
        cookie = fetchedCookie;
        print("user: $cookie");
        
        notifyListeners();
      } else {
        print('Lỗi: Không có dữ liệu trả về từ API.');
      }
    } catch (e) {
      print('Lỗi khi lấy cookie: $e');
    }
  }

  Future<void> fetch_User_Informations() async {
    try {
      user = await UserServices.fetch_User_Informations();
      isUserInitialized = true;
      if (user == null) {
        errorMessage = 'chưa đăng nhập kài.';
      }
      notifyListeners();
    } catch (e) {
      errorMessage = 'Lỗi: $e';
      isUserInitialized = true;
      notifyListeners();
    }
  }
}
