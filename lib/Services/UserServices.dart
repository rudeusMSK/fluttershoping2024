// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:mainpage_detailuser_v1/Services/API/api_Url.dart';
import 'package:path_provider/path_provider.dart'; // Import thư viện để lấy đường dẫn lưu trữ
import 'package:mainpage_detailuser_v1/Model/Users/CookieModel.dart';
import 'package:mainpage_detailuser_v1/Model/Users/UserModel.dart';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;

class UserServices {
  static final Dio dio = Dio()..options.validateStatus = (status) => true;
  static PersistCookieJar? _cookieJar;
  static int? _statusCode;

  static int? getStatusCode() {
    return _statusCode;
  }

  // Hàm khởi tạo cookie jar với đường dẫn lưu trữ
  static Future<void> _initCookieJar() async {
    if (_cookieJar == null) {
      Directory appDocDir =
          await getApplicationDocumentsDirectory(); // Lấy thư mục lưu trữ tài liệu của ứng dụng
      String cookiePath =
          p.join(appDocDir.path, 'cookies'); // Đặt đường dẫn lưu trữ cookie

      _cookieJar = PersistCookieJar(
        storage: FileStorage(cookiePath),
      );
      dio.interceptors.add(CookieManager(_cookieJar!));
    }
  }

  static Future<UserCookie?> fetchUserAccount(
      String userName, String password) async {
    await _initCookieJar(); // Khởi tạo cookie jar

    // Xóa toàn bộ cookies trước khi gửi yêu cầu mới
    await _cookieJar!.deleteAll();

    try {
      // Post:
      var response = await dio.post(
        ApiUrls.postUserLogin,
        data: jsonEncode({
          "userName": userName,
          "password": password,
        }),
      );

      // Kiểm tra cookie trước khi gửi yêu cầu
      var cookies = await _cookieJar!.loadForRequest(
          Uri.parse(ApiUrls.postUserLogin));

      print("Cookies sẽ được gửi đi:");
      for (var cookie in cookies) {
        print('Cookie: ${cookie.name}=${cookie.value}');
      }

      // In response trả về từ API
      print("Response từ API:");
      print("Status Code: ${response.statusCode}");
      print("Headers: ${response.headers}");
      print("Data: ${response.data}");

      // 200: Oke
      if (response.statusCode == 200) {
        print('Cookie: 200');
        _statusCode = 200;
        var data = response.data;

        return UserCookie.fromJson(data);
      } else {
        _statusCode = response.statusCode;
        return null;
      }
    } catch (e) {
      print('Đã xảy ra lỗi khi fetch_User_Account đến backend: $e');
      throw Exception('Đã xảy ra lỗi khi fetch_User_Account đến backend: $e');
    }
  }

  static Future<User?> fetchUserInformations() async {
    await _initCookieJar(); // Khởi tạo cookie jar

    try {
      // Kiểm tra cookie trước khi gửi yêu cầu
      var cookies = await _cookieJar!.loadForRequest(
          Uri.parse(ApiUrls.getPorductDetail));

      print("Cookies sẽ được gửi đi:");
      for (var cookie in cookies) {
        print('Cookie: ${cookie.name}=${cookie.value}');
        print('Cookie (hạn sử dụng): ${cookie.name}=${cookie.expires}');
        DateTime now = DateTime.now();

        print("${now.hour}:${now.minute}:${now.second}");
      }

      dio.options.headers = {
        "Accept": "application/json",
        "Content-Type": "application/json"
      };

      var response =
          await dio.get(ApiUrls.getPorductDetail);

      // In response trả về từ API
      print("Response từ API:");
      print("Status Code: ${response.statusCode}");
      print("Headers: ${response.headers}");
      //print("Data: ${response.data}");

      // 200: Oke
      if (response.statusCode == 200) {
        _statusCode = response.statusCode;
        print('state code: $_statusCode');
        Map<String, dynamic> data = response.data;
        print('data: $data');
        User user = User.fromJson(data);
        return user;
      } 
      else {
        // khác 200 => trả về user = null
        _statusCode = response.statusCode;
        return null;
      }
    } catch (e) {
      print('Đã xảy ra lỗi khi fetch_User_Informations đến backend: $e');
      throw Exception(
          'Đã xảy ra lỗi khi fetch_User_Informations đến backend: $e');
    }
  }
}
