// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/Model/CookieModel.dart';
import 'package:mainpage_detailuser_v1/Model/UserModel.dart';
import 'package:mainpage_detailuser_v1/Services/UserServices.dart';
import 'package:mainpage_detailuser_v1/components/bodyWidgets/ErrorBody.dart';

class UserViewModel extends ChangeNotifier {
  UserCookie? cookie;
  User? user;
  String? errorMessage;
  bool isUserInitialized = false;

  var repStateCode = UserServices.getStatusCode();

  void fetch_User_Account(String username, String password) async {
    try {
      var fetchedCookie =
          await UserServices.fetch_User_Account(username, password);

      if (fetchedCookie != null) {
        cookie = fetchedCookie;
        print("user: ${cookie?.userID} - token: ${cookie?.token} ");
        notifyListeners();
      } else if (repStateCode == 500) {
      //  ErroBody(500);
        print('Lỗi: 500.');
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
        if (repStateCode == 500) {
        // Errorbody(500);
        } else if (repStateCode == 401) {
        //  Errorbody(401);
        }
        else if (repStateCode == 404) {
        // Errorbody(404);
        }
         else {
          print('Lỗi fetch_User_Informations viewModel');
         }
      }
      notifyListeners();
    } // báo lỗi chờ fix
    catch (e) {
      errorMessage = 'Lỗi khi đang fetch_User_Informations tại view: $e';
      isUserInitialized = true;
      notifyListeners();
    }
  }

  bool isUserLoggedIn() {
    return cookie != null;
  }

  // void ErroBody(var StatusCode) {
  //   // Xử lý khi lỗi 500 xảy ra
  //   errorMessage = '${StatusCode.toString()} Lỗi server. Vui lòng thử lại sau';
  //   notifyListeners();
  // }
}
