import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mainpage_detailuser_v1/View/Main_screen.dart';
import 'package:mainpage_detailuser_v1/ViewModel/User_View_Model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

// MyApp:
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cửa Hàng Bán Đồ Thể Thao',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Main_screen(title: 'Trang Chủ'),
    );
  }
}
