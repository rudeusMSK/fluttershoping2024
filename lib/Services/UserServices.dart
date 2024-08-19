import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:mainpage_detailuser_v1/Model/CookieModel.dart';
import 'package:mainpage_detailuser_v1/Model/UserModel.dart';

class UserServices {
  static final Dio dio = Dio()
  ..options.validateStatus = (status) => true;
  static final CookieJar cookieJar = CookieJar();
  static int? _statusCode;

  static int? getStatusCode() {
    return _statusCode;
  }

  static Future<UserCookie?> fetch_User_Account(
      String userName, String password) async {
    dio.interceptors.add(CookieManager(cookieJar));

    try {
      var response = await dio.post(
        "http://backendflutter2024.somee.com/api/Login",
        data: jsonEncode({
          "userName": userName,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        _statusCode = 200;
        var data = response.data;
        var token = data['Token'];

        var cookies = await cookieJar.loadForRequest(
            Uri.parse("http://backendflutter2024.somee.com/api/Login"));

        for (var cookie in cookies) {
          print('Cookie: ${cookie.name}=${cookie.value}');
        }
        return UserCookie.fromJson(data);
      } else {
        _statusCode = response.statusCode;
        return null;
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

      if (response.statusCode == 401) {
        _statusCode = 401;
        return null;
      }
      if (response.statusCode == 200) {
        _statusCode = 200;
        Map<String, dynamic> data = response.data;
        User user = User.fromJson(data);
        return user;
      } else {
        _statusCode = response.statusCode;
        return null;
      }
    } on DioException catch (e) {
      // dio error:
      print('Lỗi DioException: ${e.response?.statusCode}, ${e.message}');
      if (e.response != null) {
        print('Response data: ${e.response?.data}');
      }
    } catch (e) {
      // Các lỗi khác ngoài Dio
      print('Lỗi không mong muốn: $e');
    }
    return null;
  }

}
