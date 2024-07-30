import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mainpage_detailuser_v1/Model/CookieModel.dart';

class UserServices {
  static final Dio dio = Dio();
  static String? cookie;

  static Future<UserCookie?> fetch_User_Account(
      String userName, String password) async {
    try {
      dio.options.headers = {
        "Accept": "application/json",
        "Content-Type": "application/json"
      };

      var response = await dio.post(
        "http://localhost:56413/api/UserService/Login",
        data: jsonEncode({
          "userName": userName,
          "password": password,
        }),
      );

      print("Response Status Code: ${response.statusCode}");
      print("Response Data: ${response.data}");

      if (response.statusCode == 200) {
        var data = response.data;
        var token = data['Token'];
        print('Token: $token');

        // Lưu trữ giá trị của set-cookie
        cookie = response.headers['set-cookie']?.first;
        print('Cookie: $cookie');

        // Optionally, return any relevant information
        return UserCookie.fromJson(data);
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