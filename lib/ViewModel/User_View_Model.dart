import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/Model/CookieModel.dart';
import 'package:mainpage_detailuser_v1/Model/UserModel.dart';
import 'package:mainpage_detailuser_v1/Services/UserServices.dart';

class UserViewModel extends ChangeNotifier {
  UserCookie? cookie;
  User? user;
  String? errorMessage;
  bool isUserInitialized = false;
  int? _stateCode;

  // Get stateCode
  int? get getStateCode => _stateCode;

  // Setter stateCode, thông báo đã có thay đổi.
  set getStateCode(int? code) {
    _stateCode = code;
    notifyListeners();
  }

  Future<void> fetch_User_Account(String username, String password) async {
    try {
      var fetchedCookie =
          await UserServices.fetch_User_Account(username, password);

      if (fetchedCookie != null) {
        cookie = fetchedCookie;
        // print("user: ${cookie?.userID} - token: ${cookie?.token}");
        getStateCode = UserServices.getStatusCode();

        // Fetch user information after successful login:
        await fetch_User_Informations();
      } else if (UserServices.getStatusCode() == 500) {
        // print('Lỗi: 500.');
        getStateCode = 500;
      } else {
        // print('Lỗi: Không có dữ liệu trả về từ API.');
        // print('status Code: ${UserServices.getStatusCode()}');
        getStateCode = UserServices.getStatusCode();
      }
    } catch (e) {
      // print('Lỗi khi lấy cookie: $e');
      errorMessage = 'Lỗi khi lấy cookie: $e';
      getStateCode = 500;
      notifyListeners();
    }
  }

  Future<void> fetch_User_Informations() async {
    try {
      user = await UserServices.fetch_User_Informations();
      isUserInitialized = true;
      getStateCode = UserServices
          .getStatusCode(); // Cập nhật stateCode sau khi fetch thông tin

      notifyListeners();
    } catch (e) {
      errorMessage = 'Lỗi khi đang fetch_User_Informations tại view: $e';
      isUserInitialized = true;
      getStateCode = 500; // Đặt mã lỗi cho stateCode
      notifyListeners();
    }
  }

  bool isUserLoggedIn() {
    return cookie != null;
  }
}
