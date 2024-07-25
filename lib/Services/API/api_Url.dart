// ignore_for_file: constant_identifier_names
class ApiUrls {
  // local:

  static const String GET_Product = 'http://localhost:60056/api/ProductAPI';
  static const String GET_ProductImage =
      'http://localhost:60056/api/ImageProductAPI/';

  // local Services:

  //static const String GET_ProductCartItem_Localhost = 'http://localhost:60056/api/ProductServices';

  static const String GET_UserCookie = "http://localhost:60056/api/UserServices/Login";

  // hosting:

  static const String GET_ProductCartItem = 'http://localhost:60056/api/ProductServices/GetProductCart/';
  // static const String GET_ProductCartItem = 'http://backendflutter2024.somee.com/api/ProductServices';
}
