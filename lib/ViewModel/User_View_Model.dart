// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/Model/CookieModel.dart';
import 'package:mainpage_detailuser_v1/Model/UserModel.dart';
import 'package:mainpage_detailuser_v1/Services/UserServices.dart';

class UserViewModel extends ChangeNotifier {
  //String? errorMessage;
  bool userIsLoading = false, isLogin = false; // defaul

  UserCookie? cookie; // cookie idUser-token
  User? user; // user informations
  int? _stateCode; // backend statusCode repons

  // Getter statusCode:
  int? get getStateCode => _stateCode;

  // Setter statusCode:
  set getStateCode(int? code) {
    _stateCode = code;
    notifyListeners(); // thông báo cập nhật statusCode
  }

  // Login Funtion => get Cookie:
  Future<void> fetch_User_Account(String username, String password) async {
    try {
      // fetch user Cookie:
      var fetchedCookie =
          await UserServices.fetch_User_Account(username, password);
      userIsLoading = true;
      // Check cookie:
      if (fetchedCookie != null) {
        cookie = fetchedCookie;
        print("user: ${cookie?.userID} - token: ${cookie?.token}");
        // Update StatusCode:
        getStateCode = UserServices.getStatusCode();
        //
        isLogin = true;
        // Fetch user information after successful login:
        await fetch_User_Informations();
      }
      // Backend Error:
      else if (UserServices.getStatusCode() == 500) {
        getStateCode = 500;
      }
      // StatusCode: !200
      else {
        print('Lỗi: endpoint reps:');
        print('status Code: ${UserServices.getStatusCode()}');
        getStateCode = UserServices.getStatusCode();
      }
    } catch (e) {
      print('Lỗi khi lấy cookie: $e');
      //errorMessage = 'Lỗi khi lấy cookie: $e';
      getStateCode = 500;
      user = null;
      notifyListeners();
    }
  }

  // User Account information Funtion => user infor
  Future<void> fetch_User_Informations() async {
    try {
      //Get user infor:
      user = await UserServices.fetch_User_Informations();
      // loading... is success => Update StatusCode.
      userIsLoading = true;
      getStateCode = UserServices.getStatusCode();
      notifyListeners();
    } catch (e) {
      //errorMessage = 'Lỗi khi đang fetch_User_Informations tại view: $e';
      //isUserInitialized = true;
      print('Lỗi khi đang fetch_User_Informations tại: $e');
      getStateCode = 500; // Đặt mã lỗi cho stateCode
      notifyListeners();
    }
  }

  bool isUserLoggedIn() {
    return cookie != null;
  }
}
