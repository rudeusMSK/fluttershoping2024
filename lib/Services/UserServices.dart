// ignore_for_file: avoid_print, non_constant_identifier_names
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:mainpage_detailuser_v1/Model/CookieModel.dart';
import 'package:mainpage_detailuser_v1/Model/UserModel.dart';

class UserServices {
  static final Dio dio = Dio();
  static final CookieJar cookieJar = CookieJar();

  static Future<UserCookie?> fetch_User_Account(
      String userName, String password) async {
    dio.interceptors.add(CookieManager(cookieJar));

    try {
      dio.options.headers = {
        "Accept": "application/json",
        "Content-Type": "application/json"
      };

      var response = await dio.post(
        "http://backendflutter2024.somee.com/api/Login",
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

        // lấy cookies
        var cookies = await cookieJar.loadForRequest(
            Uri.parse("http://backendflutter2024.somee.com/api/Login"));

        for (var cookie in cookies) {
          print('Cookie: ${cookie.name}=${cookie.value}');
        }
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

  static Future<User?> fetch_User_Informations() async {

    try {
      dio.options.headers = {
        "Accept": "application/json",
        "Content-Type": "application/json"
      };

      var response =
          await dio.get("http://backendflutter2024.somee.com/api/userDetail");

      if (response.statusCode == 200) {
        print('Response Body: ${response.data}');
        Map<String, dynamic> data = response.data;
        User user = User.fromJson(data);
        return user;
      } else if (response.statusCode == 401 || response.statusCode == 404) {
        return null;
      } else {
        throw Exception('Failed to load user information');
      }
    } catch (e) {
      print('Lỗi: $e');
      throw Exception('Đã xảy ra lỗi: $e');
    }
  }
}
