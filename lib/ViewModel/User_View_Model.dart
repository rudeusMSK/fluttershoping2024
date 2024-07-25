// ignore: file_names
// ignore_for_file: unnecessary_brace_in_string_interps, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/Model/CookieModel.dart';
import 'package:mainpage_detailuser_v1/Services/UserServices.dart';

class UserViewModel extends ChangeNotifier {
  UserCookie? cookie;

  void fetch_User_Account(String username, String password) async {
    try {
      var fetchedCookie = await UserServices.fetch_User_Account(username, password);
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
}
