import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mainpage_detailuser_v1/Model/CookieModel.dart';
import 'package:mainpage_detailuser_v1/Model/Product.dart';

class UserServices {
  static Future<UserCookie?> fetch_User_Account(
      String userName, String password) async {
  try {
      final Dio dio = Dio();
      
      Options options = Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      var response = await dio.post(
        "http://localhost:56413/api/UserService/Login",
        data: {
          "userName": "user1",
          "password": "password1",
        },
      );

      print("Response Status Code: ${response.statusCode}");
      print("Response Data: ${response.data}");

      if (response.statusCode == 200) {
        var cookie = UserCookie.fromJson(response.data);
        print('UserCookie: ${cookie.toJson()}');

        return cookie;
        // test lỗi:
      } else if (response.statusCode == 404) {
        throw Exception('Tên đăng nhập hoặc mật khẩu không đúng.');
      } else if (response.statusCode == 500) {
        throw Exception('Lỗi máy chủ, vui lòng thử lại sau.');
      } else {
        throw Exception('Đã xảy ra lỗi không xác định.');
      }
    } catch (e) {
      print('Lỗi: $e');
      throw Exception('Đã xảy ra lỗi: $e');
    }
  }
}
